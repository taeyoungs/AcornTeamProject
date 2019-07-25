package com.team.zip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.team.zip.model.vo.StoreReviewVO;
import com.team.zip.service.StoreCategoryService;
import com.team.zip.service.StoreProductService;
import com.team.zip.service.StoreReviewService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class StoreCategoryController {
	@Autowired
	private StoreReviewService storeReviewService;
	
	@Autowired
	private StoreCategoryService categoryService;
	
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
	
	
	@RequestMapping("/store/selling.do")
	public ModelAndView selling(@RequestParam String prodNo, HttpSession session,
			@ModelAttribute StoreReviewVO storeReviewVO,
			HttpServletRequest request) {
		
		//로그인 유무 CHECK
		String login = (String)session.getAttribute("loginok");
		String memberNo = String.valueOf(session.getAttribute("member_no"));
		
		ModelAndView mav = new ModelAndView();
		
		ProductVO productVO = new ProductVO();
		productVO = storeProductService.getProductDetail(prodNo);
		
		//조회수 증가 
		storeProductService.updateHits(prodNo);
		
		
		if (storeReviewVO.getCurrentPage() == null) {
			storeReviewVO.setCurrentPage("1");
		}
		
		//페이징처리에 필요한 변수들 선언
		int reviewTotalCnt = storeReviewService.getReviewTotalCount(prodNo);
		int currentPage = Integer.parseInt(storeReviewVO.getCurrentPage());
		
		int totalPage; //총 페이지수
		int no;//출력 시작번호
		int perPage = 3; //한페이지당 출력 리뷰 갯수
		int perBlock = 3; //한블럭당 보여질 페이지의 갯수
		
		int startPage = (currentPage - 1) / perBlock * perBlock + 1; //블럭의 시작페이지
		int endPage = startPage + perBlock - 1; //블럭의 끝페이지
		int startNo = (currentPage - 1) * perPage + 1; //각페이지의시작번호
		int endNo = startNo + perPage - 1; //각페이지의끝번호
		
		storeReviewVO.setStartNo(String.valueOf(startNo));
		storeReviewVO.setEndNo(String.valueOf(endNo));
		
		
		//총 페이지 수
		totalPage = reviewTotalCnt / perPage + (reviewTotalCnt % perPage > 0?1:0);

		if(currentPage > totalPage)
			currentPage = totalPage;
		

		//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
		if(endPage > totalPage)
			endPage = totalPage;

		//마지막 페이지의 글번호 체크하기
		if(endNo > reviewTotalCnt)
			endNo = reviewTotalCnt;

		//각 페이지마다 출력할 시작번호
		//총갯수가 30일경우 1페이지는 30,2페이지는 25....
		no = reviewTotalCnt - (currentPage - 1) * perPage;
		
		List<StoreReviewVO> reviewList = storeReviewService.getReviewList(storeReviewVO);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("reviewTotalCnt", reviewTotalCnt);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("no", no);
		mav.addObject("totalPage", totalPage);
		mav.addObject("reviewList", reviewList);
		mav.addObject("login", login);
		mav.addObject("memberNo", memberNo);
		mav.addObject("product", productVO);
		mav.setViewName("/store/selling");
		return mav;
	}
	
	
	@RequestMapping(value = "/store/pagingAjax.do")
	@ResponseBody
	public String pagingAjax(@ModelAttribute StoreReviewVO storeReviewVO, HttpSession session,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		
		//로그인 유무 CHECK
		String login = (String)session.getAttribute("loginok");
		String memberNo = String.valueOf(session.getAttribute("member_no"));
		
		ModelAndView mav = new ModelAndView();
		String prodNo = storeReviewVO.getProdNo();
		
		//페이징처리에 필요한 변수들 선언
		int reviewTotalCnt = storeReviewService.getReviewTotalCount(prodNo);
		int currentPage = Integer.parseInt(storeReviewVO.getCurrentPage());
		
		int totalPage; //총 페이지수
		int no;//출력 시작번호
		int perPage = 3; //한페이지당 출력 리뷰 갯수
		int perBlock = 3; //한블럭당 보여질 페이지의 갯수
		
		int startPage = (currentPage - 1) / perBlock * perBlock + 1; //블럭의 시작페이지
		int endPage = startPage + perBlock - 1; //블럭의 끝페이지
		int startNo = (currentPage - 1) * perPage + 1; //각페이지의시작번호
		int endNo = startNo + perPage - 1; //각페이지의끝번호
		
		if (storeReviewVO.getCurrentPage() == null) {
			storeReviewVO.setCurrentPage("1");
		}
		
		storeReviewVO.setStartNo(String.valueOf(startNo));
		storeReviewVO.setEndNo(String.valueOf(endNo));
		
		
		//총 페이지 수
		totalPage = reviewTotalCnt / perPage + (reviewTotalCnt % perPage > 0?1:0);

		if(currentPage > totalPage)
			currentPage = totalPage;
		

		//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
		if(endPage > totalPage)
			endPage = totalPage;

		//마지막 페이지의 글번호 체크하기
		if(endNo > reviewTotalCnt)
			endNo = reviewTotalCnt;

		//각 페이지마다 출력할 시작번호
		//총갯수가 30일경우 1페이지는 30,2페이지는 25....
		no = reviewTotalCnt - (currentPage - 1) * perPage;
		
		List<StoreReviewVO> reviewList = storeReviewService.getReviewList(storeReviewVO);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("reviewTotalCnt", reviewTotalCnt);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("no", no);
		mav.addObject("totalPage", totalPage);
		mav.addObject("reviewList", reviewList);
		mav.addObject("login", login);
		mav.addObject("memberNo", memberNo);
		
		JSONObject json = new JSONObject();
		json.put("reviewTotalCnt", reviewTotalCnt);
		
		
		return json.toString();
	}
	
	@RequestMapping(value = "/store/insertReview.do", method = RequestMethod.POST)
	public String insertReview(@ModelAttribute StoreReviewVO storeReviewVO,
			@RequestParam MultipartFile image,
			HttpServletRequest request) throws Exception{
		
		//이미지 업로드 경로 1. 집  2. 학원
		//String projectPath = "C:/Users/PARKSSO/git/AcornTeamProject";
		String projectPath = "C:/Users/acorn/git/AcornTeamProject";
		
		String realPath = projectPath+"/src/main/webapp/WEB-INF/uploadImage/review";
		
		String fileName = image.getOriginalFilename();
		SpringFileWriter fileWriter = new SpringFileWriter();
		
		fileWriter.writeFile(image, realPath, fileName);
		
		storeReviewVO.setRewImg(fileName);
		storeReviewService.insertReview(storeReviewVO);
		
		return "redirect:/store/selling.do?prodNo="+storeReviewVO.getProdNo();
	}
}
