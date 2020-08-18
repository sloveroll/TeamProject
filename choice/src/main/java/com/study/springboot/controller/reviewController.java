package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.dto.PagingDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.IReviewService;




@Controller
public class reviewController {
	@Autowired
	IReviewService ReviewService;
	
	@Autowired
	FileUploadService fileUploadService;

//	@Autowired
//	private ServletContext context;


	// 제품 리뷰 뷰 게시판
	@RequestMapping("/reviewview")
	public String reviewview(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("review_idx");
		model.addAttribute("dto", ReviewService.review(sIdx));

		return "review/reviewview";
	}

	

	// 제품리뷰 글쓰기 폼으로 가기
	@RequestMapping("/reviewwrite")
	public String reviewwrite(Model model) throws Exception {
		model.addAttribute("list", ReviewService.Reviewlist());
		return "review/reviewwrite"; // noticelist.jsp
	}

	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}
	

	   // 리뷰 글쓰기ok(파일업로드처리) 
	   @RequestMapping(value="/reviewWrite_ok", method=RequestMethod.POST )
	   public String reviewWrite_ok(HttpSession session, HttpServletRequest request, Model model ,
			   @RequestParam("review_thumbnail") MultipartFile review_thumbnail ) {
	      
	      String sItem = request.getParameter("review_item_idx");
	      String sTitle = request.getParameter("review_title");
	      String sContent = request.getParameter("review_content");
	      String sThumbnail = request.getParameter("review_thumbnail");
	      String reviewScore = request.getParameter("reviewScore");
	      System.out.println("섬네일점수: "+ reviewScore + sThumbnail);
	      
	      String sWriter = (String) session.getAttribute("login");

	      Map<String, String> map = new HashMap<String, String>();
	      map.put("review_item_idx", sItem);
	      map.put("review_title", sTitle);
	      map.put("review_content", sContent);
	      
	      			
	      map.put("review_writer", sWriter);
	      System.out.println(map);
	 
	      //저장된 파일 
	      String url = fileUploadService.restore(review_thumbnail);
	 
	      System.out.println("url:" + url);
	      map.put("review_thumbnail", url);// 업로드 이미지 
	      map.put("review_score", reviewScore);//별점

	      int nResult = ReviewService.reviewWrite(map);
	      if (nResult < 1) {
	         System.out.println("리뷰쓰기를 실패했습니다.");
	         System.out.println("업로드를 실패했습니다.");
	         return "redirect:reviewwrite";
	      } else {
	         System.out.println("리뷰쓰기를 성공했습니다.");
	         System.out.println("업로드를 성공했습니다.");
	         return "redirect:reviewlist";
	      }
	   
	   }

	

	
	// 리뷰게시판 글수정 폼으로 가기
	@RequestMapping("/reviewModifyForm")
	public String reviewModifyForm(HttpSession session, HttpServletRequest request, Model model) {

		String user_id = (String) session.getAttribute("login");
		// user_id가 admin이 아니면 메인으로( 비정상적 접속 )
		if (user_id.equals("admin")) {

			String sIdx = request.getParameter("review_idx");
			model.addAttribute("dto", ReviewService.review(sIdx));
			return "review/reviewModifyForm";
		} else {
			return "redirect:/";
		}

	}


	// 리뷰게시판 글수정ok
	@RequestMapping("/reviewModify_ok")
	public String reviewModify_ok(HttpSession session, HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("review_idx");
		String sTitle = request.getParameter("review_title");
		String sContent = request.getParameter("review_content");
		String sWriter = (String) session.getAttribute("login");

		Map<String, String> map = new HashMap<String, String>();

		map.put("review_idx", sIdx);
		map.put("review_title", sTitle);
		map.put("review_content", sContent);
		map.put("review_writer", sWriter);

		int nResult = ReviewService.reviewModify(map);
		if (nResult < 1) {
			System.out.println("리뷰글수정 실패했습니다.");
			return "redirect:reviewModifyForm";
		} else {
			System.out.println("리뷰글수정 성공했습니다.");
			return "redirect:reviewview?review_idx=" + sIdx;
		}
	}


	

	// 리뷰글삭제
	@RequestMapping("/reviewDelete_ok")
	public String reviewDelete_ok(HttpServletRequest request, Model model) {
		String sIdx = request.getParameter("review_idx");
		int nResult = ReviewService.reviewDelete(sIdx);
		if (nResult < 1) {
			System.out.println("리뷰글삭제를 실패했습니다.");
			return "redirect:reviewModifyForm";
		} else {
			System.out.println("리뷰글삭제를 성공했습니다.");
			return "redirect:reviewlist";
		}

	}

	// 제품리뷰 게시판
	// 파일업로드 관련 reviewlist, reviewwrite.jsp

	@RequestMapping("/reviewlist")
	public String reviewlist(PagingDto dto, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {

	
		int total = ReviewService.ReviewcountBoard();
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
		model.addAttribute("viewAll", ReviewService.ReviewPaging(dto));

	

		return "review/reviewlist";

	}

	

	

}