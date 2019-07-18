package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.ProductVO;

@Repository
public class StoreRankDAO extends SqlSessionDaoSupport{
	
	public List<ProductVO> Top10List(){
		return getSqlSession().selectList("StoreRank.getTop10List");
	}
	
	public List<ProductVO> FurnitureTop10List(){
		return getSqlSession().selectList("StoreRank.getFurnitureTop10List");
	}
	
	public List<ProductVO> applianceTop10List(){
		return getSqlSession().selectList("StoreRank.getApplianceTop10List");
	}
	
	public List<ProductVO> interiorTop10List(){
		return getSqlSession().selectList("StoreRank.getInteriorTop10List");
	}
}
