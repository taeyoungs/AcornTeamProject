package com.team.zip.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.zip.model.vo.CartVO;
import com.team.zip.model.vo.OrderVO;
import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.CartService;
import com.team.zip.service.OrderService;
import com.team.zip.service.StoreProductService;

@Controller
public class OrderController {
	
	@Autowired
	private StoreProductService service;
	@Autowired
	private OrderService oservice;
	@Autowired
	private CartService caservice;
	
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
	
	@RequestMapping("store/preorderList.do")
	public String preorderList
	(@RequestParam String prodList, Model model, HttpSession session) {
		
		int member_no = (Integer)session.getAttribute("member_no");
		String login = (String) session.getAttribute("loginok");
		if (login != null && login.equals("login")) {
			
			List<CartVO> calist = new ArrayList<CartVO>();
			String prod[] = prodList.split(",");
			
			for (int i = 0; i < prod.length; i++) {
				int prod_no = Integer.parseInt(prod[i]);
				calist.add(caservice.getProd(member_no, prod_no));
			}

			//
			int totalPrice = 0;
			int totalDiscountPrice = 0;
			int totalPriceAfterDiscount = 0;

			for (int i = 0; i < calist.size(); i++) {
				
				int price = calist.get(i).getProd_price();
				int counts = calist.get(i).getCounts();
				int discount_rate = calist.get(i).getDiscount_rate();
				totalPrice += (price*counts);
				totalDiscountPrice += (double)price*((double)discount_rate/100);
				totalPriceAfterDiscount = totalPrice - totalDiscountPrice;
				
			}
			
			// 장바구니 선택한 물품 목록 ( ','로 저장되어 있는 문자열 )
			model.addAttribute("prodList", prodList);
			
			// 선택한 물품들 정보 리스트
			model.addAttribute("calist", calist);
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("totalDiscountPrice", totalDiscountPrice);
			model.addAttribute("totalPriceAfterDiscount", totalPriceAfterDiscount);
			
			return "/store/preorder";

		}else {

			return "/1/member/signin";
		
		}
	}
	
	@RequestMapping(value="store/orderResult.do", method=RequestMethod.POST)
	public String orderResult(
			@RequestParam(value = "prodTitle", defaultValue = "") String prodTitle, 
			@RequestParam(value = "counts", defaultValue = "1") int counts, 
			@RequestParam(value= "prodList", defaultValue = "") String prodList,
			OrderVO ovo, Model model, HttpServletRequest request, HttpSession session) {
		
		if(prodList.equals("")) {
			
			// 세션에 로그인 된 멤버 넘버 얻고 Orders Table에 저장
			int member_no = (Integer) session.getAttribute("member_no");
			ovo.setMember_no(member_no);
			oservice.insertOne(ovo);
			
			// 주문 리스트 최신목록 불러온 후 방금 저장된 항목의 order_no 불러와서 set
			List<OrderVO> ovo2 = oservice.orderRecent();
			int order_no = ovo2.get(0).getOrder_no();
			ovo.setOrder_no(order_no);
			
			oservice.blankCart(member_no);
			oservice.insertOneDetail(ovo);
			
			model.addAttribute("ovo", ovo);
			model.addAttribute("prodTitle",prodTitle);
			model.addAttribute("counts", counts);
		
		} else {
			
			int member_no = (Integer) session.getAttribute("member_no");
			ovo.setMember_no(member_no);
			
			// 주문 리스트 최신목록 불러온 후 방금 저장된 항목의 order_no 불러와서 set
			List<OrderVO> ovo2 = oservice.orderRecent();
			int order_no = ovo2.get(0).getOrder_no();
			ovo.setOrder_no(order_no);
			
			oservice.insertOne(ovo);
		
			String[] prodListSplit = prodList.split(",");
			for (int i = 0; i < prodListSplit.length; i++) {
				int prod = Integer.parseInt(prodListSplit[i]);
				CartVO cavo = caservice.getProdList(member_no, prod);
				ovo.setProd_no(prod);
				ovo.setCounts(cavo.getCounts());
				
				oservice.blankCart(member_no);
				oservice.insertOneDetail(ovo);
				
				model.addAttribute("ovo",ovo);
				
			}
			
		}
		
		return "/store/order_result";
		
		
	}
}
