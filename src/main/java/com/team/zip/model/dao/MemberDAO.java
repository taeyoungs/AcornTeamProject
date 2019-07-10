package com.team.zip.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.MemberVO;

@Repository
public class MemberDAO extends SqlSessionDaoSupport {
	
	public void insertMember(MemberVO mvo) {
		getSqlSession().insert("member.memberInsert", mvo);
	}
	
	public List<MemberVO> getIdDomain() {
		
		List<MemberVO> idDomain = new ArrayList<MemberVO>();
		idDomain = getSqlSession().selectList("member.getIdDomain");
		
		return idDomain;
	}
	
	public List<MemberVO> getMemberList() {
		List<MemberVO> mList = new ArrayList<MemberVO>();
		mList = getSqlSession().selectList("member.getMemberList");
		
		return mList;
	}
	
	public int getMemeberNo(String email, String domain) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("domain", domain);
		
		int member_no = getSqlSession().selectOne("member.getMemberNo", map);
		
		return member_no;
	}
	
	public MemberVO getMember(int memberNo) {
		
		MemberVO mvo = new MemberVO();
		mvo = getSqlSession().selectOne("member.getMember", memberNo);
		return mvo;
	}
	
	public MemberVO getData(int num) {
	      return getSqlSession().selectOne("photo.getMemberData", num);
	}
	
	public void updateMember(MemberVO mvo) {
		System.out.println(mvo.getMember_no());
		getSqlSession().update("member.memberUpdate", mvo);
	}

}
