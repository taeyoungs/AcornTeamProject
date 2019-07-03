package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopController {

	@RequestMapping("/member/login.do")
	public String gotoLoginForm() {
		
		return "/1/member/loginForm";
	}
	
}
