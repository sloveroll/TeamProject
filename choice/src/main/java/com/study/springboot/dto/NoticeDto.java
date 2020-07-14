package com.study.springboot.dto;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	
	
}
