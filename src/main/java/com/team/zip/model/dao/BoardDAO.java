package com.team.zip.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.BoardVO;

@Repository
public class BoardDAO extends SqlSessionDaoSupport{
	public void boardInsert(BoardVO vo)
	{
		getSqlSession().insert("boardInsert",vo);
	}
	
	public List<BoardVO> getList(int start,int end)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("boardPagingList", map);
	}

	public int getTotalCount()
	{
		return getSqlSession().selectOne("boardTotalCount");
	}
	
	public void boardUpdateView(int num)
	{
		getSqlSession().update("boardViewUpdate", num);
	}
	
	public int getSelectView(int num)
	{
		return getSqlSession().selectOne("boardSelectView",num);
	}
	
	public void boardDelete(int num)
	{
		getSqlSession().delete("boardDelete",num);
	}
	
	public BoardVO getData(int num)
	{
		return getSqlSession().selectOne("boardSelectByNum", num);
	}
	
	public void boardUpdate(int num,String content)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("content", content);
		
		getSqlSession().update("boardUpdate",map);
	}
}
