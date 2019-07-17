package com.team.zip.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.PhotoCombineVO;
import com.team.zip.model.vo.PhotoReplyVO;
import com.team.zip.model.vo.PhotoVO;
import com.team.zip.service.CombineService;
import com.team.zip.service.MemberService;
import com.team.zip.service.PhotoReplyService;
import com.team.zip.service.PhotoService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class PhotoController {
	
	@Autowired
	private PhotoService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private PhotoReplyService rservice;
	@Autowired
	private CombineService cservice;
	
	@RequestMapping("photo/photolist.do")
	public ModelAndView photo(@RequestParam(value="where", defaultValue = "photo") String where) {

		ModelAndView model = new ModelAndView();
		List<PhotoVO> list = service.getList();
		List<MemberVO> mlist = mservice.getMemberList();
		List<PhotoCombineVO> clist = cservice.getReplyData();
		
		model.addObject("where", where);
		model.addObject("list",list);
		model.addObject("mlist",mlist);
		model.addObject("clist", clist);
		model.setViewName("/2/photo/list");
		return model;
	}
	
	@RequestMapping("photo/photoSortlist.do")
	public ModelAndView photoSortList(@RequestParam int idx, @RequestParam String value) {

		ModelAndView model = new ModelAndView();
		List<PhotoVO> list = service.getList();
		List<MemberVO> mlist = mservice.getMemberList();
		List<PhotoCombineVO> clist = cservice.getReplyData();
		
		if(idx==1) {
			list = service.photoSortByHits();
		}else if(idx==2) {
			list = service.photoSortByNew();
		}else if(idx==3 || idx==4) {
			list = service.photoSortByHomeType(value);
		}else if(idx==5 || idx==6) {
			list = service.photoSortByPyeong(value);
		}
	
		model.addObject("list",list);
		model.addObject("mlist",mlist);
		model.addObject("clist", clist);
		model.setViewName("/2/photo/list");
		return model;
	}
	
	
	
	@RequestMapping("photo/photowrite.do")
	public String photowrite(HttpSession session) {
		
		String login = (String)session.getAttribute("loginok");
		if(login != null && login.equals("login")) {
	         
			 return "/1/photo/writeform";
	         
	    } else {
	  
	         return "/1/member/signin";
	    }
	}
	
	@RequestMapping(value="photo/write.do", method=RequestMethod.POST)
	public String write(@ModelAttribute PhotoVO pvo, HttpServletRequest request, MultipartFile photo, HttpSession session) {
		
		String path = "D://Project/AcornProject/src/main/webapp/WEB-INF/image/photoimage";
		System.out.println(path);
		int memberNo = (Integer) session.getAttribute("member_no");
		System.out.println(memberNo);
		System.out.println(pvo.getHashtag());
		System.out.println(pvo.getPhoto_content());
		System.out.println(pvo.getPhoto_pyeong());

		String imagename = "";
		SpringFileWriter fileWriter = new SpringFileWriter();
		MultipartFile f = pvo.getPhoto();
		if(f.getOriginalFilename().length() > 0) {
			imagename = f.getOriginalFilename();
			System.out.println(imagename);
			fileWriter.writeFile(f, path, imagename);
		}
		
		if(imagename.length() == 0) {
			imagename = "noimage";
		}
		
		pvo.setPhoto_image(imagename);
		pvo.setMember_no(memberNo);
		
		service.photoInsert(pvo);
		return "redirect:photolist.do?where=photo";
	}
	
	
	@RequestMapping(value="photo/writeComment.do", method=RequestMethod.POST)
	@ResponseBody
	public List<PhotoCombineVO> writeComment(@ModelAttribute PhotoReplyVO rvo) {
		
		List<PhotoCombineVO> clist = null;
			
			if (rvo.getP_reply_content()==null) {
				clist = cservice.getData(rvo.getP_reply_no());	
			}else{
				rservice.insertReply(rvo);
				clist = cservice.getData(rvo.getP_reply_no());	
			}
			return clist;
	}
	
	@RequestMapping("photo/photodetail.do")
	public String photodetail(Model model, @RequestParam int num) {
		
		//조회 1증가
		service.photoUpdateReadcount(num);
		
		//데이터 가져오기
		PhotoVO pvo = service.getData(num);
		MemberVO mvo = mservice.getData(num);
		List<PhotoCombineVO> cvo = cservice.getData(num);
		
		List<PhotoVO> plist = new ArrayList<PhotoVO>();
	
		String[] photo_image = pvo.getPhoto_image().split(",");
 		String[] photo_content = pvo.getPhoto_content().split(",");
		String[] hashtag = pvo.getHashtag().split(",");
		
		for (int i = 0; i < photo_image.length; i++) {
			PhotoVO pvo2 = new PhotoVO();
			pvo2.setPhoto_image(photo_image[i]);
			if (photo_content[i] != null) {
				pvo2.setPhoto_content(photo_content[i]);
			}
			if (hashtag[i] != null) {
				pvo2.setHashtag(hashtag[i]);
			}
			plist.add(pvo2);
		}
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("cvo", cvo);
		model.addAttribute("plist", plist);
		
		return "/2/photo/detail";
	}
  
	@RequestMapping(value="/photo/upload.do", method=RequestMethod.POST)
	public String photoUpload(@RequestParam MultipartFile photo, HttpServletRequest request) {
		
		String path = request.getSession().getServletContext().getRealPath("/image/photoimage");
		System.out.println(path);
		
		String filename = photo.getOriginalFilename();
		SpringFileWriter filewriter = new SpringFileWriter();
		
		return "redirect:photolist.do";
	}
	
}

