package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StoreHomeController {
	@RequestMapping("/store/store.do")
	public String storeGo() {
		
		return "/store/ranks";
	}
	
	@RequestMapping("/store/rank.do")
	public ModelAndView rankGo() {
		ModelAndView model = new ModelAndView();
		
		
		model.setViewName("/store/ranks");
		return model;
	}
	
}
