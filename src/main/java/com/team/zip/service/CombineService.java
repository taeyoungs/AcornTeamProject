package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.photo.CombineDAO;
import com.team.zip.model.photo.CombineVO;

@Service
public class CombineService {
	
	@Autowired
	private CombineDAO dao;
	
	public CombineVO getData(int num) {
		return dao.getData(num);
	}
}
