package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.PagingDto;
import com.study.springboot.service.INoticeService;

@Controller
public class noticeController {

	// 공지사항 DI주입
	@Autowired
	INoticeService noticeservice;

	///////////////////////////////////////////

	// 페이징처리 공지사항 리스트
	@RequestMapping("/noticelist")
	public String boardList(PagingDto dto, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

//		countBoard 페이징 처리 게시물 총갯수 
		int total = noticeservice.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		dto = new PagingDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", dto);
		//게시판 리스트 페이징 처리 
		model.addAttribute("viewAll", noticeservice.NoticePaging(dto));
		return "notice/noticelist";
	}

	// 공지사항 글목록
	@RequestMapping("/noticeview")
	public String noticeview(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("notice_idx");
		//INoticeService의 게시판 뷰 Noticeview
		model.addAttribute("dto", noticeservice.Noticeview(sIdx));

		return "notice/noticeview"; // noticeview.jsp 호출하면서 list객체를 넘겨줌
	}

	// 공지사항 글쓰기 폼으로 가기
	@RequestMapping("/noticewriteForm")
	public String noticewrite(Model model) throws Exception {
		//INoticeService의 게시판 목록 리스트 Noticelist
		model.addAttribute("list", noticeservice.Noticelist());
		return "notice/noticewriteForm"; // noticelist.jsp
	}

	// 공지사항 글쓰기ok
	@RequestMapping("/noticewrite_ok")
	public String noticewrite_ok(HttpSession session, HttpServletRequest request, Model model) {

		//글쓰기 작성자 ,제목, 내용 
		String sTitle = request.getParameter("notice_title");
		String sContent = request.getParameter("notice_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();
		map.put("notice_title", sTitle);
		map.put("notice_content", sContent);
		map.put("notice_writer", sWriter);

		//INoticeService 게시판 글쓰기 Noticewrite
		int nResult = noticeservice.Noticewrite(map);
		if (nResult < 1) {
			System.out.println("글쓰기를 실패했습니다.");
			return "redirect:noticewrite";
		} else {
			System.out.println("글쓰기를 성공했습니다.");
			return "redirect:noticelist";
//			redirect:요청정보가 새로전달 	,request와 response객체 새로생성 ,시스템(session,db)에 변화가 생기는 요청( 로그인, 회원가입 ,글쓰기)
		}
	}

	// 공지사항 글수정 폼으로 가기
	@RequestMapping("/noticemodifyForm")
	public String noticemodifyForm(HttpSession session, HttpServletRequest request, Model model) {

		//세션에있는 로그인값 가져오기 
		String user_id = (String) session.getAttribute("login");
		//관리자(admin)만 공지사항 글쓰기, 수정 삭제 권한 부여 
		// user_id가 admin이 아니면 메인으로( 비정상적 접속 )
		if (user_id.equals("admin")) {

			String sIdx = request.getParameter("notice_idx");

			//INoticeService 게시판 글수정뷰 Noticeview
			model.addAttribute("dto", noticeservice.Noticeview(sIdx));
			return "notice/noticemodifyForm";
		} else {
			return "redirect:/";
//			redirect:요청정보가 새로전달 	,request와 response객체 새로생성 ,시스템(session,db)에 변화가 생기는 요청( 로그인, 회원가입 ,글쓰기)
		}

	}

	// 공지사항 글수정버튼 클릭시 ok
	@RequestMapping("/noticemodify_ok")
	public String noticemodify_ok(HttpSession session, HttpServletRequest request, Model model) {
		// 세션 로그인값가져오기, 글 작성자 
		String sWriter = (String) session.getAttribute("login");
		// 게시판번호, 게시판 제목, 게시판 내용가져오기
		String sIdx = request.getParameter("notice_idx");
		String sTitle = request.getParameter("notice_title");
		String sContent = request.getParameter("notice_content");

		Map<String, String> map = new HashMap<String, String>();

		map.put("notice_writer", sWriter);
		map.put("notice_idx", sIdx);
		map.put("notice_title", sTitle);
		map.put("notice_content", sContent);

		/// redirect 와 forward차이
		// forward vs redirect :페이지 이동 두가지방식
//		forward:요청정보가 그대로 유지전달 	,request와 response객체 공유,시스템에변화가없는 단순조회(리스트보기,검색)  
//		redirect:요청정보가 새로전달 	,request와 response객체 새로생성 ,시스템(session,db)에 변화가 생기는 요청( 로그인, 회원가입 ,글쓰기)

		int nResult = noticeservice.Noticemodify(map);
		if (nResult < 1) {
			System.out.println("글수정을 실패했습니다.");
			return "redirect:noticemodifyForm";
		} else {
			System.out.println("글수정 성공했습니다.");
			return "redirect:noticeview?notice_idx=" + sIdx;
		}
	}

	// 공지사항 글삭제
	@RequestMapping("/noticedelete_ok")
	public String noticedelete_ok(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("notice_idx");// 해당삭제게시판 번호 가져오기

		int nResult = noticeservice.Noticedelete(sIdx);
		if (nResult < 1) {
			System.out.println("글 삭제를 실패했습니다.");
			return "redirect:noticemodifyForm";
		} else {
			System.out.println("글 삭제를 성공했습니다.");
			return "redirect:noticelist";
		}

	}

}