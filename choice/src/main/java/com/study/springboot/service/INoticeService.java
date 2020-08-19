package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.PagingDto;

public interface INoticeService {
	    //게시판 목록 리스트
		public List<NoticeDto> Noticelist();
		//게시판 뷰 
		public NoticeDto Noticeview(String notice_idx);
		//게시판 글 쓰기 
		public int Noticewrite(Map<String, String> map);
		//게시판 글 수정
		public int Noticemodify(Map<String, String> map);
		//게시판 글 삭제
		public int Noticedelete(@Param("_notice_idx") String notice_idx);
		
		//조회수 : 리턴값 없기때문에 void로 처리.
		public void Noticehit(String notice_idx);

				
		// 게시물 총 갯수
		public int countBoard();

		// 페이징 처리 게시글 조회
		public List<NoticeDto> NoticePaging(PagingDto dto);
			
				
			
}
