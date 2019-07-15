package com.team.zip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.zip.model.dao.CategoryDAO;
import com.team.zip.model.vo.CommonCodeVO;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	public List<CommonCodeVO> getCategoryList(String codeVal) {
		List<CommonCodeVO> ctgrList = new ArrayList<CommonCodeVO>();
		
		return categoryDAO.getCategoryList(codeVal);
	}
	
	public List<CommonCodeVO> getCategorySecondList(String codeVal) {
		List<CommonCodeVO> ctgrSecondList = new ArrayList<CommonCodeVO>();
		
		return categoryDAO.getCategorySecondList(codeVal);
	}
}
