package com.team.zip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.zip.model.vo.OrderVO;
import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.OrderService;
import com.team.zip.service.StoreProductService;

@Controller
public class OrderController {
	
	@Autowired
	private StoreProductService service;
	@Autowired
	private OrderService oservice;
	
	@RequestMapping("store/preorder.do")
	public String preorder
	(@RequestParam int idx, @RequestParam String prodNo, @RequestParam int counts, Model model, HttpSession session) {
		
		
		String login = (String) session.getAttribute("loginok");
		if (login != null && login.equals("login")) {
			
			if(idx==0) {
				
				ProductVO pvo = service.getProductOne(prodNo);
				model.addAttribute("prod_No", prodNo);
				model.addAttribute("counts", counts);
				model.addAttribute("pvo", pvo);
				return "/store/preorder";
			
			} else {
				 
				return "/store/preorder";
			}

		}else {

			return "/1/member/signin";
		
		}
	}
	
	@RequestMapping(value="store/orderResult.do", method=RequestMethod.POST)
	public String orderResult(@RequestParam String prodTitle, @RequestParam int counts, OrderVO ovo, Model model, HttpServletRequest request, HttpSession session) {
		
		// 세션에 로그인 된 멤버 넘버 얻고 Orders Table에 저장
		int member_no = (Integer) session.getAttribute("member_no");
		ovo.setMember_no(member_no);
		oservice.insertOne(ovo);
		
		// 주문 리스트 최신목록 불러온 후 방금 저장된 항목의 order_no 불러와서 set
		List<OrderVO> ovo2 = oservice.orderRecent();
		int order_no = ovo2.get(0).getOrder_no();
		ovo.setOrder_no(order_no);
		
		//String prodTitle = (String) request.getAttribute("prodTitle");
		
		
		oservice.insertOneDetail(ovo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("prodTitle",prodTitle);
		model.addAttribute("counts", counts);
		
		return "/store/order_result";
	}
}
