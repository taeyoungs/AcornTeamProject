package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	
	@RequestMapping("store/preorder.do")
	public ModelAndView preOrder() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/store/preOrder");
		return model;
	}
}
