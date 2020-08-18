package com.study.springboot.dto;

import lombok.Data;

//DTO : Data Transfer Object : 데이타 저장/전송용도 클래스

@Data
public class NoticeDto {
	private String notice_idx;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_hit;
	private String notice_writer;
	//Getter/Setter
}
