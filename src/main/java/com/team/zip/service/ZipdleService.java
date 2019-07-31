package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.ZipdleDAO;
import com.team.zip.model.vo.ZipdleVO;

@Service
public class ZipdleService {

	@Autowired
	ZipdleDAO zdao;
	
	public void insertZipdle(ZipdleVO zvo) {
		zdao.insertZipdle(zvo);
	}
	
	public List<ZipdleVO> getListWithMember() {
		return zdao.getListWithMember();
	}
	
	public List<ZipdleVO> getHitsList() {
		
		return zdao.getHitsList();
	}
	
	public List<ZipdleVO> getGoodList() {
		
		return zdao.getGoodList();
	}
	
	public List<ZipdleVO> getDateTypeList(String type) {
		
		return zdao.getDateTypeList(type);
	}
	
	public List<ZipdleVO> getHitsTypeList(String type) {
			
		return zdao.getHitsTypeList(type);
	}
	
	public List<ZipdleVO> getGoodTypeList(String type) {
		
		return zdao.getGoodTypeList(type);
	}
	
	public List<ZipdleVO> getDatePyeongList(int start, int end) {
		
		return zdao.getDatePyeongList(start, end);
	}
	
	public List<ZipdleVO> getHitsPyeongList(int start, int end) {
			
		return zdao.getHitsPyeongList(start, end);
	}
	
	public List<ZipdleVO> getGoodPyeongList(int start, int end) {
		
		return zdao.getGoodPyeongList(start, end);
	}
	
	public List<ZipdleVO> getDate2CondiList(String start, String end, String type) {
		
		return zdao.getDate2CondiList(start, end, type);
	}
	
	public List<ZipdleVO> getHits2CondiList(String start, String end, String type) {
			
		return zdao.getHits2CondiList(start, end, type);
	}
	
	public List<ZipdleVO> getGood2CondiList(String start, String end, String type) {
		
		return zdao.getGood2CondiList(start, end, type);
	}
	
	public ZipdleVO getZipData(int zip_seq_no) {
		return zdao.getZipData(zip_seq_no);
	}
	
	public void updateZipHits(int zip_seq_no) {
		zdao.updateZipHits(zip_seq_no);
	}
	
	public void updateZipGoodUp(int zip_seq_no) {
		zdao.updateZipGoodUp(zip_seq_no);
	}
	
	public void updateZipGoodDown(int zip_seq_no) {
		zdao.updateZipGoodDown(zip_seq_no);
	}
	
	public void deleteZip(int zip_seq_no) {
		zdao.deleteZip(zip_seq_no);
	}
	
	public int getTotalCount() {
		return zdao.getTotalCount();
	}
	
	public List<ZipdleVO> getPagingZipList(int start, int end) {
		
		return zdao.getPagingZipList(start, end);
	}
	
	public List<ZipdleVO> getFilterZipList(int start, int end, String keyword) {
		
		return zdao.getFilterZipList(start, end, keyword);
	}
	
}
