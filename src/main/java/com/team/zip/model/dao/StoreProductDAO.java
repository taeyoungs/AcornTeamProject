package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.ProductVO;

@Repository
public class StoreProductDAO extends SqlSessionDaoSupport {
	
	public List<ProductVO> getProductList() {

		return getSqlSession().selectList("getProductList");
	}
}
