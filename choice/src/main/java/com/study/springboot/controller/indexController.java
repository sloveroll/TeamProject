package com.study.springboot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.service.IHomeService;

@Controller
public class indexController {


	// 메인홈페이지 반찬리스트 8개
	@Autowired
	IHomeService homeService;


	// 메인페이지
	@RequestMapping("/")
	public String index(Model model, HttpSession session, @RequestParam(value="fail", required=false) String fail) throws Exception {

		if(fail != null) {
			model.addAttribute("fail", fail);
		} else {
			model.addAttribute("fail", "0");
		}
		// 메인화면에 상품목록 들고올꺼 item8개 등록
		model.addAttribute("item", homeService.itemList());
		
		
		return "index";
	}

}

	