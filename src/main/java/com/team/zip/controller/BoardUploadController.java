package com.team.zip.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.util.SpringFileWriter;

@Controller
public class BoardUploadController {
   @RequestMapping("/upload/test.do")
   public String uploadForm()
   {
      return "/upload/uploadform";
   }
   
   @RequestMapping(value="/upload/upload.do", method=RequestMethod.POST)
   public ModelAndView upload(@RequestParam MultipartFile photo, @RequestParam String msg,
         HttpServletRequest request)
   {
      //이미지를 업로드할 경로 구하기
      String path=request.getSession().getServletContext().getRealPath("/save");
      System.out.println(path);
      //파일명
      String fileName=photo.getOriginalFilename();
      
      SpringFileWriter fileWriter=new SpringFileWriter();
      
      //이미지 저장 메소드 호출
      fileWriter.writeFile(photo, path, fileName);
      
      ModelAndView model = new ModelAndView();
      model.addObject("msg",msg);
      model.addObject("fileName",fileName);
      model.setViewName("/upload/uploadresult");
      return model;
   }
   
}