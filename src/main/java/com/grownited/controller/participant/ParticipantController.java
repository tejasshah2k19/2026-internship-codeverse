package com.grownited.controller.participant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.repository.HackathonRepository;



@Controller
public class ParticipantController {

	@Autowired
	HackathonRepository hackathonRepository; 
	
	@GetMapping("/participant/participant-dashboard")
	public String participantDashboard( ) {
		return "participant/ParticipantDashboard";
	}
	
	@GetMapping("participant/home")
	public String home( Model model) {
		model.addAttribute("hackathons",hackathonRepository.findAll()); 
		return   "participant/Home";
	}
	
	
}
