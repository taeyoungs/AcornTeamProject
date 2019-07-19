package com.team.zip.controller;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.team.zip.service.ZipdleService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class ZipdleController {
	
	@Autowired
	ZipdleService zservice;
	
	@RequestMapping(value="/zipdle/uploadform.do")
	public String gotoUpload(HttpSession session) {
		
		String login = (String)session.getAttribute("loginok");
		if(login != null && login.equals("login")) {
	         
			 return "/1/zipdle/uploadform";
	         
	    } else {
	  
	         return "/1/member/signin";
	    }
	}
	
	// 집들이 업로드 ajax 다루는 method
	@RequestMapping(value="/zipdle/uploadAjax", method=RequestMethod.POST)
	public @ResponseBody String uploadAjax(@RequestBody String data) {
		
		zservice.insertZipdle(data);

		return "성공";
	}
	
	// 업로드할 파일 삭제 ajax
	@RequestMapping(value="/zipdle/deleteImageAjax", method=RequestMethod.POST)
	@ResponseBody
	public void deleteImageAjax(@RequestParam String targetImage) {
		
		System.out.println(targetImage);
		
	}
	
	// 집들이 업로드 ajax 다루는 method
	@RequestMapping(value="/zipdle/imageAjax", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody String imageAjax(MultipartHttpServletRequest request) {
		
		SpringFileWriter fileWriter = new SpringFileWriter();
		String path = "D:/acornproject/TeamProject/src/main/webapp/WEB-INF/uploadImage/zipdle";
		CommonsMultipartFile multipartFile = null;
		Iterator<String> iterator = request.getFileNames();
		String filePaths = "";
		while (iterator.hasNext()) {
			String key = iterator.next();
			// create multipartFile array if you upload multiple files
			multipartFile = (CommonsMultipartFile) request.getFile(key);
			String uploadedFileName = multipartFile.getOriginalFilename();
			System.out.println(uploadedFileName);
			// 이미지 저장 
//			fileWriter.writeFile(multipartFile, path, uploadedFileName);	

		}
	
		return "성공";
	}
	
	@RequestMapping(value="/zipdle/zip_upload")
	public String gotoZipList(@RequestParam MultipartFile cover_image_url) {
		
		
		System.out.println(cover_image_url.getOriginalFilename());
		
		return "/2/zipdle/zipdlelist";
	}
	
}
