package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.photo.P_ReplyDAO;
import com.team.zip.model.photo.P_ReplyVO;

@Service
public class P_ReplyService {
	
	@Autowired
	private P_ReplyDAO dao;
	
	public P_ReplyVO getData(int num) {
		return dao.getData(num);
	}
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
}
