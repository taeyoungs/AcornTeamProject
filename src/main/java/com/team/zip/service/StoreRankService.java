package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.StoreRankDAO;
import com.team.zip.model.vo.ProductVO;

@Service
public class StoreRankService {

	@Autowired
	StoreRankDAO dao;
	
	public List<ProductVO> Top10List(){
		return dao.Top10List();
	}
	
	public List<ProductVO> FurnitureTop10List(){
		return dao.FurnitureTop10List();
	}
	
	public List<ProductVO> ApplianceTop10List(){
		return dao.applianceTop10List();
	}
	
	public List<ProductVO> InteriorTop10List(){
		return dao.interiorTop10List();
	}
}
