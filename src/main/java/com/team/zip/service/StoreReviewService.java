package com.team.zip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.StoreReviewDAO;
import com.team.zip.model.vo.StoreReviewVO;

@Service
public class StoreReviewService {

	@Autowired
	private StoreReviewDAO storeReviewDAO;
	
	public List<StoreReviewVO> getReviewTotalCount(String prodNo) {
		List<StoreReviewVO> reviewList = new ArrayList<StoreReviewVO>();
		
		return storeReviewDAO.getReviewTotalCount(prodNo);
	}
}
