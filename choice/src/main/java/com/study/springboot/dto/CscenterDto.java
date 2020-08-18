package com.study.springboot.dto;

import lombok.Data;

//DTO : Data Transfer Object : 데이타 저장/전송용도 클래스

@Data
public class CscenterDto {
	private String cs_idx;
	private String cs_title;
	private String cs_content;
	private String cs_date;
	private String cs_hit;
	private String cs_writer;
	//Getter/Setter
}
