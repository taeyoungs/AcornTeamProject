package com.team.zip.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.zip.model.vo.CartVO;
import com.team.zip.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService caservice;

	@RequestMapping(value="/store/cart")
	public String goCart(HttpSession session, Model model) {
		
		int member_no = (Integer)session.getAttribute("member_no");
		int cartCnt = (Integer)session.getAttribute("cartCnt");
		System.out.println(cartCnt);
		
		List<CartVO> calist = new ArrayList<CartVO>();
		calist = caservice.getCartList(member_no);
		
		model.addAttribute("calist", calist);
		
		return "/4/store/cart";
	}
	
	@RequestMapping(value="/store/insertCart")
	@ResponseBody
	public JSONObject insertCart(@RequestParam int counts, @RequestParam int prod_no, HttpSession session) {
		
		// 로그인 아닐 때는 장바구니에 담을 수 없게끔 처리해놓은 상태
		int member_no = (Integer)session.getAttribute("member_no");
		
		// 1. 이미 장바구니에 동일한 상품이 존재할 경우
		if(caservice.getProdList(member_no, prod_no) != null) {
		
			caservice.updateProdCnt(member_no, prod_no, counts);
			
		// 2. 새로운 상품을 장바구니에 등록할 경우
		} else {
			
			caservice.insertCart(member_no, prod_no, counts);
			
		}
		
		JSONObject jsonObj = new JSONObject();
		
		return jsonObj;
	}
	
}
