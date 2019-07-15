package com.team.zip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.StoreProductDAO;
import com.team.zip.model.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private StoreProductDAO storeProductDAO;
	
	public List<ProductVO> getProductList() {
		return storeProductDAO.getProductList();
	}
}
