package com.team.zip.model.dao;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.StoreReviewVO;

@Repository
public class StoreReviewDAO extends SqlSessionDaoSupport{
	public void insertReview(StoreReviewVO storeReviewVO) {
		getSqlSession().insert("insertReview", storeReviewVO);
	}
}
