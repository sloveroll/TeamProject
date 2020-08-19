package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.PagingDto;

public interface ICscenterService {
	
		public List<CscenterDto> Cscenterlist();
		public CscenterDto Cscenterview(String cs_idx);
		public int Cscenterwrite(Map<String, String> map);
		public int Cscentermodify(Map<String, String> map);
		public int Cscenterdelete(@Param("cs_idx") String cs_idx);
		
		
		
		
		//조회수 : 리턴값 없기때문에 void로 처리.
				public void Cscenterhit(String cs_idx);

				
				// Cscenter게시물 총 갯수
				public int CscentercountBoard();

				// 페이징 처리 게시글 조회
				public List<CscenterDto> CscenterPaging(PagingDto dto);
			
				
			
}
