package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.CommonCodeVO;

@Repository
public class CategoryDAO extends SqlSessionDaoSupport{
	
	public List<CommonCodeVO> getCategoryList(String codeVal) {
//		List<CommonCodeVO> ctgrList = getSqlSession().selectList("getCategoryList");
//		return ctgrList;
		return getSqlSession().selectList("getCategoryList", codeVal);
	}
	
	public List<CommonCodeVO> getCategorySecondList(String codeVal) {

		return getSqlSession().selectList("getCategorySecondList", codeVal);
	}
	
}
