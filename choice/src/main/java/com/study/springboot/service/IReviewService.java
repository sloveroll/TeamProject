package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.PagingDto;
import com.study.springboot.dto.ReviewDto;

public interface IReviewService {
	
	
	public List<ReviewDto> Reviewlist();
	public ReviewDto review(String review_idx);
	public int reviewWrite(Map<String, String> map);
	public int reviewModify(Map<String, String> map);
	public int reviewDelete(@Param("_review_idx") String review_idx);

	
	

			// 제품리뷰 게시물 총 갯수
			public int ReviewcountBoard();

			// 제품리뷰 페이징 처리 게시글 조회
			public List<ReviewDto> ReviewPaging(PagingDto dto);
}
