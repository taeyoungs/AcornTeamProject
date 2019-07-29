package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {

	@RequestMapping(value="/store/cart")
	public String goCart(@RequestParam String prodNo) {
		
		System.out.println(prodNo);
		
		return "/4/store/cart";
	}
	
}
