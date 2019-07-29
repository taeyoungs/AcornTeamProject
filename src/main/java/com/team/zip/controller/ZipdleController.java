package com.team.zip.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.ZipdleReplyVO;
import com.team.zip.model.vo.ZipdleVO;
import com.team.zip.service.MemberService;
import com.team.zip.service.ZipdleReplyService;
import com.team.zip.service.ZipdleService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class ZipdleController {
	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 24;
	public static final int DAY = 30;
	public static final int MONTH = 12;
	
	@Autowired
	ZipdleService zservice;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	ZipdleReplyService zrservice;
	
	@RequestMapping(value="/zipdle/gotoZipList")
	public String gotoZipList(@RequestParam(value="where", defaultValue="zipdle") String where, Model model) {
		
		model.addAttribute("where", where);
		
	    return "/2/zipdle/zipdlelist";
	   
	}
	
	// 게시글 작성한 사람이 자신의 게시글을 삭제하는 ajax
	@RequestMapping(value="/zipdle/{zip_seq_no}/deleteZip", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String deleteZip(@PathVariable int zip_seq_no) {
		
		zservice.deleteZip(zip_seq_no);
		
	    return "게시물 삭제를 완료하였습니다.";   
	}
	
	// 게시글 작성한 사람이 자신의 게시글을 삭제하는 ajax
	@RequestMapping(value="/zipdle/{zip_seq_no}/deleteZipReply", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String deleteZipReply(@RequestParam int z_reply_seq_no) {
			
		zrservice.deleteZipReply(z_reply_seq_no);
			
		return "댓글 삭제를 완료하였습니다.";   
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
		
		// seq_no(String) : 해당 게시글 번호
		
		int zip_seq_no = Integer.parseInt(seq_no);
		int member_no = 0;
		if(session.getAttribute("member_no") != null) {
			member_no = (Integer)session.getAttribute("member_no");
			
			// 로그인 중인 사람의 멤버 정보
			MemberVO mvo = new MemberVO();
			mvo = mservice.getMember(member_no);
			
			// 좋아요를 누른 게시물인지 체크
			// 누른 좋아요 게시물이 하나라도 있는지 먼저 체크
			if(mvo.getZip_like() != null) {
				// 좋아요 누른 게시글이 2개 이상인 경우
				if(mvo.getZip_like().contains(",")) {
					String[] temp = mvo.getZip_like().split(",");
					for (int i = 0; i < temp.length; i++) {
						if(temp[i].equals(seq_no)) {
							model.addAttribute("isZipLike", "yes");
						}
					}
				// 좋아요 누른 게시글이 1개인 경우
				} else {
					if(mvo.getZip_like().equals(seq_no)) {
						model.addAttribute("isZipLike", "yes");
					}
				}
			}
		}
		
		ZipdleVO zvo = new ZipdleVO();
		zvo = zservice.getZipData(zip_seq_no);
		
		
		// 자신이 작성한 글이 아닐 경우 선택한 게시글 조회수 증가
		if(member_no != zvo.getMember_no()) {
			zservice.updateZipHits(zip_seq_no);
		}
		
		// seq_no로 photo_seq_no 가지고 넘어옴
		zvo = zservice.getZipData(zip_seq_no);
		
		// 게시글 작성한 멤버의 정보
		MemberVO mvo2 = mservice.getMember(zvo.getMember_no());
		
		model.addAttribute("mvo", mvo2);
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
	public ZipdleVO updateZipGood(@PathVariable String seq_no, @RequestParam int upDown,
					@RequestParam int member_no) {
		// seq_no(String) : 보고 있는 게시글 번호
		// upDown(int) : 좋아요 Condition
		// member_no(int) : 로그인 중인 멤버 번호
		
		int zip_seq_no = Integer.parseInt(seq_no);
		
		// 해야할 것
		// 1. 좋아요를 누른 게시글 번호를 멤버 테이블에 저장 -> upDown : 0
		// 2. 좋아요를 취소했을 경우 멤버 테이블에서 게시글 번호를 찾아 삭제 -> upDown : 1
		
		ZipdleVO zvo = new ZipdleVO();
		zvo = zservice.getZipData(zip_seq_no);
		
		// 인자값으로 넘어온 로그인하고 있는 멤버의 번호를 이용해서 로그인한 멤버의 정보를 가져온다.
		MemberVO mvo = new MemberVO();
		mvo = mservice.getMember(member_no);
		
		if(upDown == 0) {
			zservice.updateZipGoodUp(zip_seq_no);
			
			// 참고해야할 사항
			// 1. 멤버가 게시글에 좋아요를 처음 누른 경우 (DB에 Null인 상태)
			// 로그인한 멤버의 좋아요 게시물 목록을 이용
			// zvo에 들어있는 member_no : 게시글을 작성한 멤버 번호
			if(mvo.getZip_like() == null) {
				mvo.setZip_like(seq_no);
				mservice.updateZipLike(mvo);
				
			// 2. 이미 게시글을 누른 적이 있고 거기에 더해서 저장해놓아야 할 경우
			} else {
				// 임시로 좋아요 누른 게시글 목록을 변수에 저장
				String temp = mvo.getZip_like();
				// 좋아요 누른 게시글 번호를 붙여서 다시 저장 (seq_no)
				temp = temp+","+seq_no;
				mvo.setZip_like(temp);
				// 새로은 좋아요 게시글 목록으로 멤버 테이블 업데이트
				mservice.updateZipLike(mvo);
			}
			
		} else {
			// 이 케이스로 들어오려면 적어도 1개의 게시물 좋아요는 있는 상태
			zservice.updateZipGoodDown(zip_seq_no);
			
			// 참고해야할 사항
			// 1. 좋아요 누른 게시글이 1개 뿐일 경우
			if(!mvo.getZip_like().contains(",")) {
				mvo.setZip_like("");
				mservice.updateZipLike(mvo);
			// 2. 좋아요 누른 게시글이 2개 이상일 경우
			} else {
				List<String> list = Arrays.asList(mvo.getZip_like().split(","));
				ArrayList<String> likeList = new ArrayList<String>();
				likeList.addAll(list);
				
				likeList.remove(seq_no);
				
				String zip_likeList = "";
				for (int i = 0; i < likeList.size(); i++) {
					
					if(i == 0) {
						zip_likeList = likeList.get(0);
					} else {
						zip_likeList = zip_likeList+","+likeList.get(i);
					}
				}
				mvo.setZip_like(zip_likeList);
				mservice.updateZipLike(mvo);
			}
			
		}
		
		// 업데이트 된 zvo 새로 가져오기
		zvo = zservice.getZipData(zip_seq_no);

		return zvo;
	}
	
	// 집들이 댓글 좋아요수 업데이트 ajax
	@RequestMapping(value="/zipdle/{seq_no}/upReplyGood", method = RequestMethod.POST)
	@ResponseBody
	public ZipdleReplyVO upReplyGood(@PathVariable String seq_no, @RequestParam int upDown,
				@RequestParam int z_reply_seqno, @RequestParam int member_no) {
		
		// 인자값으로 넘어온 로그인하고 있는 멤버의 번호를 이용해서 로그인한 멤버의 정보를 가져온다.
		MemberVO mvo = new MemberVO();
		mvo = mservice.getMember(member_no);
		
		String z_reply_seq_no = Integer.toString(z_reply_seqno);
			
		if(upDown == 0) {
			zrservice.upReplyGood(z_reply_seqno);
			
			// 참고해야할 사항
			// 1. 멤버가 댓글에 좋아요를 처음 누른 경우 (DB에 Null인 상태)
			// 로그인한 멤버의 좋아요 댓글 목록을 이용
			if(mvo.getZip_reply_like() == null) {
				mvo.setZip_reply_like(z_reply_seq_no);
				mservice.updateZipReplyLike(mvo);
							
			// 2. 이미 댓글을 누른 적이 있고 거기에 더해서 저장해놓아야 할 경우
			} else {
				// 임시로 좋아요 누른 댓글 목록을 변수에 저장
				String temp = mvo.getZip_reply_like();
				// 좋아요 누른 게시글 번호를 붙여서 다시 저장 (seq_no)
				temp = temp+","+z_reply_seq_no;
				mvo.setZip_reply_like(temp);
				// 새로은 좋아요 댓글 목록으로 멤버 테이블 업데이트
				mservice.updateZipReplyLike(mvo);
			}
						
		} else {
			zrservice.downReplyGood(z_reply_seqno);
			
			// 참고해야할 사항
			// 1. 좋아요 누른 댓글이 1개 뿐일 경우
			if(!mvo.getZip_reply_like().contains(",")) {
				mvo.setZip_reply_like("");
				mservice.updateZipReplyLike(mvo);
			// 2. 좋아요 누른 댓글이 2개 이상일 경우
			} else {
				List<String> list = Arrays.asList(mvo.getZip_reply_like().split(","));
				ArrayList<String> likeList = new ArrayList<String>();
				likeList.addAll(list);
							
				likeList.remove(z_reply_seq_no);
							
				String zip_likeList = "";
				for (int i = 0; i < likeList.size(); i++) {
								
					if(i == 0) {
						zip_likeList = likeList.get(0);
					} else {
						zip_likeList = zip_likeList+","+likeList.get(i);
					}
				}
				mvo.setZip_reply_like(zip_likeList);
				mservice.updateZipReplyLike(mvo);
			}
						
		}
			
		ZipdleReplyVO zrvo = new ZipdleReplyVO();
		zrvo = zrservice.getReplyData(z_reply_seqno);
		
		return zrvo;
	}
	
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/zipdle/{seq_no}/getZipReply", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getZipReply(@PathVariable String seq_no, @ModelAttribute ZipdleReplyVO zrvo,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage) {
			
		int zip_seq_no = Integer.parseInt(seq_no);
		if(zrvo.getZ_reply_content() != null) {
			zrservice.insertZipReply(zrvo);
		}
		
		// 전체 개수
		int totalCount;
		// 총 페이지 수
		int totalPage;
		// 각 페이지 시작번호
		int startNum;
		// 각 페이지 끝 번호
		int endNum = 0;
		// 블럭의 시작 페이지
		int startPage;
		// 블럭의 끝 페이지
		int endPage = 0;
		// 출력할 시작번호
		int no;
		// 한 페이지당 보여질 글의 개수
		int perPage = 5;
		// 한 블럭당 보여질 페이지의 개수
		int perBlock = 5;

		// 총 글의 개수를 구한다.
		totalCount = zrservice.getZipReplyCnt(zip_seq_no);

		// 총 페이지 수 -> 나머지 글의 개수가 1개라도 있으면 한 페이지를 더 만든다.
		totalPage = totalCount/perPage+(totalCount%perPage > 0 ? 1 : 0);
				

		// 존재하지 않는 페이지일 경우 마지막 페이지로 가기
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 각 블럭의 시작페이지와 끝페이지를 구한다.
		// 예) 현재페이지 3일 경우 시작페이지:1 끝페이지:5
		// 예) 현재페이지 7일 경우 시작페이지:6 끝페이지:10
		// 예) 현재페이지 11일 경우 시작페이지:11 끝페이지:15
		int temp = (currentPage-1)/perBlock;
		startPage = 1 + perBlock*temp;
		endPage = startPage+perBlock-1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}

		// 각 페이지의 시작번호와 끝번호를 구한다.
		// 예) 1페이지 - 시작번호 : 1, 끝번호 : 5
		//	   3페이지 - 시작번호 : 11, 끝번호 : 15
		startNum = (currentPage-1)*perPage+1;
		endNum = startNum + perPage-1;
		// 마지막 페이지의 글 번호 체크하기
		if(endNum > totalCount) {
			endNum = totalCount;
		}
		List<ZipdleReplyVO> zrlist = new ArrayList<ZipdleReplyVO>();
		zrlist = zrservice.getAllZipReply(startNum, endNum, zip_seq_no);
		
		// zrvo에 저장되는 member_no은 로그인 중인 즉, 작성자의 member_no
		// zip_reply_like를 얻기 위해 로그인 중인 멤버의 mvo 가져오기
		MemberVO mvo = new MemberVO();
		mvo = mservice.getMember(zrvo.getMember_no());
		
		// 댓글에 몇분전, 몇일전 표시하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" , Locale.KOREA );
		
		for (int i = 0; i < zrlist.size(); i++) {
			// 댓글 리스트에서 zrvo 하나 꺼내기
			ZipdleReplyVO zrvo2 = zrlist.get(i);
			
			// Timestamp -> String -> Date 변환 작업
			Timestamp timestamp = zrvo2.getReg_date();
			String str = sdf.format(new Date(timestamp.getTime( )));
			Date date = null;
			try {
				date = sdf.parse(str);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String timeAgo = formatTimeString(date);
			
			// 변환 후 zrvo setter로 업데이트
			zrlist.get(i).setDate(timeAgo);
			
			// 로그인 중인 멤버가 가지고 있는 댓글 리스트 좋아요 목록이랑 zrvo 비교
			if(mvo.getZip_reply_like() != null) {
				String like = Integer.toString(zrvo2.getZ_reply_seq_no());
				
				// 참고해야할 사항
				// 1. 좋아요를 누른 댓글 리스트가 2개 이상인 경우
				if(mvo.getZip_reply_like().contains(",")) {
					String likeList[] = mvo.getZip_reply_like().split(",");
					for (int j = 0; j < likeList.length; j++) {
						if(likeList[j].equals(like)) {
							zrlist.get(i).setIsReplyLike("yes");
						}
					}
					
				// 2. 좋아요를 누른 댓글 리스트가 1개 뿐일 경우
				} else {
					
					if(mvo.getZip_reply_like().equals(like)) {
						zrlist.get(i).setIsReplyLike("yes");
					}
				}
			}
			
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList="";
		
		try { 
			jsonList = mapper.writeValueAsString(zrlist); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("jsonList", jsonList);

		return jsonObj;
	}
	
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
		@RequestMapping(value="/zipdle/{seq_no}/getZipReply2", method = RequestMethod.POST)
		@ResponseBody
		public JSONObject getZipReply2(@PathVariable String seq_no, @ModelAttribute ZipdleReplyVO zrvo,
				@RequestParam(value="pageNum", defaultValue="1") int currentPage) {
				
			int zip_seq_no = Integer.parseInt(seq_no);
			if(zrvo.getZ_reply_content() != null) {
				zrservice.insertZipReply(zrvo);
			}
			
			// 전체 개수
			int totalCount;
			// 총 페이지 수
			int totalPage;
			// 각 페이지 시작번호
			int startNum;
			// 각 페이지 끝 번호
			int endNum = 0;
			// 블럭의 시작 페이지
			int startPage;
			// 블럭의 끝 페이지
			int endPage = 0;
			// 출력할 시작번호
			int no;
			// 한 페이지당 보여질 글의 개수
			int perPage = 5;
			// 한 블럭당 보여질 페이지의 개수
			int perBlock = 5;

			// 총 글의 개수를 구한다.
			totalCount = zrservice.getZipReplyCnt(zip_seq_no);

			// 총 페이지 수 -> 나머지 글의 개수가 1개라도 있으면 한 페이지를 더 만든다.
			totalPage = totalCount/perPage+(totalCount%perPage > 0 ? 1 : 0);
					

			// 존재하지 않는 페이지일 경우 마지막 페이지로 가기
			if(currentPage > totalPage) {
				currentPage = totalPage;
			}

			// 각 블럭의 시작페이지와 끝페이지를 구한다.
			// 예) 현재페이지 3일 경우 시작페이지:1 끝페이지:5
			// 예) 현재페이지 7일 경우 시작페이지:6 끝페이지:10
			// 예) 현재페이지 11일 경우 시작페이지:11 끝페이지:15
			int temp = (currentPage-1)/perBlock;
			startPage = 1 + perBlock*temp;
			endPage = startPage+perBlock-1;
			if(endPage > totalPage) {
				endPage = totalPage;
			}

			// 각 페이지의 시작번호와 끝번호를 구한다.
			// 예) 1페이지 - 시작번호 : 1, 끝번호 : 5
			//	   3페이지 - 시작번호 : 11, 끝번호 : 15
			startNum = (currentPage-1)*perPage+1;
			endNum = startNum + perPage-1;
			// 마지막 페이지의 글 번호 체크하기
			if(endNum > totalCount) {
				endNum = totalCount;
			}
			List<ZipdleReplyVO> zrlist = new ArrayList<ZipdleReplyVO>();
			zrlist = zrservice.getAllZipReply(startNum, endNum, zip_seq_no);
			
			// 댓글에 몇분전, 몇일전 표시하기 위한 작업
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" , Locale.KOREA );
			
			for (int i = 0; i < zrlist.size(); i++) {
				// 댓글 리스트에서 zrvo 하나 꺼내기
				ZipdleReplyVO zrvo2 = zrlist.get(i);
				
				// Timestamp -> String -> Date 변환 작업
				Timestamp timestamp = zrvo2.getReg_date();
				String str = sdf.format(new Date(timestamp.getTime( )));
				Date date = null;
				try {
					date = sdf.parse(str);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String timeAgo = formatTimeString(date);
				
				// 변환 후 zrvo setter로 업데이트
				zrlist.get(i).setDate(timeAgo);
				
			}
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonList="";
			
			try { 
				jsonList = mapper.writeValueAsString(zrlist); 
			} catch (IOException e) { 
				e.printStackTrace(); 
			}

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("totalCount", totalCount);
			jsonObj.put("currentPage", currentPage);
			jsonObj.put("startPage", startPage);
			jsonObj.put("endPage", endPage);
			jsonObj.put("totalPage", totalPage);
			jsonObj.put("totalCount", totalCount);
			jsonObj.put("totalCount", totalCount);
			jsonObj.put("jsonList", jsonList);

			return jsonObj;
		}
	
	// Date 타입 변수 넣으면 현재 시각으로부터 몇일전, 몇개월전 변환해주는 메서드
	public static String formatTimeString(Date tempDate) {

		long curTime = System.currentTimeMillis();
		long regTime = tempDate.getTime();
		long diffTime = (curTime - regTime) / 1000;

		String msg = null;

		if (diffTime < SEC) {
			// sec
			msg = "방금 전";

		} else if ((diffTime /= SEC) < MIN) {
			// min
			msg = diffTime + "분 전";

		} else if ((diffTime /= MIN) < HOUR) {
			// hour
			msg = (diffTime) + "시간 전";

		} else if ((diffTime /= HOUR) < DAY) {
			// day
			msg = (diffTime) + "일 전";

		} else if ((diffTime /= DAY) < MONTH) {
			// day
			msg = (diffTime) + "달 전";

		} else {
			msg = (diffTime) + "년 전";

		}
		return msg;
	}
}



