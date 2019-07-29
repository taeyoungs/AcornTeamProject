
package com.team.zip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.service.CartService;
import com.team.zip.service.KakaoAPI;
import com.team.zip.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
    private KakaoAPI kakao;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private CartService caservice;
	
	
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
	public String signup(@ModelAttribute MemberVO mvo, Model model) {

		mservice.insertMember(mvo);
		model.addAttribute("loginCondition", "3");
		
		return "redirect:/main.do";
	}
	
	// 로그인 폼으로 이동
	@RequestMapping(value="/member/gotoSignin")
	public String gotoSignin(HttpServletRequest request, HttpSession session) {
		
		//이전페이지 URL(referer) 세션에 담기 [S] - 2019.07.24 SWPARK
		String referer = request.getHeader("referer");
		session.setAttribute("referer", referer);
		//이전페이지 URL(referer) 세션에 담기 [E]

		return "/1/member/signin";
	}
	
	// 로그인 처리
	// 1. 이메일이 다른 경우, 2. 비밀번호가 다른 경우
	@RequestMapping(value="/{path}/signin", method=RequestMethod.POST)
	public String signin(@PathVariable String path, @RequestParam String email, @RequestParam String pw, 
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
			fullEmail = fullEmail.trim();
			if(fullEmail.equals(email) && pw.equals(mvo.getMember_pw())) {
				// 이메일이랑 비밀번호가 일치하는 경우
				// 세션에 로그인 정보 저장하고 반복문 탈출
				String[] temp = email.split("@");
				int member_no = mservice.getMemberNo(temp[0], temp[1]);
				session.setAttribute("loginok", "login");
				session.setAttribute("member_no", member_no);
				session.setAttribute("mvo", mvo);
				session.setAttribute("cartCnt", caservice.getListCnt(member_no));
				session.setMaxInactiveInterval(21600);
				isMatch = true;
				break;
			} 
		}

		// isMatch가 true일 경우 이메일과 비밀번호가 일치하는 상황이며 세션에 그에 대한 정보를 저장해놓은 상태
		if(isMatch) {
		
			//세션에서 사용 완료된 referer 지우기 [S] - 2019.07.24 SWPARK
			String referer = (String)session.getAttribute("referer");
			if (referer != null) {
				session.removeAttribute("referer");
				return "redirect:"+referer;
			}
			//세션에서 사용 완료된 referer 지우기 [E]
			
			model.addAttribute("loginCondition", "1");
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
	public String logout(HttpSession session, Model model) {
		
		session.removeAttribute("loginok");
		session.removeAttribute("member_no");
		session.removeAttribute("mvo");
		
		model.addAttribute("loginCondition", "2");
		
		return "redirect:../main.do";
	}
	
	// 비밀번호 재설정 폼으로 이동
	@RequestMapping("/member/findPassword")
	public String findPassword() {
		
		return "/1/member/findPassword";
	}
	
	// 비밀번호 재설정 폼으로 이동
	@RequestMapping("/member/gotoKakao")
	public String gotoKakoLogin() {
			
		return "/1/member/loginForm";
	}
		
	// 카카오 로그인
	@RequestMapping(value="/member/login")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
//	    System.out.println("controller access_token : " + access_Token);
//		System.out.println("login Controller : " + userInfo);
		
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
