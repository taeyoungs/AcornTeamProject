package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
	
	@RequestMapping("/store/category.do")
	public String categoryGo() {
		
		return "/categoryLayout/store/category";
	}
}
