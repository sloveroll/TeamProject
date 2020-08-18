package com.study.springboot.dto;

import lombok.Data;



//상품에  관련된 정보
@Data
public class cartDto {
	private String cr_user_id;
	private int cr_item_idx;
	
	private int item_price;
	
	private int cart_idx;
	private int cart_item_count;
	private int cart_item_sellprice;
	private int cart_totalsum;
	private String item_name;
	private String item_thumbnail;
	
}
