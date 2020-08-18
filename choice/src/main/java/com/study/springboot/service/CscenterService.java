package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ICscenterDao;
import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.PagingDto;

//@Service, Controller, @Repository가 동일한 기능을 한다. 저장소
//해당 클래스의 객체들을 빈으로 등록하고 만들 때 사용
@Service
public class CscenterService implements ICscenterService {
      
      //객체면 Autowired 변수면 bean 자동생성
      @Autowired
      ICscenterDao Cscenterdao;
      //이 자리에 여러 DAO들을 등록하고 관리하겠다.
      //여러 테이블의 여러 트랜잭션들을 수행하게 된다.
      
      
      //고객센터리스트 보기 
      @Override
      public List<CscenterDto> Cscenterlist() {
         
         return Cscenterdao.CscenterlistDao();
      }
      
      
      @Override
      public CscenterDto Cscenterview(String cs_idx) {
    	//조회수 : view로 넘어가야 idx=데이터idx 값을 받기 때문에 view에 집어넣어줘야함.
    	  Cscenterdao.CscenterhitDao(cs_idx);
         return Cscenterdao.CscenterviewDao(cs_idx);
      }
      
 	 //고객센터 상담글작성
      @Override
      public int Cscenterwrite(Map<String, String> map) {
         int nResult = Cscenterdao.CscenterwriteDao(map);
         return nResult;
      }
      
      //고객센터 상담글수정
      @Override
      public int  Cscentermodify(Map<String, String> map) {
         int nResult = Cscenterdao.CscentermodifyDao(map);
         return nResult;
      }
      
      //고객센터 상담글삭제
      public int  Cscenterdelete(String cs_idx) {
          int nResult = Cscenterdao. CscenterdeleteDao(cs_idx);
          return nResult;
       }


      //고객센터 조회수 : void기때문에 return값 없음.
      @Override
      public void Cscenterhit(String cs_idx) {
         
      }
     
      	//고객센터 게시물 총 갯수
   		@Override
      	public int CscentercountBoard() {
   			return Cscenterdao.CscentercountBoardDao();
   		}

   		// 고객센터 페이징 처리 게시글 조회
   		
   		@Override
   		public List<CscenterDto> CscenterPaging(PagingDto dto){
   			return Cscenterdao.CscenterPagingDao(dto);
   		}

   	
   
}