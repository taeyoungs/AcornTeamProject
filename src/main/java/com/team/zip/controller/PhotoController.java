package com.team.zip.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.PhotoCombineVO;
import com.team.zip.model.vo.PhotoReplyVO;
import com.team.zip.model.vo.PhotoVO;
import com.team.zip.service.CombineService;
import com.team.zip.service.MemberService;
import com.team.zip.service.PhotoReplyService;
import com.team.zip.service.PhotoService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class PhotoController {
	
	@Autowired
	private PhotoService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private PhotoReplyService rservice;
	@Autowired
	private CombineService cservice;
	
	@RequestMapping("photo/photolist.do")
	public ModelAndView photo(@RequestParam String where) {

		ModelAndView model = new ModelAndView();
		List<PhotoVO> list = service.getList();
		List<MemberVO> mlist = mservice.getMemberList();
		List<PhotoCombineVO> clist = cservice.getReplyData();
		
		model.addObject("where", where);
		model.addObject("list",list);
		model.addObject("mlist",mlist);
		model.addObject("clist", clist);
		model.setViewName("/2/photo/list");
		return model;
	}
	
	@RequestMapping("photo/photoSortlist.do")
	public ModelAndView photoSortList(@RequestParam int idx, @RequestParam String value) {

		ModelAndView model = new ModelAndView();
		List<PhotoVO> list = service.getList();
		List<MemberVO> mlist = mservice.getMemberList();
		List<PhotoCombineVO> clist = cservice.getReplyData();
		
		if(idx==1) {
			list = service.photoSortByHits();
		}else if(idx==2) {
			list = service.photoSortByNew();
		}else if(idx==3 || idx==4) {
			list = service.photoSortByHomeType(value);
		}else if(idx==5 || idx==6) {
			list = service.photoSortByPyeong(value);
		}
	
		model.addObject("list",list);
		model.addObject("mlist",mlist);
		model.addObject("clist", clist);
		model.setViewName("/2/photo/list");
		return model;
	}
	
	
	
	@RequestMapping("photo/photowrite.do")
	public String photowrite(HttpSession session) {
		
		String login = (String)session.getAttribute("loginok");
		if(login != null && login.equals("login")) {
	         
			 return "/1/photo/writeform";
	         
	    } else {
	  
	         return "/1/member/signin";
	    }
	}
	
	@RequestMapping(value="photo/write.do", method=RequestMethod.POST)
	public String write(@ModelAttribute PhotoVO pvo, HttpServletRequest request) {
		service.photoInsert(pvo);
		return "redirect:photolist.do";
	}
	
	
	@RequestMapping(value="photo/writeComment.do", method=RequestMethod.POST)
	@ResponseBody
	public List<PhotoCombineVO> writeComment(@ModelAttribute PhotoReplyVO rvo) {
		
		List<PhotoCombineVO> clist = null;
			
			if (rvo.getP_reply_content()==null) {
				clist = cservice.getData(rvo.getP_reply_no());	
			}else{
				rservice.insertReply(rvo);
				clist = cservice.getData(rvo.getP_reply_no());	
			}
			return clist;
	}
	
	@RequestMapping("photo/photodetail.do")
	public String photodetail(Model model, @RequestParam int num) {
		
		//조회 1증가
		service.photoUpdateReadcount(num);
		
		//데이터 가져오기
		PhotoVO pvo = service.getData(num);
		MemberVO mvo = mservice.getData(num);
		List<PhotoCombineVO> cvo = cservice.getData(num);

		String[] hashtag = pvo.getHashtag().split(",");
	
		model.addAttribute("pvo", pvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("hashtag", hashtag);
		
		return "/2/photo/detail";
	}
  
	@RequestMapping(value="/photo/upload.do", method=RequestMethod.POST)
	public String photoUpload(@RequestParam MultipartFile photo, HttpServletRequest request) {
		
		String path = request.getSession().getServletContext().getRealPath("/image/photoimage");
		System.out.println(path);
		
		String filename = photo.getOriginalFilename();
		SpringFileWriter filewriter = new SpringFileWriter();
		
		return "redirect:photolist.do";
	}
	
}

