package com.team.zip.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.CommonCodeVO;
import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.StoreCategoryService;
import com.team.zip.service.StoreProductService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class StoreCategoryController {
	
	@Autowired
	StoreCategoryService categoryService;
	
	@Autowired
	private StoreProductService storeProductService;
	
	@RequestMapping("/store/category.do")
	public ModelAndView categoryGo(@ModelAttribute CommonCodeVO commonCodeVo,
			@RequestParam(value="where", defaultValue="catego") String where){
		
		ModelAndView mav = new ModelAndView();
		
		if (commonCodeVo.getCodeVal() == null) {
			commonCodeVo.setCodeVal("가구");
		}
		
		String codeVal = commonCodeVo.getCodeVal();
		String sorting = commonCodeVo.getSorting();
		int codeSeqNo = commonCodeVo.getCodeSeqNo();
		if (sorting == null) {
			sorting = "pop";
			commonCodeVo.setSorting("pop");
		}
		
		if (commonCodeVo.getCurrentPage() == null) {
			commonCodeVo.setCurrentPage("1");
		}
		
		//PAGING
		int perPage = 15;//한페이지당 보여질 글의갯수
		int currentPage = Integer.parseInt(commonCodeVo.getCurrentPage());
		int startNo = (currentPage - 1) * perPage + 1; //각 페이지 시작번호
		int endNo = startNo + perPage - 1; //각 페이지 끝번호
		
		commonCodeVo.setStartNo(String.valueOf(startNo));
		commonCodeVo.setEndNo(String.valueOf(endNo));
		List<CommonCodeVO> ctgrList = categoryService.getCategoryList(codeVal);
		List<CommonCodeVO> secondList = categoryService.getCategorySecondList(codeVal);
		List<ProductVO> prodList = storeProductService.getProductList(commonCodeVo);
		
		String totalCount = storeProductService.getProductTotalCount(commonCodeVo);
		String codeSeqNm = "";
		
		String minPrice = commonCodeVo.getMinPrice();
		String maxPrice = commonCodeVo.getMaxPrice();
		
		for(CommonCodeVO vo : secondList) {
			if (vo.getCodeSeqNo() == codeSeqNo) {
				codeSeqNm = vo.getCodeNm();
				break;
			}
		}
		
		mav.addObject("sorting", sorting);
		mav.addObject("codeSeqNo", codeSeqNo);
		mav.addObject("codeSeqNm", codeSeqNm);
		mav.addObject("where", where);
		mav.addObject("totalCount", totalCount);
		mav.addObject("ctgrList", ctgrList);
		mav.addObject("secondList", secondList);
		mav.addObject("currentCategory", codeVal);
		mav.addObject("prodList", prodList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("minPrice", minPrice);
		mav.addObject("maxPrice", maxPrice);
		
		mav.setViewName("/categoryLayout/store/category");
		return mav;
	}
	
	@RequestMapping(value = "/store/categoryAjax.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String categoryGoForAjax(@ModelAttribute CommonCodeVO commonCodeVo,
			@RequestParam(value="where", defaultValue="catego") String where) {
		
		ModelAndView mav = new ModelAndView();

		if (commonCodeVo.getCodeVal() == null) {
			commonCodeVo.setCodeVal("가구");
		}
		
		String sorting = commonCodeVo.getSorting();
		if (sorting == null) {
			sorting = "pop";
			commonCodeVo.setSorting("pop");
		}
		
		if (commonCodeVo.getCurrentPage() == null) {
			commonCodeVo.setCurrentPage("1");
		}
		
		//PAGING
		int perPage = 15;//한페이지당 보여질 글의갯수
		int currentPage = Integer.parseInt(commonCodeVo.getCurrentPage());
		int startNo = (currentPage - 1) * perPage + 1; //각 페이지 시작번호
		int endNo = startNo + perPage - 1; //각 페이지 끝번호
		
		commonCodeVo.setStartNo(String.valueOf(startNo));
		commonCodeVo.setEndNo(String.valueOf(endNo));
		List<ProductVO> prodList = storeProductService.getProductList(commonCodeVo);
		String totalCount = storeProductService.getProductTotalCount(commonCodeVo);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("prodList", prodList);
		JSONObject json = new JSONObject();
		json.put("totalCount", totalCount);
		
		JSONArray jsonArray = new JSONArray();
		for (int i=0; i < prodList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("prodNo", prodList.get(i).getProdNo());
			jo.put("prodTitle", prodList.get(i).getProdTitle());
			jo.put("prodPrice", prodList.get(i).getProdPrice());
			jo.put("prodImage", prodList.get(i).getProdImage());
			jo.put("discountRate", prodList.get(i).getDiscountRate());
			jo.put("prodSeller", prodList.get(i).getProdSeller());
			jo.put("prodHits", prodList.get(i).getProdHits());
			jo.put("reviewCnt", prodList.get(i).getReviewCnt());
			jo.put("starGrade", prodList.get(i).getStarGrade());
			jsonArray.add(jo);
		}
		json.put("prodList", jsonArray.toJSONString());
		
		return json.toString();
	}
	
	@RequestMapping(value = "/store/upload.do", method = RequestMethod.POST)
	public ModelAndView uploadReviewImage(
			@RequestParam MultipartFile image,
			HttpServletRequest request) {
		
		//이미지 업로드 경로
		String path = request.getSession().getServletContext().getRealPath("/uploadImage/review");
		System.out.println(path);
		
		String fileName = image.getOriginalFilename();
		SpringFileWriter fileWriter = new SpringFileWriter();
		
		fileWriter.writeFile(image, path, fileName);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("fileName", fileName);
		mav.setViewName("/store/selling.do");
		return mav;
	}
	
	@RequestMapping("/store/selling.do")
	public ModelAndView selling(@RequestParam String prodNo) {
		
		ModelAndView mav = new ModelAndView();
		
		ProductVO productVO = new ProductVO();
		productVO = storeProductService.getProductDetail(prodNo);
		
		//조회수 증가 
		storeProductService.updateHits(prodNo);
		
		mav.addObject("product", productVO);
		mav.setViewName("/store/selling");
		return mav;
	}
}
