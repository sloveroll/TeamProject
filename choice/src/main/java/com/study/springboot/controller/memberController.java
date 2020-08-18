package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.service.ICartService;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IReviewService;
import com.study.springboot.service.IitemService;

@Controller
public class memberController {
	// 회원가입,로그인
	@Autowired
	IMemberService memberservice;
	// 파일업로드
	@Autowired
	IReviewService ReviewService;
	@Autowired
	IitemService itemService;
	@Autowired
	ICartService cartService;
	
	// 회원가입 폼
	@RequestMapping("/joinForm")
	public String joinForm() throws Exception {

		return "member/joinForm";
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {

		String user_id = req.getParameter("id");
		int nResult = memberservice.count(user_id);
		int result = 0;
		if (nResult > 0) {
			result = 1;
		}
		return result;
	}

	// 회원가입 체크
	@RequestMapping("/join_ok")
	public String join(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("id");
		String user_pw = req.getParameter("pw");
		String user_name = req.getParameter("name");
		String user_email = req.getParameter("email");

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_name", user_name);
		map.put("user_email", user_email);

		int nResult = memberservice.join(map);
		if (nResult < 1) {
			System.out.println("회원가입에 실패했습니다");
			return "redirect:joinForm";
		} else {
			//가입쿠폰 증정
			Map <String,String> insertCp = new HashMap<String,String>();
			insertCp.put("user_id", user_id);
			insertCp.put("cp_idx", "999");
			insertCp.put("cp_name", "첫주문 쿠폰");
			insertCp.put("cp_saleprice", "3000");
			itemService.cpInsert(insertCp);
			
			System.out.println("회원가입에 성공했습니다.");
			return "redirect:/";
		}

	}

	// 로그인페이지
	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam(value = "fail", required = false) String buy) throws Exception {

		return "member/loginForm";
	}

	// 로그인체크
	@RequestMapping("/login_ok")
	// loginForm에서 넘긴 값 가지고 오기
	public String loginPost(MemberDto mem, Model model, HttpServletRequest req, HttpSession session,
			//리다이렉트 해도 파라미터를 보낼 수 있음
			RedirectAttributes redirectAttributes) {

		if (memberservice.login(mem) != null) {
			mem = memberservice.login(mem);
			String user_id = mem.getUser_id();
			session.setAttribute("login", user_id);

			return "redirect:/";
		} else {
			//보낼 파라미터를 등록해줌
			redirectAttributes.addAttribute("fail", "fail");
			return "redirect:/loginForm";
		}

	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	// 아디비번찾기 폼
	@RequestMapping("/findForm")
	public String findForm() throws Exception {

		return "member/findForm";
	}

	
	  //아디/비번찾기
	  @RequestMapping("/find") 
	  public String find(HttpServletRequest req, Model model) throws Exception {
		  //파라미터 값이 id인지 pw 인지 검증
		  if(req.getParameter("findCheck").equals("id")) {
			  //파라미터 받아옴
			  String user_name = req.getParameter("user_name");
			  String user_email = req.getParameter("user_email");
			  //dao
			  // 결과 값이 null이 아니면 모델등록
			  if(memberservice.findId(user_name, user_email)!=null) {
				  model.addAttribute("user_info", memberservice.findId(user_name, user_email));
				  model.addAttribute("find", "id");
			  // 결과 값이 없으면 fail 등록
				  } else {
					
					  model.addAttribute("find", "fail");
				  }
			//위와 동일 비밀번호
		  } else if(req.getParameter("findCheck").equals("pw")) {
			  String user_id = req.getParameter("user_id");
			  String user_email = req.getParameter("user_email");
			  if(memberservice.findPw(user_id, user_email)!=null) {
				  model.addAttribute("user_info", memberservice.findPw(user_id, user_email));
				  model.addAttribute("find", "pw");
	 	  
			  } else {
				  model.addAttribute("find", "fail");
			  }
			  
		  }
		  // 리턴해줌
		  return "member/findResult";
	  }
	  
	 
	
	 

	// 회원정보 진입전 비밀번호입력
	@RequestMapping("/modifyPass")
	public String modifyPass() throws Exception {

		return "member/modifyPass";
	}

	// 회원정보 불러옴
	@RequestMapping("/modifyForm")
	public String modify(MemberDto mem, HttpSession session, Model model, HttpServletRequest req) {

		String user_id = (String) session.getAttribute("login");
		// user_id가 세션에 없으면 메인으로( 비정상적 접속 )
		if (user_id == null || user_id == "") {
			return "redirect:/";
		}

		String user_pw = (String) req.getParameter("user_pw");

		if (memberservice.modifyForm(user_id, user_pw) != null) {

			mem = memberservice.modifyForm(user_id, user_pw);
			model.addAttribute("modify", mem);
			return "member/modifyForm";

		} else {
			model.addAttribute("fail", "실패");
			return "forward:modifyPass";

		}
	}

	// 회원정보 수정
	@RequestMapping("/modifyUpdate")
	public String modifyUpdate(HttpSession session, HttpServletRequest req, Model model) {
		String user_id = (String) session.getAttribute("login");
		String user_pw = req.getParameter("user_pw");
		String user_name = req.getParameter("user_name");
		String user_email = req.getParameter("user_email");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_name", user_name);
		map.put("user_email", user_email);

		int nResult = memberservice.modifyUpdate(map);
		if (nResult < 1) {
			model.addAttribute("updateMsg", "실패");
			return "member/modifyUpdate";
		} else {
			model.addAttribute("updateMsg", "성공");
			session.invalidate(); // 세션정보 초기화
			return "member/modifyUpdate";
		}
	}

	// 회원탈퇴
	@RequestMapping("/leave")
	public String leave(HttpServletRequest req, Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("login");
		String user_pw = req.getParameter("user_pw");
		itemService.cpDelete2(user_id);
		cartService.cartDelete2(user_id);
		int nResult = memberservice.leave(user_id, user_pw);

		if (nResult < 1) {
			
			System.out.println(nResult);
			model.addAttribute("deleteMsg", "실패");
			return "member/modifyUpdate";

		} else if(nResult > 0) {
			System.out.println(nResult);
			model.addAttribute("deleteMsg", "성공");
			return "member/modifyUpdate";
		}
		return "redirect:/";
	}
	// 마이페이지 -회원탈퇴 페이지
	@RequestMapping("/deleteMember")
	public String deleteMember() throws Exception {

		return "mypage/deleteMember";
	}

	// 마이페이지 -회원탈퇴db처리
	@RequestMapping("/deleteMember2")
	public String deleteMember2(HttpServletRequest req, Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("login");
		String user_pw = req.getParameter("user_pw");

		int nResult = memberservice.leave(user_id, user_pw);

		if (nResult < 1) {

			model.addAttribute("deleteMsg", "실패");
			return "mypage/deleteMember";

		} else {
			model.addAttribute("deleteMsg", "성공");
			return "mypage/deleteMember";
		}
	}

}