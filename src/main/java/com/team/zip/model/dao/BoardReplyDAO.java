package com.team.zip.model.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.BoardReplyVO;

@Repository
public class BoardReplyDAO extends SqlSessionDaoSupport{
	
	//댓글 작성
	public void insertBoardReply(BoardReplyVO brvo) {
		getSqlSession().insert("board.InsertBoardReply", brvo);
	}
}
