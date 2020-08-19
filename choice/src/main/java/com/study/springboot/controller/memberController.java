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
	// 제품리뷰 파일업로드
	@Autowired
	IReviewService ReviewService;
	// 제품
	@Autowired
	IitemService itemService;
	// 장바구니
	@Autowired
	ICartService cartService;

	// 회원가입 폼
	@RequestMapping("/joinForm")
	public String joinForm() throws Exception {

		return "member/joinForm";
	}

	// 아이디 중복확인onclick="idCheck"
	// 회원가입 체크 @RequestMapping은 url뿐아니라, 파라미터, 헤더 적용가능
	// url패턴으로 String 배열 여러개 지정 가능 , @RequestMapping("/idCheck","/idCheck2")
	@ResponseBody
	// @ResponseBody 응답본문 ,서버에서 클라이언트 응답데이터 전송위해 사용,즉 joinform.jsp의 ajax url
	// /idCheck 응답위해
	// @ResponseBody 자바객체를 http응답 body로 전송가능
	// @RequestMapping("/idCheck/{postID}"){}사용 url템플릿사용가능
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {

		String user_id = req.getParameter("id");
		// count는 IMemberService의 idCheck중복확인
		int nResult = memberservice.count(user_id);
		int result = 0;
		if (nResult > 0) {
			result = 1;
		}
		return result;
	}

	// 회원가입 처리후 , index메인화면으로 돌아감 회원가입버튼클릭시 form action=join_ok
	@RequestMapping("/join_ok")
	public String join_ok(HttpServletRequest req, Model model) {
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
			// 첫주문할인쿠폰 3000원증정
			Map<String, String> insertCp = new HashMap<String, String>();
			insertCp.put("user_id", user_id);
			insertCp.put("cp_idx", "999");
			insertCp.put("cp_name", "첫주문 할인쿠폰");
			insertCp.put("cp_saleprice", "3000");
			itemService.cpInsert(insertCp);

			System.out.println("회원가입에 성공했습니다.");
			System.out.println("첫주문 할인쿠폰지급 되었습니다.");
			return "redirect:/";
		}

	}

	// 로그인페이지
	@RequestMapping("/loginForm")
	public String loginForm(@RequestParam(value = "fail", required = false) String buy) throws Exception {

		return "member/loginForm";
	}

	// 로그인체크 checkValue()
	@RequestMapping("/login_ok")
	// loginForm에서 넘긴 값 가지고 오기
	public String loginPost(MemberDto mem, Model model, HttpServletRequest req, HttpSession session,
			// 리다이렉트 해도 파라미터를 보낼 수 있음
			RedirectAttributes redirectAttributes) {

		if (memberservice.login(mem) != null) {
			mem = memberservice.login(mem);
			String user_id = mem.getUser_id();
			session.setAttribute("login", user_id);// user_id 오라클 아이디값을 세션에 login문자열로 지정 .

			return "redirect:/";
		} else {
			// 보낼 파라미터를 등록해줌
			redirectAttributes.addAttribute("fail", "fail");
			return "redirect:/loginForm";
		}

	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();// 세션에 있는 로그값 지움
		return "redirect:/";
	}

	// 아디비번찾기 폼
	@RequestMapping("/findForm")
	public String findForm() throws Exception {

		return "member/findForm";
	}

	// 아디/비번찾기form 전송 값 도착
	@RequestMapping("/find")
	public String find(HttpServletRequest req, Model model) throws Exception {
		// 파라미터 값이 id인지 pw 인지 검증
		// findCheck는 findForm.jsp의 hidden 타입 name값임 .
		if (req.getParameter("findCheck").equals("id")) {
			// IMemberDao 파라미터 findIdDao이름, 이메일 값 받아옴
			String user_name = req.getParameter("user_name");
			String user_email = req.getParameter("user_email");
			// IMemberDao
			// 결과 값이 null이 아니면 모델등록
			if (memberservice.findId(user_name, user_email) != null) {
				model.addAttribute("user_info", memberservice.findId(user_name, user_email));
				model.addAttribute("findResult", "id");
				// 결과 값이 없으면 fail 등록

			} else {
				// 가입된정보 없습니다.alert창 띄움
				model.addAttribute("findResult", "fail");
			}

			// 위와 동일 비밀번호findPwDao
			// findCheck는 findForm.jsp의 hidden 타입 name값임 .
		} else if (req.getParameter("findCheck").equals("pw")) {
			// findPwDao 아이디 , 이메일 파라미터 값 불러옴 .
			String user_id = req.getParameter("user_id");
			String user_email = req.getParameter("user_email");

			if (memberservice.findPw(user_id, user_email) != null) {
				model.addAttribute("user_info", memberservice.findPw(user_id, user_email));
				model.addAttribute("findResult", "pw");

			} else {
				model.addAttribute("findResult", "fail");
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

		// 아이디조회
		String user_id = (String) session.getAttribute("login");
		// user_id가 세션에 없으면 메인으로( 비정상적 접속 )
		if (user_id == null || user_id == "") {
			return "redirect:/";
		}
		// 비번 조회
		String user_pw = (String) req.getParameter("user_pw");

		// 아이디 비번 비워져있지않을시
		if (memberservice.modifyForm(user_id, user_pw) != null) {
//			MemberDto 에 modifyForm
			mem = memberservice.modifyForm(user_id, user_pw);
			model.addAttribute("modify", mem);// modifyForm에 value="${modify.user_pw}"
			return "member/modifyForm";

		} else {
			model.addAttribute("fail", "실패");
			return "forward:modifyPass";

//forward vs redirect :페이지 이동 두가지방식
//			forward:요청정보가 그대로 유지전달 	,request와 response객체 공유,시스템에변화가없는 단순조회(리스트보기,검색)  
//			redirect:요청정보가 새로전달 	,request와 response객체 새로생성 ,시스템(session,db)에 변화가 생기는 요청( 로그인, 회원가입 ,글쓰기)

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

//		IMemberService의 modifyUpdate
		int nResult = memberservice.modifyUpdate(map);
		// 위 id,pw,name,email 입력값 없을시 updateMsg
		if (nResult < 1) {
			model.addAttribute("updateMsg", "실패");
			return "member/modifyUpdate";

		} else {
			// 위 id,pw,name,email 입력값 있을시 updateMsg
			model.addAttribute("updateMsg", "성공");
			session.invalidate(); // 회원세션정보 초기화
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

		} else if (nResult > 0) {
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

		itemService.cpDelete2(user_id);
		cartService.cartDelete2(user_id);

		int nResult = memberservice.leave(user_id, user_pw);

		if (nResult < 1) {

			System.out.println(nResult);
			model.addAttribute("deleteMsg", "실패");
			return "mypage/deleteMember";

		} else if (nResult > 0) {
			System.out.println(nResult);
			model.addAttribute("deleteMsg", "성공");
			return "member/modifyUpdate";
		}
		return "redirect:/";

	}

}