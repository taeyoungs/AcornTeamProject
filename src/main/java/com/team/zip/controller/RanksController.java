package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RanksController {
	
	@RequestMapping("/store/ranks.do")
	public String ranksGo() {
		
		return "/store/ranks";
	}
}
