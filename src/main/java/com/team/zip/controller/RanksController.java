package com.team.zip.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.ProductVO;
import com.team.zip.service.StoreRankService;

@Controller
public class RanksController {
	
	@Autowired
	private StoreRankService service;
	
	
	@RequestMapping("/store/ranks.do")
	public ModelAndView ranksGo(@RequestParam(value="where", defaultValue="ranking") String where) {
		ModelAndView model = new ModelAndView();
		List<ProductVO> list = service.Top10List();
		List<ProductVO> flist = service.FurnitureTop10List();
		List<ProductVO> alist = service.ApplianceTop10List();
		List<ProductVO> ilist = service.InteriorTop10List();
		
		model.addObject("where", where);
		model.addObject("list", list);
		model.addObject("flist", flist);
		model.addObject("alist", alist);
		model.addObject("ilist", ilist); 
		model.setViewName("/store/ranks");
		return model;
	}
	
	@RequestMapping("/store/ranksDetail.do")
	public ModelAndView ranksDetail(@RequestParam(value="where", defaultValue="ranking") String where,
									@RequestParam int num, HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		List<ProductVO> list = service.Top10List();
		List<ProductVO> flist = service.FurnitureTop10List();
		List<ProductVO> alist = service.ApplianceTop10List();
		List<ProductVO> ilist = service.InteriorTop10List();
		
		String title = "";
		
		if (num==0) {
			title = "전체";
			model.addObject("list",list);
		} else if (num==1) {
			title = "가구";
			model.addObject("list",flist);
		} else if (num==2) {
			title = "가전";
			model.addObject("list",alist);
		} else if (num==3) {
			title = "인테리어";
			model.addObject("list",ilist);
		}
		
		model.addObject("title", title);
		model.addObject("where", where);
		model.setViewName("/store/ranks_detail");
		return model;
	}
}
