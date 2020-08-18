package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.cartDto;

@Mapper
public interface ICartDao {
	//장바구니 리스트
		public List<cartDto> cartListDao(String user_id);

		//추가
		public int cartInsertDao(Map<String, String> map);
		//삭제
		public int cartDeleteDao(@Param("user_id")String user_id,@Param("cart_idx")int cart_idx);
		//유저 카트 비우기
		public int cartDeleteDao2(String user_id);
		//카트 상품 삭제
		public int cartBuyDeleteDao(Map<String, String> cartBuyDelete);
		//갯수
		//유저가 추가한 상품이 이미 장바구니에 있는지 체크
		public int cartCountDao(@Param("user_id")String user_id, @Param("cr_item_idx")String cr_item_idx);
		//유저 장바구니에 있는 상품 종류
		public int cartIdxCountDao(String user_id);
		//업뎃                장바구니에 이미 있는 상품의 경우 기존 수량 + 추가한 수량
		public int cartUpdateDao(Map<String, String> map);		
		//카트 <!-- 장바구니에서 구매 클릭시 -->
		public List<cartDto> cartBuyDao(Map<String, String> map);
}
