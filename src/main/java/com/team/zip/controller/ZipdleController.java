package com.team.zip.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.ZipdleReplyVO;
import com.team.zip.model.vo.ZipdleVO;
import com.team.zip.service.MemberService;
import com.team.zip.service.ZipdleService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class ZipdleController {
	
	@Autowired
	ZipdleService zservice;
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping(value="/zipdle/gotoZipList")
	public String gotoZipList(@RequestParam(value="where", defaultValue="zipdle") String where, Model model) {
		
		model.addAttribute("where", where);
		
	    return "/2/zipdle/zipdlelist";
	   
	}
	
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
	@ResponseBody
	public JSONObject uploadAjax(@RequestBody String json, HttpSession session) {
		
		int member_no = (Integer)session.getAttribute("member_no");
		ZipdleVO zvo = new ZipdleVO();
		zvo.setMember_no(member_no);
		zvo.setJson(json);
		zservice.insertZipdle(zvo);
		
		JSONObject jsonObj = new JSONObject();
		
		return jsonObj;
	}
	
	// 업로드할 파일 삭제 ajax
	@RequestMapping(value="/zipdle/deleteImageAjax", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteImageAjax(@RequestParam String targetImage) {
		
		SpringFileWriter fileWriter = new SpringFileWriter();
		String path = "D:/acornproject/TeamProject/src/main/webapp/WEB-INF/uploadImage/zipdle";
//		System.out.println(targetImage);
		String temp[] = targetImage.split("/");
//		System.out.println(temp[3]);
		
		// 삭제 버튼 누른 이미지 업로드 폴더에서 삭제하는 메서드 (막아놓은 상태)
//		fileWriter.deleteFile(path, temp[3]);
		
		JSONObject jsonObj = new JSONObject();
		
		return jsonObj;
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
			fileWriter.writeFile(multipartFile, path, uploadedFileName);	

		}
	
		return "성공";
	}
	
	// 전체 리스트 가져오기 위한 ajax 반환 메서드
	@RequestMapping(value="/zipdle/getAllList", method = RequestMethod.POST)
	@ResponseBody
	public List<ZipdleVO> getAllList(HttpServletRequest request) {
		
		List<ZipdleVO> zlist = new ArrayList<ZipdleVO>();
		
		String[] conditionArray = request.getParameterValues("conditionArray");
//		System.out.println("conditionArray[0] : "+conditionArray[0]);
//		System.out.println("conditionArray[1] : "+conditionArray[1]);
//		System.out.println("conditionArray[2] : "+conditionArray[2]);
		
		if(!conditionArray[0].equals("nl") && conditionArray[1].equals("nl") && conditionArray[2].equals("nl")) {
			if(conditionArray[0].equals("최신순")) {
				zlist = zservice.getListWithMember();
			} else if(conditionArray[0].equals("좋아요순")) {
				zlist = zservice.getGoodList();
			} else {
				zlist = zservice.getHitsList();
			}
		} else if(!conditionArray[0].equals("nl") && !conditionArray[1].equals("nl") && conditionArray[2].equals("nl")) {
			// 2개의 조건이 걸린 상태 ([0], [1])
			if(conditionArray[0].equals("최신순")) {
				if(conditionArray[1].equals("원룸")) {
					// 최신순 + 원룸
					zlist = zservice.getDateTypeList("0");
				} else {
					// 최신순 + 투룸
					zlist = zservice.getDateTypeList("1");
				}
			} else if(conditionArray[0].equals("좋아요순")) {
				if(conditionArray[1].equals("원룸")) {
					// 좋아요순 + 원룸
					zlist = zservice.getGoodTypeList("0");
				} else {
					// 좋아요순 + 투룸
					zlist = zservice.getGoodTypeList("1");
				}
			} else {
				if(conditionArray[1].equals("원룸")) {
					// 조회순 + 원룸
					zlist = zservice.getHitsTypeList("0");
				} else {
					// 조회순 + 투룸
					zlist = zservice.getHitsTypeList("1");
				}
			}
		} else if(!conditionArray[0].equals("nl") && conditionArray[1].equals("nl") && !conditionArray[2].equals("nl")) {
			// 2개의 조건이 걸린 상태 ([0], [2])
			if(conditionArray[0].equals("최신순")) {
				if(conditionArray[2].equals("10평 미만")) {
					// 최신순 + 10평 미만
					zlist = zservice.getDatePyeongList(0, 10);
				} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
					// 최신순 + 10평 이상 20평 미만
					zlist = zservice.getDatePyeongList(10, 20);
				} else {
					// 최신순 + 20평 이상
					zlist = zservice.getDatePyeongList(20, 40);
				}
			} else if(conditionArray[0].equals("좋아요순")) {
				if(conditionArray[2].equals("10평 미만")) {
					// 좋아요순 + 10평 미만
					zlist = zservice.getGoodPyeongList(0, 10);
				} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
					// 좋아요순 + 10평 이상 20평 미만
					zlist = zservice.getGoodPyeongList(10, 20);
				} else {
					// 좋아요순 + 20평 이상
					zlist = zservice.getGoodPyeongList(20, 40);
				}
			} else {
				if(conditionArray[2].equals("10평 미만")) {
					// 조회순 + 10평 미만
					zlist = zservice.getHitsPyeongList(0, 10);
				} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
					// 조회순 + 10평 이상 20평 미만
					zlist = zservice.getHitsPyeongList(10, 20);
				} else {
					// 조회순 + 20평 이상
					zlist = zservice.getHitsPyeongList(20, 40);
				}
			}
		} else {
			// 3개의 조건이 모두 존재하는 경우 ([0]. [1], [2])
			if(conditionArray[0].equals("최신순")) {
				if(conditionArray[1].equals("원룸")) {
					if(conditionArray[2].equals("10평 미만")) {
						// 최신순 + 원룸 + 10평 미만
						zlist = zservice.getDate2CondiList("0", "10", "0");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 최신순 + 원룸 + 10평 이상 20평 미만
						zlist = zservice.getDate2CondiList("10", "20", "0");
					} else {
						// 최신순 + 원룸 + 20평 이상
						zlist = zservice.getDate2CondiList("20", "40", "0");
					}
				} else {
					if(conditionArray[2].equals("10평 미만")) {
						// 최신순 + 투룸 + 10평 미만
						zlist = zservice.getDate2CondiList("0", "10", "1");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 최신순 + 투룸 + 10평 이상 20평 미만
						zlist = zservice.getDate2CondiList("10", "20", "1");
					} else {
						// 최신순 + 투룸 + 20평 이상
						zlist = zservice.getDate2CondiList("20", "40", "1");
					}
				}
			} else if(conditionArray[0].equals("좋아요순")) {
				if(conditionArray[1].equals("원룸")) {
					if(conditionArray[2].equals("10평 미만")) {
						// 좋아요순 + 원룸 + 10평 미만
						zlist = zservice.getGood2CondiList("0", "10", "0");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 좋아요순 + 원룸 + 10평 이상 20평 미만
						zlist = zservice.getGood2CondiList("10", "20", "0");
					} else {
						// 좋아요순 + 원룸 + 20평 이상
						zlist = zservice.getGood2CondiList("20", "40", "0");
					}
				} else {
					if(conditionArray[2].equals("10평 미만")) {
						// 좋아요순 + 투룸 + 10평 미만
						zlist = zservice.getGood2CondiList("0", "10", "1");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 좋아요순 + 투룸 + 10평 이상 20평 미만
						zlist = zservice.getGood2CondiList("10", "20", "1");
					} else {
						// 좋아요순 + 투룸 + 20평 이상
						zlist = zservice.getGood2CondiList("20", "40", "1");
					}
				}
			} else {
				if(conditionArray[1].equals("원룸")) {
					if(conditionArray[2].equals("10평 미만")) {
						// 좋아요순 + 원룸 + 10평 미만
						zlist = zservice.getHits2CondiList("0", "10", "0");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 좋아요순 + 원룸 + 10평 이상 20평 미만
						zlist = zservice.getHits2CondiList("10", "20", "0");
					} else {
						// 좋아요순 + 원룸 + 20평 이상
						zlist = zservice.getHits2CondiList("20", "40", "0");
					}
				} else {
					if(conditionArray[2].equals("10평 미만")) {
						// 좋아요순 + 투룸 + 10평 미만
						zlist = zservice.getHits2CondiList("0", "10", "1");
					} else if(conditionArray[2].equals("10평 이상 20평 미만")) {
						// 좋아요순 + 투룸 + 10평 이상 20평 미만
						zlist = zservice.getHits2CondiList("10", "20", "1");
					} else {
						// 좋아요순 + 투룸 + 20평 이상
						zlist = zservice.getHits2CondiList("20", "40", "1");
					}
				}
			}
		}
		
		return zlist;
	}
	
	@RequestMapping(value="/zipdle/{seq_no}/zipdleDetail")
	public String gotoZipDetail(@PathVariable String seq_no, Model model, HttpSession session) {
		
		int zip_seq_no = Integer.parseInt(seq_no);
		int member_no = 0;
		if(session.getAttribute("member_no") != null) {
			member_no = (Integer)session.getAttribute("member_no");
		}
		
		ZipdleVO zvo = new ZipdleVO();
		zvo = zservice.getZipData(zip_seq_no);
		
		// 자신이 작성한 글이 아닐 경우 선택한 게시글 조회수 증가
		if(member_no != zvo.getMember_no()) {
			zservice.updateZipHits(zip_seq_no);
		}
		
		// seq_no로 photo_seq_no 가지고 넘어옴
		zvo = zservice.getZipData(zip_seq_no);
		
		MemberVO mvo = mservice.getMember(zvo.getMember_no());
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("zvo", zvo);
		
		return "/zipdle/zipdleDetail";
	}
	
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/zipdle/{seq_no}/getZipAjax", method = RequestMethod.POST)
	@ResponseBody
	public ZipdleVO getZipAjax(@PathVariable String seq_no) {
		
		int zip_seq_no = Integer.parseInt(seq_no);
		ZipdleVO zvo = new ZipdleVO();
		
		zvo = zservice.getZipData(zip_seq_no);

		return zvo;
	}
	
	// 집들이 게시글 좋아요수 업데이트 ajax
	@RequestMapping(value="/zipdle/{seq_no}/updateZipGood", method = RequestMethod.POST)
	@ResponseBody
	public ZipdleVO updateZipGood(@PathVariable String seq_no, @RequestParam int upDown) {
		
		int zip_seq_no = Integer.parseInt(seq_no);
		
		if(upDown == 0) {
			zservice.updateZipGoodUp(zip_seq_no);
		} else {
			zservice.updateZipGoodDown(zip_seq_no);
		}
		
		ZipdleVO zvo = new ZipdleVO();
		zvo = zservice.getZipData(zip_seq_no);

		return zvo;
	}
	
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/zipdle/{seq_no}/getZipReply", method = RequestMethod.POST)
	@ResponseBody
	public ZipdleVO getZipReply(@PathVariable String seq_no, @ModelAttribute ZipdleReplyVO zrvo) {
			
		int zip_seq_no = Integer.parseInt(seq_no);
		ZipdleVO zvo = new ZipdleVO();
			
		zvo = zservice.getZipData(zip_seq_no);

		return zvo;
	}
	
}
