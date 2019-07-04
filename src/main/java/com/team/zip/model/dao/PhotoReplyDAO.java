package com.team.zip.model.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.PhotoReplyVO;

@Repository
public class PhotoReplyDAO extends SqlSessionDaoSupport{
	
	public PhotoReplyVO getData(int num) {
		return getSqlSession().selectOne("photo.getReplyData", num);
	}
	
	public int getCount(int num) {
		int n = getSqlSession().selectOne("photo.getReplyCount", num);
		return n;
	}
	
}
