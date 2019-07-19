package com.team.zip.model.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ZipdleDAO extends SqlSessionDaoSupport {
	
	public void insertZipdle(String json) {
		getSqlSession().insert("insertZipdle", json);
	}
	
}
