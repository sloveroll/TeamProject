package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CouponDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.itemDto;

public interface IitemService {
	
	//쿠폰 소유수
	public int CpCount(String user_id);
	//쿠폰리스트
	public List<CouponDto> couponList(String user_id);
	//쿠폰 발급 전 유저가 가지고 있는지 갯수 확인
	public int cpCheck(@Param("user_id")String user_id, @Param("cp_idx")String cp_idx);
	//쿠폰 이벤트 클릭시 해당 유저한테 추가해줌
	public int cpInsert(Map<String, String> insertCp);
	//상품 구매시 사용한 쿠폰 삭제
	public int cpDelete(String user_id, String cp_idx);
	public int cpDelete2(String user_id);
	
	
	//검색
	public List<itemDto> search(String searchWord);
	//검색갯수
	public int searchCount(String searchWord);
	
	//홈페이지에서 상품 눌렀을 떄 그 해당 상품의 idx를 넣어서 상품을 불러옴 
	public itemDto itemDetail(String item_idx);
		
	//itemBuy에서 주문자에 대한 정보를 불러온다. (####MemberDao부분을 수정하면  안 써도 될 수 있음)
	public MemberDto orderinfo(String user_id);
	
	
}

