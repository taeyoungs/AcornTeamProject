package com.team.zip.model.photo;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class P_ReplyDAO extends SqlSessionDaoSupport{
	
	public P_ReplyVO getData(int num) {
		return getSqlSession().selectOne("photo.getReplyData", num);
	}
	
	public int getCount(int num) {
		int n = getSqlSession().selectOne("photo.getReplyCount", num);
		return n;
	}
	
}
