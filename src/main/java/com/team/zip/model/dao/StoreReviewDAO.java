package com.team.zip.model.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.StoreReviewVO;

@Repository
public class StoreReviewDAO extends SqlSessionDaoSupport{
	public void insertReview(StoreReviewVO storeReviewVO) {
		getSqlSession().insert("insertReview", storeReviewVO);
	}
	
	public List<StoreReviewVO> getReviewList(StoreReviewVO storeReviewVO) {
		return getSqlSession().selectList("getReviewList", storeReviewVO);
	}
	
	public int getReviewTotalCount(String prodNo) {
		return getSqlSession().selectOne("getReviewTotalCount", prodNo);
	}
}
