package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.study.springboot.service.IBuyTicketService;

@Controller
public class MyController {

	@Autowired
	IBuyTicketService service;
	
	

	@RequestMapping("/")
	public String root() throws Exception {

//		return "트랙잭션 없음(예제1)";		
		return "redirect:buy_ticket";

	}// root

	
//	http://localhost:8081/buy_ticket 위방식으로 실행 
	@RequestMapping("/buy_ticket")
	public String buy_ticket() {

		return "buy_ticket";

	}// buy_ticket

	// @RequestParam : request 매개변수를 바로 매칭 , 매핑 가능. getPrameter() 함수를 대체 하는 역할
	@RequestMapping("/buy_ticket_card")
	public String buy_ticket_card(@RequestParam("consumerId") String consumerId, 
			                      @RequestParam("amount") String amount,
			                      @RequestParam("error") String error, Model model) {

		int nResult = service.buy(consumerId, Integer.parseInt(amount), error);


		model.addAttribute("consumerId", consumerId);
		model.addAttribute("amount", amount);

		if (nResult == 1) {
			return "buy_ticket_end";// 구매성공
		} else {
			return "buy_ticket_error";// 구매실패
		}

	}// buy_ticket_card

}// MyController
