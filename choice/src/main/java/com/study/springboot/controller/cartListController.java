package com.study.springboot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.service.ICartService;

@Controller
public class cartListController {
	
	
	// 쿠폰 및 상품관련
	@Autowired
	ICartService cartService;
	
	
	///////////////////////////////////////////

	//장바구니페이지
	@RequestMapping("/cartList")
	public String cartList(Model model, HttpSession session) throws Exception {
		
		 if(session.getAttribute("login")==null || session.getAttribute("login")=="") {
			 return "redirect:/loginForm";
		 }
		 
		
		//아디 검증
		  if(session.getAttribute("login")!=null || session.getAttribute("login")!=""){ 
			  String user_id = (String)session.getAttribute("login");
		//유저 카트에 있는 상품 갯수 체크
		  int nResult= cartService.cartIdxCount(user_id) ;
		//있으면 
		if(nResult > 0) {
			  
		 
			  //리스트로 넣음
			  model.addAttribute("cartlist", cartService.cartList(user_id));
			  
			  //없으면 msg 등록
			  } else {
				  model.addAttribute("msg", "1");
			  }
		//아디 없어도 msg등록
		 } else {
			 model.addAttribute("msg", "1");
		 }
		  
		  
			  return "mypage/cartList";
		  }
	
	//삭제
	@RequestMapping(value="/cartDelete")
	public String cartDelete(Model model, HttpSession session, HttpServletRequest req) throws Exception {
		String user_id = (String)session.getAttribute("login");
		int cart_idx =  Integer.parseInt(req.getParameter("cart_idx"));
		//삭제쿼리
		int nResult = cartService.cartDelete(user_id, cart_idx);
		return "redirect:/cartList";
		
		
	}
	@RequestMapping(value="/cartDelete2")
	public String cartBuyDelete(Model model, HttpSession session, HttpServletRequest req) throws Exception {
		String user_id = (String)session.getAttribute("login");
		Map <String, String> cartBuyDelete = new HashMap<String, String>();
		cartBuyDelete.put("user_id", user_id);
		cartBuyDelete.put("cart_idx1", "0");
		cartBuyDelete.put("cart_idx2", "0");
		cartBuyDelete.put("cart_idx3", "0");
		int j=1;
		for(int i=0; i<100; i++) {
			if(req.getParameter("cart_idx"+i)!=null && req.getParameter("cart_idx"+i)!="" ) {
				cartBuyDelete.put("cart_idx"+j++, String.valueOf(i));
			}
		}
		//삭제쿼리
		System.out.println(cartBuyDelete);
		int nResult = cartService.cartBuyDelete(cartBuyDelete);
		return "redirect:/cartList";
		
		
	}
	//추가
	@RequestMapping("/cartInsert")
	public String cartInsert(Model model, HttpSession session, HttpServletRequest req) throws Exception {
		if(session.getAttribute("login") != null && session.getAttribute("login") != "" ) {
			String user_id=(String)session.getAttribute("login");
			String cr_item_idx = req.getParameter("item_idx");
			String cart_item_count =  req.getParameter("count");
			String cart_item_sellprice = req.getParameter("item_price");

			//해당 유저의 카트리스트 총 갯수를 가져옴
			int nResult = cartService.cartIdxCount(user_id);
			// 갯수가 아래 조건에 맞을 때 실행
			if( nResult <= 3 ) {
				 

				 //추가하는 상품과 DB에 있는 상품이 동일한지 체크
				int nResult2 =  cartService.cartCount(user_id, cr_item_idx);
				
				// 동일하지 않을시
			if( nResult2 > 0) {
					//업데이트하는부분
				  Map <String, String>map = new HashMap<String, String>();
					map.put("user_id", user_id);
					map.put("cart_item_count", cart_item_count);
					map.put("cr_item_idx", cr_item_idx);
					
					
					// 기존 갯수 + 추가 수량
					int update = cartService.cartUpdate(map);
					
					return "redirect:/cartList";
			//nResult의 값이 아래 조건에 맞을 때
					
			} else if(nResult <= 2) {   
				//db 추가하는 부분 
				Map<String, String> map = new HashMap<String, String>();
				map.put("user_id", user_id);
				map.put("cr_item_idx", cr_item_idx);
				map.put("cart_item_count", cart_item_count);
				map.put("cart_item_sellprice", cart_item_sellprice);
				int nResult3 = cartService.cartInsert(map);
				
				return "redirect:/cartList";
			} else {
			//nResult가 2보다 클 때 추가 안되게
			 model.addAttribute("full","fail");	
	
			 //modifyUpdate <<< msg 띄우는 jsp
			 return "member/modifyUpdate";
			}
			
			} 
			
		} 
			//로그인 안됐으면 로그인창으로
			return "redirect:loginForm" ;
	
	}
	

}