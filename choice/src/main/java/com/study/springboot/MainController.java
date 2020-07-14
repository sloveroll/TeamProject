package com.study.springboot;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.service.IMemberService;
import com.study.springboot.service.INoticeService;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() throws Exception {
		
		return "index";
	}
	@Autowired
	IMemberService service;
	
	
	
	@Autowired
	INoticeService noticeService;
	//공지 
	@RequestMapping("/notice")
	public String userListPage(Model model) {
		//users에 리스트
		model.addAttribute("list", noticeService.Noticelist());
		
		return "notice/noticelist"; //list.jsp 호출하면서 list객체를 넘겨줌
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		
		return "member/joinForm";
}
		
	
	//가입체크
	@RequestMapping("/join")
	public String join(HttpServletRequest req, Model model)  {
		String user_id = req.getParameter("id");
		String user_pw = req.getParameter("pw");
		String user_name = req.getParameter("name");
		String user_email = req.getParameter("email");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		
		int nResult = service.join(map);
		if( nResult < 1) {
		System.out.println("쓰기를 실패했습니다");
		return "redirect:joinForm";
		} else {
			System.out.println("쓰기를 성공했습니다.");
			return "redirect:/";	
		}

	}
	
	
	@RequestMapping("/loginForm")
	public String loginForm() throws Exception {
		
		return "member/loginForm";
	}

	
	
	
	@RequestMapping("/modifyForm")
	public String modifyForm() throws Exception {
		
		return "member/modifyForm";
	}
	
	@RequestMapping("/cartList")
	public String cartList() throws Exception {
		
		return "mypage/cartList";
	}
	
	@RequestMapping("/coupon")
	public String coupon() throws Exception {
		
		return "mypage/coupon";
	}
	
	
	
	@RequestMapping("/deleteMember")
	public String deleteMember() throws Exception {
		
		return "mypage/deleteMember";
	}
	
	@RequestMapping("/modify")
	public String modify() throws Exception {
		
		return "mypage/modify";
	}
	
	@RequestMapping("/myPage")
	public String myPage() throws Exception {
		
		return "mypage/myPage";
	}
	
	@RequestMapping("/orderList")
	public String orderList() throws Exception {
	
		return "mypage/orderList";
	}
	
	@RequestMapping("/noticelist")
	public String noticelist() throws Exception {
	
		return "notice/noticelist";
	}
	
	@RequestMapping("/reviewlist")
	public String reviewlist() throws Exception {
	
		return "review/reviewList";
	}
	
	
	
	
	
	
}
