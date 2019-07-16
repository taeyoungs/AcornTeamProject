package com.team.zip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.CommonCodeVO;
import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.StoreCategoryService;
import com.team.zip.service.StoreProductService;

@Controller
public class StoreCategoryController {
	
	@Autowired
	StoreCategoryService categoryService;
	
	@Autowired
	private StoreProductService storeProductService;
	
	@RequestMapping("/store/category.do")
	public ModelAndView categoryGo(@ModelAttribute CommonCodeVO commonCodeVo) {
		
		ModelAndView mav = new ModelAndView();
		
		if (commonCodeVo.getCodeVal() == null) {
			commonCodeVo.setCodeVal("가구");
		}
		
		String codeVal = commonCodeVo.getCodeVal();
		List<CommonCodeVO> ctgrList = categoryService.getCategoryList(codeVal);
		List<CommonCodeVO> secondList = categoryService.getCategorySecondList(codeVal);
		List<ProductVO> prodList = storeProductService.getProductList(commonCodeVo);
		
		String totalCount = storeProductService.getProductTotalCount(commonCodeVo);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("ctgrList", ctgrList);
		mav.addObject("secondList", secondList);
		mav.addObject("currentCategory", codeVal);
		mav.addObject("prodList", prodList);
		
		mav.setViewName("/categoryLayout/store/category");
		return mav;
	}
}
