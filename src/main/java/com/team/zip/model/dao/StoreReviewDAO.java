package com.team.zip.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.StoreReviewVO;

@Repository
public class StoreReviewDAO extends SqlSessionDaoSupport{
	public void insertReview(StoreReviewVO storeReviewVO) {
		getSqlSession().insert("insertReview", storeReviewVO);
	}
	
	public List<StoreReviewVO> getReviewList(StoreReviewVO storeReviewVO) {
		return getSqlSession().selectList("getReviewList", storeReviewVO);
	}
	
	public int getReviewTotalCount(int prodNo) {
		return getSqlSession().selectOne("getReviewTotalCount", prodNo);
	}
	
	public String selectReviewLike(String memberNo) {
		return getSqlSession().selectOne("selectReviewLike", memberNo);
	}
	
	public int toggleReviewLike(MemberVO mvo) {
		return getSqlSession().update("toggleReviewLike", mvo);
	}
}
