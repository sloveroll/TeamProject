package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.OrderListDto;
import com.study.springboot.dto.itemDto;

public interface IAdminService {

	// 회원정보
	public List<MemberDto> adminMember();
	
	//회원삭제
	public int adminMemberDelete(@Param("_user_idx") String user_idx);

	// 고객문의
	public List<CscenterDto> adminCscenter();

	// 상품리스트
	public List<itemDto> adminItemList();

	// 상품작성
	public int adminProductWrite(Map<String, String> map);

	// 상품뷰
	public itemDto productView(String item_idx);

	// 상품수정
	public int productModify(Map<String	, String> map);
	
	//상품삭제
	public int productDelete(@Param("_item_idx") String item_idx);
	
	//주문목록
	public List<OrderListDto> adminOrderList();
	
	//상품현황수정
	public int confirm(@Param("or_confirm") String or_confirm, @Param("or_idx") String or_idx);
	
	//상품현황뷰
	public OrderListDto confirmView(String or_idx);

}
