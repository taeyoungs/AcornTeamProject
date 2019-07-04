package com.team.zip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	MemberService mservice;

	@RequestMapping("/main.do")
	public String mainGo(HttpSession session, Model model)
	{
		if(session.getAttribute("member_no") != null) {
			int memberNo = (Integer)session.getAttribute("member_no");
			System.out.println(memberNo);
			MemberVO mvo = mservice.getMember(memberNo);
			System.out.println(mvo.getMember_image());
			model.addAttribute("mvo", mvo);
		}
	
		return "main.tiles";//tiles name 반환
	}
	
}

