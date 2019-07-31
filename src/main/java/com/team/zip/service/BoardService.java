package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.BoardDAO;
import com.team.zip.model.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO dao;
	
	public void boardInsert(BoardVO vo)
	{
		dao.boardInsert(vo);
	}
	
	public List<BoardVO> getList(int start,int end,String keyword)
	{
		return dao.getList(start, end, keyword);
	}

	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	//조회수
	public void boardHitsUpdate(int num)
	{
		dao.boardHitsUpdate(num);
	}
	
	public int getSelectView(int num)
	{
		return dao.getSelectView(num);
	}
	
	public void boardDelete(int num)
	{
		dao.boardDelete(num);
	}
	
	public BoardVO getData(int num)
	{
		return dao.getData(num);
	}
	
	public void boardUpdate(BoardVO vo)
	{
		dao.boardUpdate(vo);
	}
	
	public List<BoardVO> getPagingBoardList(int start, int end) {
		
		return dao.getPagingBoardList(start, end);
	}
}
