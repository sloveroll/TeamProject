package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.PagingDto;
import com.study.springboot.dto.ReviewDto;

@Mapper
public interface IReviewDao {

	public List<ReviewDto> ReviewlistDao();
	
	public ReviewDto ReviewDao(String review_idx);
	public int reviewWriteDao(Map<String, String> map);
	public int reviewModifyDao(Map<String, String> map);
	public int reviewDeleteDao(@Param("_review_idx") String review_idx);


		
		//  제품리뷰 게시물 총 갯수
		public int ReviewcountBoardDao();

		// 제품리뷰 페이징 처리 게시글 조회
		public List<ReviewDto> ReviewPagingDao(PagingDto dto);
}
