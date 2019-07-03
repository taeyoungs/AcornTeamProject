package com.team.zip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.member.MemberDAO;
import com.team.zip.model.member.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public void insertMember(MemberVO mvo) {
		dao.insertMember(mvo);
	}
	
	public List<MemberVO> getIdDomain() {
		List<MemberVO> idDomain = new ArrayList<MemberVO>();
		idDomain = dao.getIdDomain();
		
		return idDomain;
	}
	
	public List<MemberVO> getMemberList() {
		List<MemberVO> mList = new ArrayList<MemberVO>();
		mList = dao.getMemberList();
		
		return mList;
	}
	
	public int getMemberNo(String email, String domain) {
		
		int member_no = dao.getMemeberNo(email, domain);
		
		return member_no;
	}
	
	public MemberVO getMember(int memberNo) {
		MemberVO mvo = new MemberVO();
		mvo = dao.getMember(memberNo);
		return mvo;
	}
	
	public MemberVO getData(int num) {
	      return dao.getData(num);
	}

}
