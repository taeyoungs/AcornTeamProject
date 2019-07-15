package com.team.zip.util;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;


public class SpringFileWriter {
   FileOutputStream fos;
   
   // 파일 업로드
   public void writeFile(MultipartFile file,String path,String fileName)
   {
      try{
         byte fileData[]=file.getBytes();
         fos=new FileOutputStream(path+"\\"+fileName);
         fos.write(fileData);
      }catch(Exception e){
         System.out.println("파일 업로드 오류:"+e.getMessage());
      }finally{
         try{
            fos.close();
         }catch(Exception e){}
      }
   }
   
   // 파일 업로드 전에 기존 업로드 파일 삭제하는 메서드
   public void deleteFile(String path,String fileName) {
	   File file = new File(path+"\\"+fileName);
	   if(file.exists()) {
			file.delete();
	   }
   }
   
}