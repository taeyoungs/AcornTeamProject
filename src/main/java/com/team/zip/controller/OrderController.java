package com.team.zip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.StoreProductService;

@Controller
public class OrderController {
	
	@Autowired
	private StoreProductService service;
	
	@RequestMapping("store/preorder.do")
	public String preorder(@RequestParam String prodNo, @RequestParam int counts, Model model, HttpSession session) {
		
		
		System.out.println(prodNo);
		System.out.println(counts);
		
		String login = (String) session.getAttribute("loginok");
		if (login != null && login.equals("login")) {
			
			ProductVO pvo = service.getProductOne(prodNo);
			model.addAttribute("pvo", pvo);
			
			return "/store/preorder";

		}else {

			return "/1/member/signin";
		
		}
			
	}
	
	@RequestMapping("store/orderResult.do")
	public String orderResult(Model model, HttpServletRequest request) {
		
		return "/store/order_result";
	}
}
