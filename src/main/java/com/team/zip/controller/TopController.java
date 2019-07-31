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
		
		return "/4/member/writelist";
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
			return "/3/users/userPwChange";
		} else {
			return "/3/users/userPhoto";
		}

	}
	
	@RequestMapping(value="/users/userUpload", method=RequestMethod.POST)
	public ModelAndView upload(HttpServletRequest request, @ModelAttribute MemberVO mvo,
			HttpSession session) {
		
		String path = "D:/acornproject/TeamProject/src/main/webapp/WEB-INF/uploadImage";
		System.out.println(path);
		
		System.out.println(mvo.getProfile_image_uploader());
		
		String imagename = "";
		MemberVO oldMVO = (MemberVO)session.getAttribute("mvo");
		SpringFileWriter fileWriter = new SpringFileWriter();
		MultipartFile f = mvo.getProfile_image_uploader();
		System.out.println(f);
		if(f.getOriginalFilename().length() > 0) {
			imagename = f.getOriginalFilename();
			// 기존에 업로드 되어있던 이미지 파일을 삭제
//			fileWriter.deleteFile(path, oldMVO.getMember_image());
			// 새로운 이미지 파일 업로드
			fileWriter.writeFile(f, path, f.getOriginalFilename());
		}
		
		if(imagename.length() == 0) {
			imagename = "noimage";
		}
		System.out.println(imagename);
		
		// lastIndexOf를 이용해서 파일 이름과 확장자를 분리
		int lastIndex = imagename.lastIndexOf(".");
        String fileName = imagename.substring(0, lastIndex);
        String extension = imagename.substring(lastIndex + 1);
		
		String filePath = path+"/"+imagename;
		System.out.println(fileName);
		System.out.println(extension);
		System.out.println(filePath);
		// 썸네일 이미지 만드는 메서드 호출
		try {
			fileWriter.makeThumbnail(filePath, fileName, extension);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		String birth = mvo.getMember_birth_1i()+"-"+mvo.getMember_birth_2i()+"-"+mvo.getMember_birth_3i();
		
		int memberNo = (Integer)session.getAttribute("member_no");
		mvo.setMember_no(memberNo);
		mvo.setMember_image("THUMB_"+imagename);
		mvo.setMember_birth(birth);
		mservice.updateMember(mvo);
//		MemberVO newMvo = mservice.getMember(memberNo);
		session.setAttribute("mvo", mvo);
		
		
		ModelAndView model = new ModelAndView();
		model.addObject("pathType", "userUpdate");
		model.setViewName("redirect:/users/userUpdate");
		
		return model;
	}
	
	@RequestMapping("/users/pwChange")
	public String pwChange(@RequestParam String changeOk, @RequestParam String user_password,
			@RequestParam int member_no, Model model) {
		
		// 비밀번호가 조건이 맞아 변경 진행
		if(changeOk.equals("yes")) {
			model.addAttribute("changeOk", "success");
			// 비밀번호 업데이트
			MemberVO mvo = new MemberVO();
			mvo.setMember_no(member_no);
			mvo.setMember_pw(user_password);
			mservice.updatePw(mvo);
		// 조건이 안맞아서 알림창 띄우기
		} else {
			model.addAttribute("changeOk", "fail");
			
		}
		model.addAttribute("pageType", "userChange");
		return "/3/users/userPwChange";
	}
	
}
