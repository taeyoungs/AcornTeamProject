package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZipdleController {
	
	@RequestMapping(value="/zipdle/uploadform.do")
	public String gotoUpload() {
		
		return "/1/zipdle/uploadform";
	}
	
}
