package com.grownited.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.grownited.entity.UserDetailEntity;
import com.grownited.entity.UserEntity;
import com.grownited.entity.UserTypeEntity;
import com.grownited.repository.UserDetailRepository;
import com.grownited.repository.UserRepository;
import com.grownited.repository.UserTypeRepository;
import com.grownited.service.MailerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	UserTypeRepository userTypeRepository;

	@Autowired
	UserDetailRepository userDetailRepository;

	@Autowired
	MailerService mailerService;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	Cloudinary cloudinary;

	@GetMapping("/signup")
	public String openSignupPage(Model model) {

		List<UserTypeEntity> allUserType = userTypeRepository.findAll();
		// userType -> send Signup->
		model.addAttribute("allUserType", allUserType);
		return "Signup"; // jsp name
	}

	@GetMapping("/login")
	public String openLoginPage() {
		return "Login";
	}

	@PostMapping("/authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		Optional<UserEntity> op = userRepository.findByEmail(email);

		if (op.isPresent()) {
			UserEntity dbUser = op.get();

			if (passwordEncoder.matches(password, dbUser.getPassword())) {
				session.setAttribute("user", dbUser);
//			if (dbUser.getPassword().equals(password)) {
				if (dbUser.getRole().equals("ADMIN")) {
					return "redirect:/admin-dashboard";// url '
				} else if (dbUser.getRole().equals("PARTICIPANT")) {
					return "redirect:/participant/home";// url '
				} else if (dbUser.getRole().equals("JUDGE")) {
					if (Boolean.TRUE.equals(dbUser.getPasswordResetRequired())) {
						return "redirect:/judge/change-password";
					}
					return "redirect:/judge-dashboard";
				}
			}
		}

		model.addAttribute("error", "Invalid Credentials");
		return "Login";
	}

	@GetMapping("/forgetpassword")
	public String openForgetPassword() {
		return "ForgetPassword";
	}

	@PostMapping("/register")
	public String register(UserEntity userEntity, UserDetailEntity userDetailEntity, MultipartFile profilePic, Model model) {

		if (userEntity.getEmail() == null || userEntity.getPassword() == null) {
			model.addAttribute("error", "Email and password are required.");
			model.addAttribute("allUserType", userTypeRepository.findAll());
			return "Signup";
		}

		String email = userEntity.getEmail().trim().toLowerCase();
		if (userRepository.findByEmail(email).isPresent()) {
			model.addAttribute("error", "This email is already registered. Please login.");
			model.addAttribute("allUserType", userTypeRepository.findAll());
			return "Signup";
		}

		userEntity.setRole("PARTICIPANT");
		userEntity.setActive(true);
		userEntity.setPasswordResetRequired(false);
		userEntity.setCreatedAt(LocalDate.now());
		userEntity.setEmail(email);

		System.out.println("A");

		// encode password
		String encodedPassword = passwordEncoder.encode(userEntity.getPassword());
		userEntity.setPassword(encodedPassword);

		// file uploading
		if (profilePic != null && !profilePic.isEmpty()) {
			try {
				Map map = cloudinary.uploader().upload(profilePic.getBytes(), null);
				Object secureUrl = map.get("secure_url");
				if (secureUrl != null) {
					userEntity.setProfilePicURL(secureUrl.toString());
				}
			} catch (Exception e) {
				// profile pic is optional; continue signup even if upload fails
				e.printStackTrace();
			}
		}

		System.out.println("B");
		// users insert -> UserRepository
		// new -> X
		userRepository.save(userEntity); // users insert -> userId
		if (userDetailEntity.getQualification() == null) {
			userDetailEntity.setQualification(userEntity.getQualification());
		}
		userDetailEntity.setUserId(userEntity.getUserId());
		userDetailRepository.save(userDetailEntity);//

		System.out.println("C");
		// welcome mail send
		// mailerService.sendWelcomeMail(userEntity);
		return "Login";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login";
	}

}
