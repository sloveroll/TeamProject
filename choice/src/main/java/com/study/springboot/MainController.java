package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() throws Exception {
		
		return "views/index";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() throws Exception {
		
		return "views/loginForm";
	}
	@RequestMapping("/list")
	public String list() throws Exception {
		
		
		
		
		return "bbs/list";
	}
	
	
	@RequestMapping("/joinForm")
	public String joinForm() throws Exception {
		
		return "views/joinForm";
	}
	
	@RequestMapping("/DeleteForm")
	public String DeleteForm() throws Exception {
		
		return "views/DeleteForm";
	}
	
	
	
}
