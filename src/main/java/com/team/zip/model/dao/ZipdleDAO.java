package com.team.zip.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.ZipdleVO;

@Repository
public class ZipdleDAO extends SqlSessionDaoSupport {
	
	public void insertZipdle(ZipdleVO zvo) {
		getSqlSession().insert("zipdle.insertZipdle", zvo);
	}
	
	public List<ZipdleVO> getListWithMember() {
		
		return getSqlSession().selectList("zipdle.getListWithMember");
	}
	
	public List<ZipdleVO> getHitsList() {
		
		return getSqlSession().selectList("zipdle.getHitsList");
	}
	
	public List<ZipdleVO> getGoodList() {
		
		return getSqlSession().selectList("zipdle.getGoodList");
	}
	
	public List<ZipdleVO> getDateTypeList(String type) {
		
		return getSqlSession().selectList("zipdle.getDateTypeList", type);
	}
	
	public List<ZipdleVO> getHitsTypeList(String type) {
			
			return getSqlSession().selectList("zipdle.getHitsTypeList", type);
		}
	
	public List<ZipdleVO> getGoodTypeList(String type) {
		
		return getSqlSession().selectList("zipdle.getGoodTypeList", type);
	}
	
	public List<ZipdleVO> getDatePyeongList(int start, int end) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("zipdle.getDatePyeongList", map);
	}
	
	public List<ZipdleVO> getHitsPyeongList(int start, int end) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
			
			return getSqlSession().selectList("zipdle.getHitsPyeongList", map);
		}
	
	public List<ZipdleVO> getGoodPyeongList(int start, int end) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return getSqlSession().selectList("zipdle.getGoodPyeongList", map);
	}
	
	public List<ZipdleVO> getDate2CondiList(String start, String end, String type) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		
		return getSqlSession().selectList("zipdle.getDate2CondiList", map);
	}
	
	public List<ZipdleVO> getHits2CondiList(String start, String end, String type) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
			
			return getSqlSession().selectList("zipdle.getHits2CondiList", map);
		}
	
	public List<ZipdleVO> getGood2CondiList(String start, String end, String type) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		
		return getSqlSession().selectList("zipdle.getGood2CondiList", map);
	}
	
	public ZipdleVO getZipData(int zip_seq_no) {
		return getSqlSession().selectOne("getZipData", zip_seq_no);
	}

}
