package com.team.zip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.BoardReplyDAO;
import com.team.zip.model.vo.BoardReplyVO;

@Service
public class BoardReplyService {
	
	@Autowired
	private BoardReplyDAO dao;
	
	public void insertBoardReply(BoardReplyVO brvo)
	{
		dao.insertBoardReply(brvo);
	}
}
