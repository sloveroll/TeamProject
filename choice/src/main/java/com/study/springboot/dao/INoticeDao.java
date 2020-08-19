package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.PagingDto;

//MyBasic와 객체를 연결하는 어노테이션.
//@Mapper는 즉 , xml연결 
@Mapper
public interface INoticeDao {
	//글목록 
	public List<NoticeDto> NoticelistDao();
	//글게시판번호 
	public NoticeDto NoticeviewDao(String notice_idx);
	//글쓰기 
	public int NoticewriteDao(Map<String, String> map);
	//글수정
	public int NoticemodifyDao(Map<String, String> map);
	//글삭제 
	public int NoticedeleteDao(@Param("_notice_idx") String notice_idx);
	
	//조회수 : 매퍼 NoticeDao에서 resulttype이 없어 리턴형식이없기 때문에 void로 생성.
		public void NoticehitDao(String notice_idx);
		
	// 공지사항 게시물 총 갯수
	public int countBoardDao();

	// 공지사항 페이징 처리 게시글 조회
	public List<NoticeDto> NoticePagingDao(PagingDto dto);
	
		
		
}


