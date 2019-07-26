package com.team.zip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<StoreReviewVO> getReviewList(int prodNo, int startNo, int endNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("prodNo", prodNo);
		return storeReviewDAO.getReviewList(prodNo, startNo, endNo);
	}
	
	public int getReviewTotalCount(int prodNo) {
		return storeReviewDAO.getReviewTotalCount(prodNo);
	}
}
