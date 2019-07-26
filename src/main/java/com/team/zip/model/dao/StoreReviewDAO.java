package com.team.zip.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.StoreReviewVO;

@Repository
public class StoreReviewDAO extends SqlSessionDaoSupport{
	public void insertReview(StoreReviewVO storeReviewVO) {
		getSqlSession().insert("insertReview", storeReviewVO);
	}
	
	public List<StoreReviewVO> getReviewList(int prodNo, int startNo, int endNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("prodNo", prodNo);
		return getSqlSession().selectList("getReviewList", map);
	}
	
	public int getReviewTotalCount(int prodNo) {
		return getSqlSession().selectOne("getReviewTotalCount", prodNo);
	}
}
