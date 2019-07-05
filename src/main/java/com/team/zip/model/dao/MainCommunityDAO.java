package com.team.zip.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.MainCommunityVO;

@Repository
public class MainCommunityDAO extends SqlSessionDaoSupport {
	
	public List<MainCommunityVO> selectPhotoList(){
		List<MainCommunityVO> list = new ArrayList<MainCommunityVO>();
		list = getSqlSession().selectList("MainSql.selectPhotoList");
		return list;
	}
}
