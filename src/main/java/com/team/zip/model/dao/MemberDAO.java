package com.team.zip.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.ZipdleVO;

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
	public void updatePw(MemberVO mvo) {
		
		getSqlSession().update("member.pwUpdate", mvo);
	}
	
	public void updateZipLike(MemberVO mvo) {
		
		getSqlSession().update("member.updateZipLike", mvo);
	}
	
	public void updateZipReplyLike(MemberVO mvo) {
		
		getSqlSession().update("member.updateZipReplyLike", mvo);
	}

	public int getTotalCount() {
		return getSqlSession().selectOne("member.getTotalCount");
	}
	
	public List<MemberVO> getPagingList(int start, int end) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("member.getPagingList", map);
	}
	
	public void deleteMember(int member_no) {
		getSqlSession().delete("member.deleteMember", member_no);
	}
	
	public List<MemberVO> getFilterMemberList(int start, int end, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		String startNum = Integer.toString(start);
		String endNum = Integer.toString(end);
		map.put("start", startNum);
		map.put("end", endNum);
		map.put("keyword", keyword);
		
		return getSqlSession().selectList("member.getFilterMemberList", map);
	}

}
