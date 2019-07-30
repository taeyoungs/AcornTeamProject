package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.CommonCodeVO;
import com.team.zip.model.vo.ProductVO;

@Repository
public class StoreProductDAO extends SqlSessionDaoSupport {

	public List<ProductVO> getProductList(CommonCodeVO commonCodeVo) {

		return getSqlSession().selectList("getProductList", commonCodeVo);
	}

	public String getProductTotalCount(CommonCodeVO commonCodeVo) {
		return getSqlSession().selectOne("getProductTotalCount", commonCodeVo);
	}

	public ProductVO getProductDetail(String prodNo) {
		return getSqlSession().selectOne("getProductDetail", prodNo);
	}

	public void updateHits(String prodNo) { 
		getSqlSession().update("updateHits", prodNo); 
	}
	
	public String getReviewTotalCount(String prodNo) {
		return getSqlSession().selectOne("getReviewTotalCount", prodNo);
	}
	
	public ProductVO getProductOne(String prodNo) {
		return getSqlSession().selectOne("getProductOne", prodNo);
	}


}
