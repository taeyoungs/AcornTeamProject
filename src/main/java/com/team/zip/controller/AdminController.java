package com.team.zip.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.zip.model.vo.BoardVO;
import com.team.zip.model.vo.MemberVO;
import com.team.zip.model.vo.PhotoVO;
import com.team.zip.model.vo.ZipdleReplyVO;
import com.team.zip.model.vo.ZipdleVO;
import com.team.zip.service.BoardService;
import com.team.zip.service.MemberService;
import com.team.zip.service.PhotoService;
import com.team.zip.service.ZipdleService;

@Controller
public class AdminController {
	
	@Autowired
	PhotoService pservice;
	
	@Autowired
	ZipdleService zservice;
	
	@Autowired
	BoardService bservice;
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping("/admin/adminList")
	public String golist(Model model) {
		
		return "/2/admin/adminList";
	}
	
	@RequestMapping("/admin/communityList")
	public ModelAndView goCommunityPhoto(@RequestParam String condi,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage) {
		
		ModelAndView model = new ModelAndView();
		
		// 전체 개수
		int totalCount = 0;
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
		int perPage = 10;
		// 한 블럭당 보여질 페이지의 개수
		int perBlock = 5;

		// 총 글의 개수를 구한다.
		
		if(condi.equals("photo")) {
			totalCount = pservice.getTotalCount();
		} else if(condi.equals("zip")) {
			totalCount = zservice.getTotalCount();
		} else if(condi.equals("qna")) {
			totalCount = bservice.getTotalCount();
		} else {
			totalCount = mservice.getTotalCount();
		}
		
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
		// 각 페이지 마다 출력할 시작 번호
		// 총 개수 30 -> 1페이지 30, 2페이지 25 ... 
		no = totalCount - (currentPage - 1)*perPage;
		
		List<PhotoVO> plist = new ArrayList<PhotoVO>();
		List<BoardVO> blist = new ArrayList<BoardVO>();
		List<ZipdleVO> zlist = new ArrayList<ZipdleVO>();
		// 리스트 가져오기
		if(condi.equals("photo")) {
			plist = pservice.getPagingPhotoList(startNum, endNum);
		} else if(condi.equals("zip")) {
			zlist = zservice.getPagingZipList(startNum, endNum);
		} else {
			blist = bservice.getPagingBoardList(startNum, endNum);
		}

		// 페이징에 필요한 변수들 model에 저장
		
		model.addObject("totalCount", totalCount);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		
		
		if(condi.equals("photo")) {
			model.addObject("plist", plist);
			model.addObject("condition", "photo");
			model.setViewName("/2/admin/adminPhoto");
		} else if(condi.equals("zip")) {
			model.setViewName("/2/admin/adminZipdle");
		} else if(condi.equals("qna")){
			model.addObject("blist", blist);
			model.addObject("condition", "qna");
			model.setViewName("/2/admin/adminBoard");
		} else {
			model.setViewName("/2/admin/adminMember");
		}
		
		
		return model;
	}
	
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/admin/getZipAjaxList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getZipAjaxList(@RequestParam(value="pageNum", defaultValue="1") int currentPage) {

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
		totalCount = zservice.getTotalCount();

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
		// 각 페이지 마다 출력할 시작 번호
		// 총 개수 30 -> 1페이지 30, 2페이지 25 ... 
		no = totalCount - (currentPage - 1)*perPage;
		
		List<ZipdleVO> zlist = new ArrayList<ZipdleVO>();
		zlist = zservice.getPagingZipList(startNum, endNum);

		// 댓글에 몇분전, 몇일전 표시하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy년 MM월 dd일 HH:mm" , Locale.KOREA );

		for (int i = 0; i < zlist.size(); i++) {
			// 댓글 리스트에서 zrvo 하나 꺼내기
			ZipdleVO zvo2 = zlist.get(i);

			// Timestamp -> String -> Date 변환 작업
			Timestamp timestamp = zvo2.getReg_date();
			String str = sdf.format(new Date(timestamp.getTime( )));

			// 변환 후 zrvo setter로 업데이트
			zlist.get(i).setDate(str);

		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList="";

		try { 
			jsonList = mapper.writeValueAsString(zlist); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("no", no);
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("jsonList", jsonList);

		return jsonObj;
	}

	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/admin/getFilterAjaxList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getFilterAjaxList(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam String keyword) {

		System.out.println(keyword);
		
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
		totalCount = zservice.getTotalCount();

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
		// 각 페이지 마다 출력할 시작 번호
		// 총 개수 30 -> 1페이지 30, 2페이지 25 ... 
		no = totalCount - (currentPage - 1)*perPage;

		List<ZipdleVO> zlist = new ArrayList<ZipdleVO>();
		zlist = zservice.getFilterZipList(startNum, endNum, keyword);

		// 댓글에 몇분전, 몇일전 표시하기 위한 작업
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy년 MM월 dd일 HH:mm" , Locale.KOREA );

		for (int i = 0; i < zlist.size(); i++) {
			// 댓글 리스트에서 zrvo 하나 꺼내기
			ZipdleVO zvo2 = zlist.get(i);

			// Timestamp -> String -> Date 변환 작업
			Timestamp timestamp = zvo2.getReg_date();
			String str = sdf.format(new Date(timestamp.getTime( )));

			// 변환 후 zrvo setter로 업데이트
			zlist.get(i).setDate(str);

		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList="";

		try { 
			jsonList = mapper.writeValueAsString(zlist); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("no", no);
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("jsonList", jsonList);

		return jsonObj;
	}
	
	@RequestMapping(value="/admin/deleteZip", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteZip(@RequestParam int zip_seq_no) {
		
		zservice.deleteZip(zip_seq_no);
		
		JSONObject jsonObj = new JSONObject();
		
	    return jsonObj;   
	}
	
	// 여기서부터 adminMember 페이지 처리 ---------------------------
	// zip_seq_no에 해당하는 detail data 보내주는 ajax
	@RequestMapping(value="/admin/getMemberList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMemberList(@RequestParam(value="pageNum", defaultValue="1") int currentPage) {

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
		totalCount = mservice.getTotalCount();

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
		// 각 페이지 마다 출력할 시작 번호
		// 총 개수 30 -> 1페이지 30, 2페이지 25 ... 
		no = totalCount - (currentPage - 1)*perPage;
		
		List<MemberVO> mlist = new ArrayList<MemberVO>();
		mlist = mservice.getPagingList(startNum, endNum);

//		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy년 MM월 dd일 HH:mm" , Locale.KOREA );
//
//		for (int i = 0; i < zlist.size(); i++) {
//			// 댓글 리스트에서 zrvo 하나 꺼내기
//			ZipdleVO zvo2 = zlist.get(i);
//
//			// Timestamp -> String -> Date 변환 작업
//			Timestamp timestamp = zvo2.getReg_date();
//			String str = sdf.format(new Date(timestamp.getTime( )));
//
//			// 변환 후 zrvo setter로 업데이트
//			zlist.get(i).setDate(str);
//
//		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList="";

		try { 
			jsonList = mapper.writeValueAsString(mlist); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("no", no);
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("jsonList", jsonList);

		return jsonObj;
	}

	@RequestMapping(value="/admin/getFilterMemberList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getFilterMemberList(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam String keyword) {

		System.out.println(keyword);
		
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
		totalCount = mservice.getTotalCount();

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
		// 각 페이지 마다 출력할 시작 번호
		// 총 개수 30 -> 1페이지 30, 2페이지 25 ... 
		no = totalCount - (currentPage - 1)*perPage;

		List<MemberVO> mlist2 = new ArrayList<MemberVO>();
		mlist2 = mservice.getFilterMemberList(startNum, endNum, keyword);
//		System.out.println(mlist.get(0).getMember_nickname());
		System.out.println(mlist2.get(0));

//		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy년 MM월 dd일 HH:mm" , Locale.KOREA );
//
//		for (int i = 0; i < zlist.size(); i++) {
//			// 댓글 리스트에서 zrvo 하나 꺼내기
//			ZipdleVO zvo2 = zlist.get(i);
//
//			// Timestamp -> String -> Date 변환 작업
//			Timestamp timestamp = zvo2.getReg_date();
//			String str = sdf.format(new Date(timestamp.getTime( )));
//
//			// 변환 후 zrvo setter로 업데이트
//			zlist.get(i).setDate(str);
//
//		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList="";

		try { 
			jsonList = mapper.writeValueAsString(mlist2);
			System.out.println(jsonList);
		} catch (IOException e) { 
			e.printStackTrace(); 
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalCount", totalCount);
		jsonObj.put("currentPage", currentPage);
		jsonObj.put("startPage", startPage);
		jsonObj.put("endPage", endPage);
		jsonObj.put("no", no);
		jsonObj.put("totalPage", totalPage);
		jsonObj.put("jsonList", jsonList);

		return jsonObj;
	}
	
	@RequestMapping(value="/admin/deleteMember", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteMember(@RequestParam int member_no) {
		
		mservice.deleteMember(member_no);
		
		JSONObject jsonObj = new JSONObject();
		
	    return jsonObj;   
	}

}
