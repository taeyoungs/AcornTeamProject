package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	@RequestMapping("/store/store.do")
	public String storeGo() {
		
		return "/store/storehome";
	}
	
}
