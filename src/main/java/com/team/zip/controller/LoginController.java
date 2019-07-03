package com.team.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.zip.model.member.MemberVO;
import com.team.zip.service.KakaoAPI;
import com.team.zip.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
    private KakaoAPI kakao;
	
	@Autowired
	private MemberService mservice;
	
	// 회원가입 폼으로 이동
	@RequestMapping(value="/member/gotoSignup")
	public String gotoSignup(Model model) {
		
		return "/1/member/signup";
	}
	
	// 회원가입 폼에서 가입된 이메일 확인하기 위한 JSON 데이터 전송 메서드
	@RequestMapping(value="/member/getList", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getList() {
		
		List<MemberVO> idDomain = new ArrayList<MemberVO>();
		idDomain = mservice.getIdDomain();
		JSONObject jsonObj = new JSONObject();
		for (MemberVO mvo : idDomain) {
			jsonObj.put(mvo.getMember_id(), mvo.getMember_domain());
		}	
		
		return jsonObj;
	}
	
	@RequestMapping(value="/member/getNickname", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getNickname() {
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = mservice.getMemberList();
		JSONObject jsonObj = new JSONObject();
		int i = 0;
		for (MemberVO mvo : list) {
			jsonObj.put(i, mvo.getMember_nickname());
			i++;
		}
		
		return jsonObj;
	}
	
	// 회원가입시 데이터 저장 후 메인으로 이동
	@RequestMapping(value="/member/signup", method=RequestMethod.POST)
	public String signup(@ModelAttribute MemberVO mvo) {
		
//		mservice.insertMember(mvo);
		
		return "redirect:./main.do";
	}
	
	// 로그인 폼으로 이동
	@RequestMapping(value="/member/gotoSignin")
	public String gotoSignin() {
		
		return "/1/member/signin";
	}
	
	// 로그인 처리
	// 1. 이메일이 다른 경우, 2. 비밀번호가 다른 경우
	@RequestMapping(value="/member/signin", method=RequestMethod.POST)
	public String signin(@RequestParam String email, @RequestParam String pw, 
			HttpSession session, Model model) {
		
		// DB에 저장된 이메일, 비밀번호를 가져오기 위한 리스트
		List<MemberVO> mList = new ArrayList<MemberVO>();
		mList = mservice.getMemberList();
		// 이메일, 비밀번호 일치 여부 확인해줄 boolean 변수
		boolean isMatch = false;
		
		// 혹시 모를 공백 제거
		email = email.trim();
		pw = pw.trim();
		
		for (MemberVO mvo : mList) {
			String fullEmail = mvo.getMember_id()+"@"+mvo.getMember_domain();
//			System.out.println(pw);
//			System.out.println(mvo.getMember_pw());
//			fullEmail = fullEmail.trim();
//			System.out.println("fullEmail : "+fullEmail);
//			System.out.println("email : "+email);
			System.out.println(fullEmail.equals(email));
			System.out.println(pw.equals(mvo.getMember_pw()));
			if(fullEmail.equals(email) && pw.equals(mvo.getMember_pw())) {
				// 이메일이랑 비밀번호가 일치하는 경우
				// 세션에 로그인 정보 저장하고 반복문 탈출
				String[] temp = email.split("@");
				int member_no = mservice.getMemberNo(temp[0], temp[1]);
				session.setAttribute("loginok", "login");
				session.setAttribute("member_no", member_no);
				System.out.println(session.getAttribute("loginok"));
				System.out.println(session.getAttribute("member_no"));
				isMatch = true;
				break;
			} 
		}
		System.out.println("isMatch : "+isMatch);
		// isMatch가 true일 경우 이메일과 비밀번호가 일치하는 상황이며 세션에 그에 대한 정보를 저장해놓은 상태
		if(isMatch) {
			
			return "redirect:../main.do";
			
		} else {
			// isMatch false인 경우 이메일과 비밀번호가 불일치 다시 signin으로 맵핑
			model.addAttribute("login", "fail");
			model.addAttribute("email", email);
			return "/1/member/signin";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		session.removeAttribute("member_no");
		
		return "redirect:../main.do";
	}
	
	// 카카오 로그인
	@RequestMapping(value="/member/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
//	    System.out.println("controller access_token : " + access_Token);
		System.out.println("login Controller : " + userInfo);
		
		 //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	    }
		return "/1/member/loginForm";
	}
	
	@RequestMapping(value="/member/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    return "/1/member/loginForm";
	}
	
}
