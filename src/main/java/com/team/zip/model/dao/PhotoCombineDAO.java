package com.team.zip.model.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.PhotoCombineVO;

@Repository
public class PhotoCombineDAO extends SqlSessionDaoSupport{
	
	public PhotoCombineVO getData(int num) {
		return getSqlSession().selectOne("photo.getReplyData",num);
	}
}
