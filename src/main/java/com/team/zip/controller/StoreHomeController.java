package com.team.zip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoreHomeController {
	@RequestMapping("/store/store.do")
	   public String storeGo(HttpSession session, Model model,
	         @RequestParam(value="where", defaultValue = "storehome") String where) {
	      
	      session.removeAttribute("category");
	      session.setAttribute("category", "store");
	      
	      model.addAttribute("where", where);
	      
	      return "/store/storehome";
	   }
	
}
