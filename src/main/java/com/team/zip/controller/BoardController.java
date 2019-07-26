package com.team.zip.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.zip.model.vo.BoardReplyVO;
import com.team.zip.model.vo.BoardVO;
import com.team.zip.service.BoardReplyService;
import com.team.zip.service.BoardService;
import com.team.zip.service.MemberService;
import com.team.zip.util.SpringFileWriter;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private MemberService mservice;
	
	@Autowired
	private BoardReplyService brs;
	
	@RequestMapping(value="/board/reply.do",method={RequestMethod.GET, RequestMethod.POST})
	public String read(
			@ModelAttribute BoardReplyVO brvo, HttpServletRequest request,
			HttpSession session,@RequestParam(defaultValue="0") int pageNum,
			Model model
			)
	{
		model.addAttribute("pageNum",pageNum);
		String login = (String)session.getAttribute("loginok");
		if(login != null && login.equals("login")) {
	
			brs.insertBoardReply(brvo);
			return "redirect:view.do?board_seq_no="+brvo.getB_reply_no()+"&pageNum="+pageNum;

		} else {
			return "/1/member/signin";
		}
	}
	
	@RequestMapping("/board/list.do") 
	public ModelAndView list(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyword",defaultValue="")
			String keyword)
	{
		ModelAndView model=new ModelAndView();
		int totalCount;//총 데이타 갯수
		
		totalCount=service.getTotalCount();

		//페이징 복사한거
		//페이징처리에 필요한 변수들 선언
		int totalPage; //총 페이지수
		int startNum; //각페이지의시작번호
		int endNum; //각페이지의끝번호
		int startPage; //블럭의 시작페이지
		int endPage; //블럭의 끝페이지
		int no;//출력할 시작번호
		int perPage=5;//한페이지당 보여질 글의갯수
		int perBlock=5;//한블럭당 보여질 페이지의 갯수
		int b_reply_count = 0;// 댓글 갯수

		//총 페이지수를 구한다
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);

		//존재하지 않는 페이지일경우 마지막 페이지로 가기
		if(currentPage>totalPage)
			currentPage=totalPage;

		//각 블럭의 시작페이지와 끝페이지를 구한다
		//perBlock 이 5일경우
		//예) 현재페이지가 3 일경우 시작페이지:1,끝페이지:5
		//예) 현재페이지가 7 일경우 시작페이지:6,끝페이지:10
		//예) 현재페이지가 11 일경우 시작페이지:11,끝페이지:15
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
		if(endPage>totalPage)
			endPage=totalPage;

		//각 페이지의 시작번호와 끝번호를 구한다
		//perPage 가 5일경우
		//예) 1페이지 : 시작번호 : 1, 끝번호:5
		//    3페이지 :           11        15
		startNum=(currentPage-1)*perPage+1;
		endNum=startNum+perPage-1;
		//마지막 페이지의 글번호 체크하기
		if(endNum>totalCount)
			endNum=totalCount;

		//각 페이지마다 출력할 시작번호
		//총갯수가 30일경우 1페이지는 30,2페이지는 25....
		no=totalCount-(currentPage-1)*perPage;      

		//2. 리스트 가져오기
		List<BoardVO> list=service.getList(startNum, endNum, keyword);
		
		//System.out.println(list.size());
		//System.out.println(keyword);

		model.addObject("keyword",keyword);
		model.addObject("b_reply_count", b_reply_count);
		model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("no", no);
		model.addObject("totalPage", totalPage);
		model.addObject("totalCount",totalCount);
		model.setViewName("/2/board/boardlist");
		return model;
	}
	@RequestMapping("/board/form.do")
	public String form(HttpSession session)
	{
		//오브젝트 타입으로 저장되어있는 세션의 값을 String으로 변경
		//login으로 저장후 문자타입 비교는 equals를 통해서 진행
		String login = (String)session.getAttribute("loginok");
		if(login != null && login.equals("login")) {
	
			return "/board/boardform";

		} else {
			return "/1/member/signin";
		}
	}

	@RequestMapping(value="/board/write.do",method=RequestMethod.POST)
	public String read(
			@ModelAttribute BoardVO vo,
			HttpServletRequest request
			)
	{
		//이미지 업로드 경로 
		String path=request.getSession().getServletContext().getRealPath("/save");
		//System.out.println(path);

		//path 경로에 이미지 저장
		SpringFileWriter fileWriter=new SpringFileWriter();

		String board_image="";
		//System.out.println(vo.getImagename());
		for(MultipartFile f:vo.getImagename())
		{
			//빈 문자열이 아닐경우에만 저장
			if(f.getOriginalFilename().length()>0){
				board_image+=f.getOriginalFilename()+",";
				fileWriter.writeFile(f, path, f.getOriginalFilename());
			}
		}

		//vo 에 이미지 이름들 저장
		vo.setBoard_image(board_image);
		//db에 저장
		service.boardInsert(vo);

		return "redirect:list.do";
	}
	
	@RequestMapping("/board/updateform.do")
	public ModelAndView updateform(
			@RequestParam int board_seq_no,
			@RequestParam String pageNum
			)
	{
		BoardVO vo=service.getData(board_seq_no);
		ModelAndView model=new ModelAndView();
		model.addObject("vo",vo);
		model.addObject("pageNum",pageNum);
		model.setViewName("/board/updateform");
		return model;
	}

	@RequestMapping(value="/board/update.do",method=RequestMethod.POST)
	public String update(
			@ModelAttribute BoardVO vo,
			@RequestParam String pageNum
			)
	{
		//db 수정
		service.boardUpdate(vo);
		//목록으로 이동
		return "redirect:list.do?pageNum="+pageNum;
	}

	@RequestMapping("/board/view.do")
	public String content(Model model,@RequestParam int board_seq_no,
			@RequestParam int pageNum){
		//데이터 가져오기
		BoardVO vo=service.getData(board_seq_no);
		List<BoardReplyVO> bvo=brs.getList(board_seq_no);
		//System.out.println(bvo.size());
		int board_hits = 0;
		
		service.boardHitsUpdate(board_seq_no);
		
		//System.out.println(bvo.get(0).getB_reply_seq_no());
		//model 에 저장
		model.addAttribute("board_hits",board_hits);
		model.addAttribute("vo",vo);
		model.addAttribute("replylist",bvo);
		model.addAttribute("pageNum",pageNum);
		return "/board/boardview";
	}
	
	@RequestMapping("/board/delete.do")
	public String delete(
			@RequestParam int board_seq_no,
			@RequestParam String pageNum,
			HttpServletRequest request
			)
	{
		//이미지 업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/save");
		//System.out.println(path);
		//db 에서 삭제하기 전에 이미지부터 지우자
		String board_image=service.getData(board_seq_no).getBoard_image();
		if(!board_image.equals("noimage"))
		{
			//이미지가 여러개일경우 , 로 분리
			String []myImg=board_image.split(",");
			for(String s:myImg)
			{
				//파일 객체로 생성
				File f=new File(path+"\\"+s);
				//존재할경우 삭제
				if(f.exists())
					f.delete();
			}
		}
		
		//삭제
		service.boardDelete(board_seq_no);
		return "redirect:list.do?pageNum="+pageNum;
	}
	
	@RequestMapping("/board/replydelete.do")
	public String replydelete(
			@RequestParam int b_reply_seq_no,@RequestParam int board_seq_no,
			HttpServletRequest request,@RequestParam int pageNum
			)
	{
		//System.out.println(b_reply_seq_no);
		//System.out.println(board_seq_no);
		//System.out.println(pageNum);
		//삭제
		brs.deleteBoardReply(b_reply_seq_no);
		return "redirect:view.do?board_seq_no="+board_seq_no+"&pageNum="+pageNum;
	}
}
