package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.PagingDto;

//MyBasic와 객체를 연결하는 어노테이션.
@Mapper
public interface ICscenterDao {
	public List<CscenterDto> CscenterlistDao();
	public CscenterDto CscenterviewDao(String cs_idx);
	public int CscenterwriteDao(Map<String, String> map);
	public int CscentermodifyDao(Map<String, String> map);
	public int CscenterdeleteDao(@Param("cs_idx") String cs_idx);
	
	
	//조회수 : 매퍼 NoticeDao에서 resulttype이 없어 리턴형식이없기 때문에 void로 생성.
		public void CscenterhitDao(String cs_idx);//cs게시판 조회수
		
		// Cscenter게시물 총 갯수
		public int CscentercountBoardDao();//페이징 갯수

		//cscenter페이징 처리 게시글 조회
		public List<CscenterDto> CscenterPagingDao(PagingDto dto);
	
		
		
}


