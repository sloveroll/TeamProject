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
	
	// 공지사항
	@Autowired
	INoticeService noticeservice;
	
	///////////////////////////////////////////


	

	// 페이징처리 공지사항 리스트
	@RequestMapping("/noticelist")
	public String boardList(PagingDto dto, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

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
		model.addAttribute("viewAll", noticeservice.NoticePaging(dto));
		return "notice/noticelist";
	}

	// 공지사항 글목록
	@RequestMapping("/noticeview")
	public String noticeview(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("notice_idx");
		model.addAttribute("dto", noticeservice.Noticeview(sIdx));

		return "notice/noticeview"; // noticeview.jsp 호출하면서 list객체를 넘겨줌
	}

	

	// 공지사항 글쓰기 폼으로 가기
	@RequestMapping("/noticewriteForm")
	public String noticewrite(Model model) throws Exception {
		model.addAttribute("list", noticeservice.Noticelist());
		return "notice/noticewriteForm"; // noticelist.jsp
	}

	

	
	// 공지사항 글쓰기ok
	@RequestMapping("/noticewrite_ok")
	public String noticewrite_ok(HttpSession session, HttpServletRequest request, Model model) {

		String sTitle = request.getParameter("notice_title");
		String sContent = request.getParameter("notice_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();
		map.put("notice_title", sTitle);
		map.put("notice_content", sContent);
		map.put("notice_writer", sWriter);

		int nResult = noticeservice.Noticewrite(map);
		if (nResult < 1) {
			System.out.println("글쓰기를 실패했습니다.");
			return "redirect:noticewrite";
		} else {
			System.out.println("글쓰기를 성공했습니다.");
			return "redirect:noticelist";
		}
	}

	

	

	// 공지사항 글수정 폼으로 가기
	@RequestMapping("/noticemodifyForm")
	public String noticemodify(HttpSession session, HttpServletRequest request, Model model) {

		String user_id = (String) session.getAttribute("login");
		// user_id가 admin이 아니면 메인으로( 비정상적 접속 )
		if (user_id.equals("admin")) {

			String sIdx = request.getParameter("notice_idx");
			model.addAttribute("dto", noticeservice.Noticeview(sIdx));
			return "notice/noticemodifyForm";
		} else {
			return "redirect:/";
		}

	}

	
	
	

	// 공지사항 글수정ok
	@RequestMapping("/noticemodify_ok")
	public String modify_ok(HttpSession session, HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("notice_idx");
		String sTitle = request.getParameter("notice_title");
		String sContent = request.getParameter("notice_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();
		map.put("notice_title", sTitle);
		map.put("notice_content", sContent);
		map.put("notice_writer", sWriter);
		map.put("notice_idx", sIdx);

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
	public String delete(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("notice_idx");
		int nResult = noticeservice.Noticedelete(sIdx);
		if (nResult < 1) {
			System.out.println("삭제를 실패했습니다.");
			return "redirect:noticemodifyForm";
		} else {
			System.out.println("삭제를 성공했습니다.");
			return "redirect:noticelist";
		}

	}

	

}