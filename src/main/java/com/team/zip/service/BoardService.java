package com.team.zip.service;

import java.util.List;

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
	
	public List<BoardVO> getList(int start,int end)
	{
		return dao.getList(start, end);
	}

	public int getTotalCount()
	{
		return dao.getTotalCount();
	}
	
	public void boardUpdateView(int num)
	{
		dao.boardUpdateView(num);
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
	
	public void boardUpdate(int num,String content)
	{
		dao.boardUpdate(num, content);
	}
}
