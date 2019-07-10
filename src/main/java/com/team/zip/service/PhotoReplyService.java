package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.PhotoReplyDAO;
import com.team.zip.model.vo.PhotoReplyVO;

@Service
public class PhotoReplyService {
	
	@Autowired
	private PhotoReplyDAO dao;
	
	public PhotoReplyVO getData(int num) {
		return dao.getData(num);
	}
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
	
	public void insertReply(PhotoReplyVO rvo) {
		dao.insertReply(rvo);
	}
}
