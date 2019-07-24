package com.team.zip.model.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.team.zip.model.vo.PhotoVO;

@Repository
public class PhotoDAO extends SqlSessionDaoSupport {
	
	public List<PhotoVO> getList(){
		return getSqlSession().selectList("photo.photoDataList");
	}
	
	public PhotoVO getData(int num) {
		return getSqlSession().selectOne("photo.photoDetail", num);
	}
	
	public void photoUpdateReadcount(int num) {
		getSqlSession().update("photoUpdateReadcount", num);
	}
	
	public void insertPhoto(PhotoVO pvo) {
		getSqlSession().insert("photo.insertPhoto", pvo);
	}
	
	public int deletePhoto(int num) {
		return getSqlSession().delete("photo.deletePhoto", num);
		
	}
	
	public void updatePhoto(PhotoVO pvo) {
		getSqlSession().update("photo.updatePhoto",pvo);
	}
	
	//사진 정렬
	public List<PhotoVO> photoSortByHits(){
		return getSqlSession().selectList("photo.photoSortByHits");
	}
	
	public List<PhotoVO> photoSortByNew(){
		return getSqlSession().selectList("photo.photoSortByNew");
	}
	
	public List<PhotoVO> photoSortByHomeType(String HomeType){
		return getSqlSession().selectList("photo.photoSortByHomeType", HomeType);
	}
	
	public List<PhotoVO> photoSortByPyeong(String Pyeong){
		return getSqlSession().selectList("photo.photoSortByPyeong", Pyeong);
	}


}
