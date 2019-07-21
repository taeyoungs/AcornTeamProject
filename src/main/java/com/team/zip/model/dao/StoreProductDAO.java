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

}
