package com.team.zip.util;

import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.service.MemberService;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService mservice;
	
	// mailSending 코드
	@RequestMapping(value ="/member/sendPwEmail")
	public String mailSending(@RequestParam String email, Model model) {
		
		String uuid = "";
		for (int i = 0; i < 5; i++) { 
	        uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
	        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
	    } 
		
		String temp[] = email.split("@");
		String setfrom = "";
		if(temp[1].equals("gmail.com")) {
			setfrom = "xoxodudwkd@gmail.com";
		} else if(temp[1].equals("daum.net")) {
			setfrom = "xoxodudwkd@daum.net";
		} else if(temp[1].equals("naver.com")) {
			setfrom = "xoxodudwkd@naver.com";
		}
		
		System.out.println(temp[0]);
		System.out.println(temp[1]);
		
		String tomail = email;
		String title = "혼자하는 인테리어 비밀번호 재설정";
		String content = "임시 비밀번호 : "+uuid; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		MemberVO mvo = new MemberVO();
		int member_no = mservice.getMemberNo(temp[0], temp[1]);
		mvo.setMember_pw(uuid);
		mvo.setMember_no(member_no);
		mservice.updatePw(mvo);
		
		model.addAttribute("email", email);

		return "/1/member/sendingEmail";
	}
	
	// mailSending 코드
	@RequestMapping(value ="/member/sendAgain", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> mailSendAgain(@RequestBody Map<String, String> send_str) {
		String email = send_str.get("email");
		String uuid = "";
		for (int i = 0; i < 5; i++) { 
	        uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
	        uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
	    } 
		
		String temp[] = email.split("@");
		String setfrom = "";
		if(temp[1].equals("gmail.com")) {
			setfrom = "xoxodudwkd@gmail.com";
		} else if(temp[1].equals("daum.net")) {
			setfrom = "xoxodudwkd@daum.net";
		} else if(temp[1].equals("naver.com")) {
			setfrom = "xoxodudwkd@naver.com";
		}
		
		System.out.println(temp[0]);
		System.out.println(temp[1]);
		
		String tomail = email;
		String title = "혼자하는 인테리어 비밀번호 재설정";
		String content = "임시 비밀번호 : "+uuid; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		MemberVO mvo = new MemberVO();
		int member_no = mservice.getMemberNo(temp[0], temp[1]);
		mvo.setMember_pw(uuid);
		mvo.setMember_no(member_no);
		mservice.updatePw(mvo);

		return send_str;
	}
}
