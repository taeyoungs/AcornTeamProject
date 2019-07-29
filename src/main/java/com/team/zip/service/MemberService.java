package com.team.zip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.MemberDAO;
import com.team.zip.model.vo.MemberVO;

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
	
	public void updateMember(MemberVO mvo) {
		dao.updateMember(mvo);
	}
	
	public void updatePw(MemberVO mvo) {
		dao.updatePw(mvo);
	}
	
	public void updateZipLike(MemberVO mvo) {
		
		dao.updateZipLike(mvo);
	}
	
	public void updateZipReplyLike(MemberVO mvo) {
		
		dao.updateZipReplyLike(mvo);
	}

}
