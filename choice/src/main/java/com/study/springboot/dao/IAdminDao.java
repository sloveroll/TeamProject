package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.OrderListDto;
import com.study.springboot.dto.itemDto;

@Mapper
public interface IAdminDao {

	// 회원정보
	public List<MemberDto> adminMemberDao();

	// 회원삭제
	public int adminMemberDeleteDao(@Param("_user_idx") String user_idx);

	// 고객문의
	public List<CscenterDto> adminCscenterDao();

	// 고객문의삭제
	public int adminCscenterDeleteDao(@Param("cs_idx") String cs_idx);

	// 상품리스트
	public List<itemDto> adminItemListDao();

	// 상품작성
	public int adminProductWriteDao(Map<String, String> map);

	// 상품뷰
	public itemDto productViewDao(String item_idx);

	// 상품수정
	public int productModifyDao(Map<String, String> map);

	// 상품삭제
	public int productDeleteDao(@Param("_item_idx") String item_idx);

	// 주문목록
	public List<OrderListDto> adminOrderListDao();

	// 상품현황수정
	public int confirmDao(@Param("or_confirm") String or_confirm, @Param("or_idx") String or_idx);

	// 상품현황뷰
	public OrderListDto confirmViewDao(String or_idx);

}
