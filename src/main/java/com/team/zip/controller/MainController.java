package com.team.zip.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.MainCommunityVO;
import com.team.zip.model.vo.MemberVO;
import com.team.zip.service.MainService;
import com.team.zip.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/main.do")
	public ModelAndView mainGo(HttpSession session)
	{
		if(session.getAttribute("member_no") != null) {
			int memberNo = (Integer)session.getAttribute("member_no");
			MemberVO mvo = mservice.getMember(memberNo);
			
			session.setAttribute("mvo", mvo);
			session.setMaxInactiveInterval(10800);
		}
		
		List<MainCommunityVO> photoList = mainService.selectPhotoList();
		
		System.out.println("photoListSize = " + photoList.size());
		
		for (int i=0; i<photoList.size(); i++) {
//			System.out.println("i="+i);
			MainCommunityVO vo = photoList.get(i);
			if (vo == null) {
//				System.out.println("vo is null!");
				continue;
			} else {
//				System.out.println("photoImage="+vo.getPhotoImage());
			}
				
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("photoList", photoList);
		mav.setViewName("/main/main");
		return mav;
	}
	
	
	
}

