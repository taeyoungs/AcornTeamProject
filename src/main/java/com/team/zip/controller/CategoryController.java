package com.team.zip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.CommonCodeVO;
import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.CategoryService;
import com.team.zip.service.ProductService;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/store/category.do")
	public ModelAndView categoryGo(@RequestParam String codeVal) {
		
		ModelAndView mav = new ModelAndView();
		
		List<CommonCodeVO> ctgrList = categoryService.getCategoryList(codeVal);
		List<CommonCodeVO> secondList = categoryService.getCategorySecondList(codeVal);
		List<ProductVO> prodList = productService.getProductList();
				
		mav.addObject("ctgrList", ctgrList);
		mav.addObject("secondList", secondList);
		mav.addObject("currentCategory", codeVal);
		mav.addObject("prodList", prodList);
		
		mav.setViewName("/categoryLayout/store/category");
		return mav;
	}
}
