package com.study.springboot.dto;

import lombok.Data;


//쿠폰
@Data
public class CouponDto {
	private int cp_idx;
	private String cp_name;
	private int cp_saleprice;
	private String cp_date;
	private String cp_dateend;

	
	
	
}
