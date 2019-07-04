package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.PhotoDAO;
import com.team.zip.model.vo.PhotoVO;

@Service
public class PhotoService {
	
	@Autowired
	private PhotoDAO dao;
	
	public List<PhotoVO> getList(){
		return dao.getList();
	}
	
	public PhotoVO getData(int num) {
		return dao.getData(num);
	}
	
	public void photoUpdateReadcount(int num) {
		dao.photoUpdateReadcount(num);
	}

}
