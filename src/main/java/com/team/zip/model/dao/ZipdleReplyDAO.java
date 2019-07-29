package com.team.zip.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.ZipdleReplyVO;

@Repository
public class ZipdleReplyDAO extends SqlSessionDaoSupport {

	public void insertZipReply(ZipdleReplyVO zrvo) {
		getSqlSession().insert("zipdle.insertZipReply", zrvo);
	}
	
	public List<ZipdleReplyVO> getAllZipReply(int start, int end, int zip_seq_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("zip_seq_no", zip_seq_no);
		
		return getSqlSession().selectList("zipdle.getAllZipReply", map);
	}
	
	public int getZipReplyCnt(int zip_seq_no) {
		return getSqlSession().selectOne("zipdle.getZipReplyCnt", zip_seq_no);
	}
	
	public void upReplyGood(int zip_seq_no) {
		getSqlSession().update("zipdle.upReplyGood", zip_seq_no);
	}
	
	public void downReplyGood(int zip_seq_no) {
		getSqlSession().update("zipdle.downReplyGood", zip_seq_no);
	}
	
	public ZipdleReplyVO getReplyData(int z_reply_seq_no) {
		return getSqlSession().selectOne("zipdle.getReplyData", z_reply_seq_no);
	}
	
	public void deleteZipReply(int z_reply_seq_no) {
		getSqlSession().delete("deleteZipReply", z_reply_seq_no);
	}
	
}
