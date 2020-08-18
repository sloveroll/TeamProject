package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.cartDto;

public interface ICartService {
	

	
	//장바구니 리스트
		public List<cartDto> cartList(String user_id);
		//업뎃
		public int cartUpdate(Map<String, String> map);
		//추가
		public int cartInsert(Map<String, String> map);
		//삭제 
		public int cartDelete(String user_id, int cart_idx);
		//유저카트 비우기
		public int cartDelete2(String user_id);
		//구매시삭제
		public int cartBuyDelete(Map<String, String> cartBuyDelete);
		//중복되는 장바구니 내 상품 유무 갯수
		public int cartCount(String user_id, String cr_item_idx);
		//해당 유저 장바구니 상품 총 갯수
		public int cartIdxCount(String user_id);
		
		public List<cartDto> cartBuy(Map<String, String> map) ;
		
}

