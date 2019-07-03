package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.MemberDAO;
import com.team.zip.model.MemberVO;
import com.team.zip.model.PhotoVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberVO getData(int num) {
		return dao.getData(num); 
	}

}
