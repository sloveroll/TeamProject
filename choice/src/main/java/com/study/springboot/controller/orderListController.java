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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.service.ICartService;
import com.study.springboot.service.IOrderListService;
import com.study.springboot.service.IitemService;

@Controller
public class orderListController {
	
	
	// 쿠폰 및 상품관련
	@Autowired
	IOrderListService orderListService;
	@Autowired
	ICartService cartService;
	@Autowired
	IitemService itemService;
	
	@RequestMapping("/orderList_ok")
	public String orderList_ok(HttpSession session, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		
		String sUser_id = (String) session.getAttribute("login");
		String Sor_receiver = request.getParameter("or_receiver");
		String Sor_phone = request.getParameter("or_phone");
		String Sor_address = request.getParameter("or_address");
		String Sor_address2 = request.getParameter("or_address2");
		String Sor_email = request.getParameter("or_email");
		String Sor_buysum = request.getParameter("hBuySum"); 
		String Sor_coupon = request.getParameter("hCoupon");
		String Sor_totalsum = request.getParameter("hTotalSum");
		String Scount = request.getParameter("hCount");
		String Sitem_idx = request.getParameter("item_idx");
		
		
		
		

		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", sUser_id);
		map.put("or_receiver", Sor_receiver);
		map.put("or_phone", Sor_phone);
		map.put("or_address", Sor_address);
		map.put("or_address2", Sor_address2);
		map.put("or_email", Sor_email);
		map.put("or_buysum", Sor_buysum);
		map.put("or_coupon", Sor_coupon);
		map.put("or_totalsum", Sor_totalsum);  
		map.put("or_count", Scount); 
		map.put("or_item_idx", Sitem_idx); 
		map.put("or_confirm", "주문완료"); 

		int nResult = orderListService.orderListWrite(map);
		if (nResult < 1) {
			return "redirect:/";
		} else {
			redirectAttributes.addAttribute("buy", true);
			return "redirect:itemEnd";
		}
	}
		//itemBuy의 form을 itemend로 넘기면서 db에 insert하기.
		@RequestMapping("/orderList_ok2")
		public String orderList_ok2(HttpSession session, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
			
			String sUser_id = (String) session.getAttribute("login");
			String Sor_receiver = request.getParameter("or_receiver");
			String Sor_phone = request.getParameter("or_phone");
			String Sor_address = request.getParameter("or_address");
			String Sor_address2 = request.getParameter("or_address2");
			String Sor_email = request.getParameter("or_email");
			String Sor_buysum = request.getParameter("hBuySum"); 
			String Sor_coupon = request.getParameter("hCoupon");
			String Sor_totalsum = request.getParameter("hTotalSum");
			String Sor_cp_idx = request.getParameter("hCouponIdx");
			
			
			System.out.println(Sor_cp_idx);
			String[] Scount = request.getParameterValues("hCount");
			
			//map(오더리스트에 추가할 map)
			//cartBuyDelete(구매시 장바구니삭제에 쓸 map)
			Map<String, String> map = new HashMap<String, String>();
			Map<String, String> cartBuyDelete = new HashMap<String, String>();
			cartBuyDelete.put("user_id", sUser_id);
			cartBuyDelete.put("cart_idx1", "0");
			cartBuyDelete.put("cart_idx2", "0");
			cartBuyDelete.put("cart_idx3", "0");
			map.put("or_count1", "0");
			map.put("or_count2", "0");
			map.put("or_count3", "0");
			map.put("or_item_idx1", "0");
			map.put("or_item_idx2", "0");
			map.put("or_item_idx3", "0");
			
			//이전 페이지에서 받은 Parameter값의 유무를 판단하기 위해  for문을 통해
			//확인하고  위 0으로 설정되어있는 idx, count의 값을 다시 넣어줌
			int j=1;
			int k=1;
			int l=1;
			//넘겨받은 데이터들을 해당 이름으로 정렬
			for(int i =0; i<Scount.length; i++) {
				if(Scount[i] != null) {
					map.put("or_count"+j++, String.valueOf(Scount[i]));	
					System.out.println(map.get("or_count"+j));
			}
			
			}
			
			//i<100으로하면 item_idx를 100번까지 집어넣을 수 있다.
			for(int i=1; i<100; i++) {
				if( request.getParameter("cart_idx" + i) != null ) {
					cartBuyDelete.put("cart_idx"+l++, request.getParameter("cart_idx" + i ));
				}
				if( request.getParameter("item_idx"+i) != null) {
					map.put("or_item_idx"+k++, String.valueOf(i));
				}
			}
			map.put("user_id", sUser_id);
			map.put("or_receiver", Sor_receiver);
			map.put("or_phone", Sor_phone);
			map.put("or_address", Sor_address);
			map.put("or_address2", Sor_address2);
			map.put("or_email", Sor_email);
			map.put("or_buysum", Sor_buysum);
			map.put("or_coupon", Sor_coupon);
			map.put("or_totalsum", Sor_totalsum);  
			
			
			//추가결과 출력
			int nResult = orderListService.orderList2(map);
			if (nResult < 1) {
				System.out.println("쓰기를 실패했습니다.");
				return "redirect:itemBuy";
			} else {
				
				System.out.println("쓰기를 성공했습니다.");
				
				//구매후 장바구니 비우기
				cartService.cartBuyDelete(cartBuyDelete);
				//쿠폰삭제
				if(!(Sor_cp_idx.equals("0"))){
				itemService.cpDelete(sUser_id, Sor_cp_idx);
				}
				
				//redirect를 해도 parameter를 보내주는 구문
				redirectAttributes.addAttribute("buy", true);
				return "redirect:itemEnd";
			}
		}

		@RequestMapping("/itemEnd")
		public String itemEnd(HttpSession session, HttpServletRequest request, 
				Model model, @RequestParam(value = "buy", required = false) boolean buy) {
			
		//buy한 것이 true이면  페이지를 로딩해주고 url을 입력해서 억지로 들어오면 다시 홈피로 보냄
			if(buy == true) {
			
			String sUser_id = (String) session.getAttribute("login");
			model.addAttribute("order", orderListService.orderListList(sUser_id));
			return "item/itemEnd";
			} else {
			
			 return "redirect:/";
			}
		}
}