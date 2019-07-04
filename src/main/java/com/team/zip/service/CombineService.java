package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.PhotoCombineDAO;
import com.team.zip.model.vo.PhotoCombineVO;

@Service
public class CombineService {
	
	@Autowired
	private PhotoCombineDAO dao;
	
	public PhotoCombineVO getData(int num) {
		return dao.getData(num);
	}
}
