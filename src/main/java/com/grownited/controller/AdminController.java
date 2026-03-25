package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.HackathonRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	HackathonRepository hackathonRepository;

	@Autowired
	UserRepository userRepository;

	@GetMapping(value = { "admin-dashboard", "/" })
	public String adminDashboard(Model model) {

		long totalHackathon = hackathonRepository.count();
		long totalUpcoming = hackathonRepository.countByStatus("UPCOMING");
		long totalCompleted = hackathonRepository.countByStatus("COMPLETED");
		long totalParticipant = userRepository.countByRole("PARTICIPANT");

		model.addAttribute("totalHackathon", totalHackathon);
		model.addAttribute("totalUpcoming", totalUpcoming);
		model.addAttribute("totalCompleted", totalCompleted);
		model.addAttribute("totalParticipant", totalParticipant);

		// chart
		List<Object[]> data = userRepository.getMonthUserCount();

		String month[] =  {"January","Feb","March","April","May"};
		
		long count[] = {1,2,3,4,5}; 
		 
		
		
		
		
		
		for(int i=0;i<data.size();i++) {
			month[i] = (String)data.get(i)[0];
			count[i] = (long)data.get(i)[1];
		}
		
		System.out.println(month[0]);
		System.out.println(count[0]);
		
		model.addAttribute("months",month);
		model.addAttribute("counts",count); 
		
		return "AdminDashboard";

	}

}
