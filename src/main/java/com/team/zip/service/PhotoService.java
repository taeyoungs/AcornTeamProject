package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.MemberDAO;
import com.team.zip.model.dao.PhotoDAO;
import com.team.zip.model.vo.PhotoVO;

@Service
public class PhotoService {
	
	@Autowired
	private PhotoDAO dao;
	@Autowired
	private MemberDAO mdao;
	
	public List<PhotoVO> getList(){
		return dao.getList();
	}
	
	public PhotoVO getData(int num) {
		return dao.getData(num);
	}
	
	public void photoUpdateReadcount(int num) {
		dao.photoUpdateReadcount(num);
	}
	
	public void photoInsert(PhotoVO pvo) {
		dao.insertPhoto(pvo);
	}
	
	public int photoDelete(int num) {
		return dao.deletePhoto(num);
	}
	
	public void updatePhoto(PhotoVO pvo) {
		dao.updatePhoto(pvo);
	}
	
	public void likePhoto(int num) {
		dao.likePhoto(num);
	}
	
	public void undoLike(int num) {
		dao.undoLike(num);
	}
	
	public List<PhotoVO> photoSortByHits(){
		return dao.photoSortByHits();
	}
	
	public List<PhotoVO> photoSortByNew(){
		return dao.photoSortByNew();
	}

	public List<PhotoVO> photoSortByHomeType(String HomeType){
		return dao.photoSortByHomeType(HomeType);
	}
	
	public List<PhotoVO> photoSortByPyeong(String Pyeong){
		return dao.photoSortByPyeong(Pyeong);

	}
	
	public List<PhotoVO> getPagingPhotoList(int start, int end) {
		
		return dao.getPagingPhotoList(start, end);
	}
	
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
}