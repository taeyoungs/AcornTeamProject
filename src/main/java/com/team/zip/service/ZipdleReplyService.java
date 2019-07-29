package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.ZipdleReplyDAO;
import com.team.zip.model.vo.ZipdleReplyVO;

@Service
public class ZipdleReplyService {
	
	@Autowired
	ZipdleReplyDAO zrdao;
	
	public void insertZipReply(ZipdleReplyVO zrvo) {
		zrdao.insertZipReply(zrvo);
	}
	
	public List<ZipdleReplyVO> getAllZipReply(int start, int end, int zip_seq_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("zip_seq_no", zip_seq_no);
		
		return zrdao.getAllZipReply(start, end, zip_seq_no);
	}
	
	public int getZipReplyCnt(int zip_seq_no) {
		return zrdao.getZipReplyCnt(zip_seq_no);
	}
	
	public void upReplyGood(int zip_seq_no) {
		zrdao.upReplyGood(zip_seq_no);
	}
	
	public void downReplyGood(int zip_seq_no) {
		zrdao.downReplyGood(zip_seq_no);
	}
	
	public ZipdleReplyVO getReplyData(int z_reply_seq_no) {
		return zrdao.getReplyData(z_reply_seq_no);
	}
	
	public void deleteZipReply(int z_reply_seq_no) {
		zrdao.deleteZipReply(z_reply_seq_no);
	}
}
