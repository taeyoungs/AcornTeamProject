package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.PhotoReplyVO;

@Repository
public class PhotoReplyDAO extends SqlSessionDaoSupport{
	
	public int getCount(int num) {
		int n = getSqlSession().selectOne("photo.getReplyCount", num);
		return n;
	}
	
	public void insertReply(PhotoReplyVO rvo) {
		getSqlSession().insert("photo.InsertReply", rvo);
	}
	
}
