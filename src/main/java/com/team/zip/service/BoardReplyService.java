package com.team.zip.service;

import java.util.List;

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
	
	public List<BoardReplyVO> getList(int brvo)
	{
		return dao.getList(brvo);
	}
	
	public void deleteBoardReply(int b_reply_seq_no)
	{
		dao.deleteBoardReply(b_reply_seq_no);
	}
}
