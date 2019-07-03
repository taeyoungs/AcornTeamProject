package com.team.zip.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CombineDAO extends SqlSessionDaoSupport{
	
	public CombineVO getData(int num) {
		return getSqlSession().selectOne("photo.getReplyData",num);
	}
}
