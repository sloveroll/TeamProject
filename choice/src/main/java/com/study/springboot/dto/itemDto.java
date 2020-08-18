package com.study.springboot.dto;

import lombok.Data;

//상품에  관련된 정보
@Data
public class itemDto {

	private int item_idx;
	private String item_name;
	private int item_price;
	private String item_thumbnail;
	private String item_thumbnail2;
	private String item_thumbnail3;
	private String item_thumbnail4;
	private String item_sort;

}
