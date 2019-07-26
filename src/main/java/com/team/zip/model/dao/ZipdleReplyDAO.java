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
		getSqlSession().insert("insertZipReply", zrvo);
	}
	
	public List<ZipdleReplyVO> getAllZipReply(int start, int end, int zip_seq_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("zip_seq_no", zip_seq_no);
		
		return getSqlSession().selectList("getAllZipReply", map);
	}
	
	public int getZipReplyCnt(int zip_seq_no) {
		return getSqlSession().selectOne("getZipReplyCnt", zip_seq_no);
	}
	
}
