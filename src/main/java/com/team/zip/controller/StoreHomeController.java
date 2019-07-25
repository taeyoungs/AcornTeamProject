package com.team.zip.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.StoreRankService;

@Controller
public class StoreHomeController {
	
	@Autowired
	StoreRankService service;
	
	@RequestMapping("/store/store.do")
	   public ModelAndView storeGo(HttpSession session,
			   @RequestParam(value="where", defaultValue = "storehome") String where) {
		
		ModelAndView model = new ModelAndView();
		
		Random ran = new Random();
		
		List<ProductVO> list = service.Top10List();
		List<ProductVO> todaydeal = service.Top10List();
	
	    model.addObject("where", where);
	    model.addObject("list", list);
	    model.addObject("todaydeal", todaydeal);
	    
	    session.removeAttribute("category");
	    session.setAttribute("category", "store");
	    
	    model.setViewName("/store/storehome");
	    return model;
	   }
	
}
