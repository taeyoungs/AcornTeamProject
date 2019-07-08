package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopController {

	@RequestMapping("/member/writelist")
	public String gotoLoginForm(Model model) {
		
		model.addAttribute("secondaryTop", "-51");
		
		return "/2/member/writelist";
	}
	
}
