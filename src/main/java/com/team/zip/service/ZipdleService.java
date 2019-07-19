package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.ZipdleDAO;

@Service
public class ZipdleService {

	@Autowired
	ZipdleDAO zdao;
	
	public void insertZipdle(String json) {
		zdao.insertZipdle(json);
	}
	
}
