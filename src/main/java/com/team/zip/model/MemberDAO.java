package com.team.zip.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO extends SqlSessionDaoSupport{
	
	public MemberVO getData(int num) {
		return getSqlSession().selectOne("photo.getMemberData", num);
	}


}
