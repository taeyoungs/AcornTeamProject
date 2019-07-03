package com.team.zip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.member.MemberVO;
import com.team.zip.model.photo.CombineVO;
import com.team.zip.model.photo.P_ReplyVO;
import com.team.zip.model.photo.PhotoVO;
import com.team.zip.service.CombineService;
import com.team.zip.service.MemberService;
import com.team.zip.service.P_ReplyService;
import com.team.zip.service.PhotoService;

@Controller
public class PhotoController {
	
	@Autowired
	private PhotoService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private P_ReplyService rservice;
	@Autowired
	private CombineService cservice;
	
	@RequestMapping("photo/photolist.do")
	public ModelAndView photo() {
		ModelAndView model = new ModelAndView();
		List<PhotoVO> list = service.getList();
		
		model.addObject("list",list);
		model.setViewName("/2/photo/list");
		return model;
	}
	
	@RequestMapping("photo/photowrite.do")
	public String photowrite() {
		return "/1/photo/writeform";
	}
	
	@RequestMapping(value="photo/write.do", method=RequestMethod.POST)
	public String write(@ModelAttribute PhotoVO pvo, HttpServletRequest request) {
		
		
		
		return "redirect:photolist.do";
	}
	
	@RequestMapping("photo/photodetail.do")
	public String photodetail(Model model, @RequestParam int num) {
		
		//조회 1증가
		service.photoUpdateReadcount(num);
		
		//데이터 가져오기
		PhotoVO pvo = service.getData(num);
		MemberVO mvo = mservice.getData(num);
		CombineVO cvo = cservice.getData(num);
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("cvo", cvo);
		
		return "/2/photo/detail";
	}
}

