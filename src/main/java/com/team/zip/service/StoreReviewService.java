package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.StoreReviewDAO;
import com.team.zip.model.vo.StoreReviewVO;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewDAO storeReviewDAO;
	
	public void insertReview(StoreReviewVO storeReviewVO) {
		storeReviewDAO.insertReview(storeReviewVO);
	}

	public List<StoreReviewVO> getReviewList(StoreReviewVO storeReviewVO) {
		return storeReviewDAO.getReviewList(storeReviewVO);
	}
	
	public int getReviewTotalCount(String prodNo) {
		return storeReviewDAO.getReviewTotalCount(prodNo);
	}
}
