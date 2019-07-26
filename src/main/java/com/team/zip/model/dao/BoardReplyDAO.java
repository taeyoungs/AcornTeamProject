package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.BoardReplyVO;

@Repository
public class BoardReplyDAO extends SqlSessionDaoSupport{
	
	//댓글 작성
	public void insertBoardReply(BoardReplyVO brvo) {
		getSqlSession().insert("board.InsertBoardReply", brvo);
	}
	
	//댓글 리스트(댓글 갯수 포함)
	public List<BoardReplyVO> getList(int brvo)
	{
		return getSqlSession().selectList("getBoardReplyData",brvo);
	}
	
	//댓글 삭제
	
	public void deleteBoardReply(int b_reply_seq_no)
	{
		getSqlSession().delete("board.boardReplyDelete",b_reply_seq_no);
	}

}
