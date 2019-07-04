package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.member.MemberDAO;
import com.team.zip.model.member.MemberVO;
import com.team.zip.model.photo.PhotoDAO;
import com.team.zip.model.photo.PhotoVO;

@Service
public class PhotoService {
	
	@Autowired
	private PhotoDAO dao;
	@Autowired
	private MemberDAO mdao;
	
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
