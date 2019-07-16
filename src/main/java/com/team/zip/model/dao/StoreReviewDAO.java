package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.StoreReviewVO;

@Repository
public class StoreReviewDAO extends SqlSessionDaoSupport{

	public List<StoreReviewVO> getReviewTotalCount(String prodNo) {
		return getSqlSession().selectList("getReviewTotalCount", prodNo);
	}
}
