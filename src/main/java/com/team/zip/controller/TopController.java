package com.team.zip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.service.MemberService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class TopController {
	
	@Autowired
	MemberService mservice;

	@RequestMapping("/member/writelist")
	public String gotoLoginForm(Model model) {
		
		model.addAttribute("secondaryTop", "-51");
		
		return "/2/member/writelist";
	}
	
	@RequestMapping("/users/{path}")
	public String gotoUserPage(@PathVariable String path, Model model, HttpSession session) {
		
		model.addAttribute("pageType", path);
		if(path.equals("userPhoto")) {
			return "/3/users/userPhoto";
		} else if(path.equals("userZipdle")) {
			return "/3/users/userZipdle";
		} else if(path.equals("userQna")) {
			return "/3/users/userQna";
		} else if(path.equals("userLike")) {
			return "/3/users/userLike";
		} else if(path.equals("userUpdate")) {
			
			return "/3/users/userUpdate";
		} else if(path.equals("userChange")) {
			return "/3/users/userChange";
		} else {
			return "/3/users/userPhoto";
		}

	}
	
	@RequestMapping(value="/users/userUpload", method=RequestMethod.POST)
	public ModelAndView upload(HttpServletRequest request, @ModelAttribute MemberVO mvo,
			HttpSession session) {
		
		String path = "D:/springwork/AcornTeamProject/src/main/webapp/WEB-INF/uploadImage";
		System.out.println(path);
		
		String imagename = "";
		SpringFileWriter fileWriter = new SpringFileWriter();
		MultipartFile f = mvo.getProfile_image_uploader();
		if(f.getOriginalFilename().length() > 0) {
			imagename = f.getOriginalFilename();
			fileWriter.writeFile(f, path, f.getOriginalFilename());
		}
		
		if(imagename.length() == 0) {
			imagename = "noimage";
		}
		String birth = mvo.getMember_birth_1i()+"-"+mvo.getMember_birth_2i()+"-"+mvo.getMember_birth_3i();
		
		int memberNo = (Integer)session.getAttribute("member_no");
		mvo.setMember_no(memberNo);
		mvo.setMember_image(imagename);
		mvo.setMember_birth(birth);
		System.out.println(mvo.getProfile_image_uploader());
		System.out.println(mvo.getMember_birth());
		System.out.println(mvo.getMember_sex());
		System.out.println(mvo.getMember_image());
		mservice.updateMember(mvo);
//		MemberVO newMvo = mservice.getMember(memberNo);
		session.setAttribute("mvo", mvo);
		
		
		ModelAndView model = new ModelAndView();
		model.addObject("pathType", "userUpdate");
		model.setViewName("redirect:/users/userUpdate");
		
		return model;
	}
	
}
