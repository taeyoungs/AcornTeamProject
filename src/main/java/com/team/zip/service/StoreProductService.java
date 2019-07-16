package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.StoreProductDAO;
import com.team.zip.model.vo.CommonCodeVO;
import com.team.zip.model.vo.ProductVO;

@Service
public class StoreProductService {

	@Autowired
	private StoreProductDAO storeProductDAO;
	
	public List<ProductVO> getProductList(CommonCodeVO commonCodeVo) {
		return storeProductDAO.getProductList(commonCodeVo);
	}
	
	public String getProductTotalCount() {
		return storeProductDAO.getProductTotalCount();
	}
}
