package com.study.springboot.dto;

import lombok.Data;

@Data
public class ReviewDto {

	private String review_idx;
	private String review_item_idx;
	private String review_title;
	private String review_content;
	private String review_date;
	private String review_writer;
	private String review_thumbnail;
	private String review_score;
}
