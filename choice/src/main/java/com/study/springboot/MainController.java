package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() throws Exception {
		
		return "index";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() throws Exception {
		
		return "member/joinForm";
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
