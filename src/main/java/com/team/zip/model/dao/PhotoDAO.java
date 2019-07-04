package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.PhotoVO;

@Repository
public class PhotoDAO extends SqlSessionDaoSupport {
	
	public List<PhotoVO> getList(){
		return getSqlSession().selectList("photo.photoDataList");
	}
	
	public PhotoVO getData(int num) {
		return getSqlSession().selectOne("photo.photoDetail", num);
	}
	
	public void photoUpdateReadcount(int num) {
		getSqlSession().update("photoUpdateReadcount", num);
	}
	

}
