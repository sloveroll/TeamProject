package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.service.IBuyTicketService;

@Controller
public class MyController {

	@Autowired
	IBuyTicketService service;
	
	@RequestMapping("/")
	public String root() throws Exception {
		/* return "트랜잭션 없음(예제1)"; */
		return "redirect:buy_ticket";
	}
	
	@RequestMapping("/buy_ticket")
	public String buy_ticket() {
		return "buy_ticket";
	}
	
	//@RequestParam : request 매개변수 바로 매칭. getParameter()함수 대체.
	@RequestMapping("/buy_ticket_card")
	public String buy_ticket_card(@RequestParam("consumerId") String consumerId, 
								  String amount,
								  String error,
								  Model model) 
	{
		int nResult = service.buy(consumerId, Integer.parseInt(amount), error);
		
		model.addAttribute("consumerId", consumerId);
		model.addAttribute("amount", amount);
		
		if( nResult == 1) {
			return "buy_ticket_end"; //구매 성공
			
		}else {
			return "buy_ticket_error"; //구매 실패
		}
		
	}
	
}
