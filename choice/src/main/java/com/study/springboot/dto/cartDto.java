package com.study.springboot.dto;

import lombok.Data;



//상품에  관련된 정보
@Data
public class cartDto {
	private String cr_user_id;
	//메뉴아이템번호
	private int cr_item_idx;
	
//	private int item_price;
	
	//장바구니번호 
	private int cart_idx;
	//제품수량
	private int cart_item_count;
	//판매금액
	private int cart_item_sellprice;
	//구매금액
	private int cart_totalsum;
	//제품명
	private String item_name;
	//제품이미지
	private String item_thumbnail;
	
}
