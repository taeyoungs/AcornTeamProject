package com.team.zip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PhotoController {
	
	@RequestMapping("photo/photolist.do")
	public String photo() {
		return "/2/photo/list";
	}
	
	@RequestMapping("photo/photowrite.do")
	public String photowrite() {
		return "/1/photo/writeform";
	}
	
	@RequestMapping(value="photo/write.do", method=RequestMethod.POST)
	public String write() {
		return "redirect:photolist.do";
	}
}
