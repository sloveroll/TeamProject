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
import com.study.springboot.service.ICscenterService;

@Controller
public class csCenterController {
	// 고객센터
	@Autowired
	ICscenterService Cscenterservice;

	

	// 고객센터페이지
	@RequestMapping("/csList")

	public String csList(PagingDto dto, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = Cscenterservice.CscentercountBoard();
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
		model.addAttribute("viewAll", Cscenterservice.CscenterPaging(dto));
		return "cscenter/csList";
	}

	// 고객센터 뷰
	@RequestMapping("/csView")
	public String csView(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("cs_idx");
		model.addAttribute("dto", Cscenterservice.Cscenterview(sIdx));

		return "cscenter/csView"; // noticeview.jsp 호출하면서 list객체를 넘겨줌
	}

	// 고객센터상담글작성게시판페이지
	@RequestMapping("/cswriteForm")

	public String cswriteForm(Model model) throws Exception {
		model.addAttribute("Cscenterlist", Cscenterservice.Cscenterlist());
		return "cscenter/cswriteForm";
	}



	// 고객센터 상담 글쓰기ok
	@RequestMapping("/Cscenterwrite_ok")
	public String Cscenterwrite_ok(HttpSession session, HttpServletRequest request, Model model) {

		String sTitle = request.getParameter("cs_title");
		String sContent = request.getParameter("cs_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();
		map.put("cs_title", sTitle);
		map.put("cs_content", sContent);
		map.put("cs_writer", sWriter);


		int nResult = Cscenterservice.Cscenterwrite(map);
		if (nResult < 1) {
			System.out.println("글쓰기를 실패했습니다.");
			return "redirect:cswriteForm";
		} else {
			System.out.println("글쓰기를 성공했습니다.");
			return "redirect:csList";
		}
	}


	// 고객센터 글수정 폼으로 가기
	@RequestMapping("/csmodifyForm")
	public String csmodifyForm(HttpSession session, HttpServletRequest request, Model model) {

		String user_id = (String) session.getAttribute("login");
		// user_id가 admin이 아니면 메인으로( 비정상적 접속 )
		if (user_id.equals("admin")) {

			String sIdx = request.getParameter("cs_idx");
			model.addAttribute("dto", Cscenterservice.Cscenterview(sIdx));
			return "cscenter/csmodifyForm";
		} else {
			return "redirect:/";
		}

	}

	
	// 고객센터 상담글수정ok
	@RequestMapping("/Cscentermodify_ok")
	public String Cscentermodify_ok(HttpSession session, HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("cs_idx");
		String sTitle = request.getParameter("cs_title");
		String sContent = request.getParameter("cs_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();
		map.put("cs_title", sTitle);
		map.put("cs_content", sContent);
		map.put("cs_writer", sWriter);
		map.put("cs_idx", sIdx);

		int nResult = Cscenterservice.Cscentermodify(map);
		if (nResult < 1) {
			System.out.println("상담글수정을 실패했습니다.");
			return "redirect:csmodifyForm";
		} else {
			System.out.println("상담글수정 성공했습니다.");
			return "redirect:csView?cs_idx=" + sIdx;
		}
	}


	// 고객센터 상담글삭제
	@RequestMapping("/Cscenterdelete_ok")
	public String Cscenterdelete_ok(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("cs_idx");
		int nResult = Cscenterservice.Cscenterdelete(sIdx);
		if (nResult < 1) {
			System.out.println("삭제를 실패했습니다.");
			return "redirect:csmodifyForm";
		} else {
			System.out.println("삭제를 성공했습니다.");
			return "redirect:csList";
		}

	}


	

}