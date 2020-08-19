package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.CouponDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.itemDto;

@Mapper
public interface IitemDao {
	// 쿠폰갯수
	public int CpCountDao(String user_id);

	// 쿠폰 발급 전 유저가 가지고 있는지 갯수 확인
	public int cpCheckDao(@Param("user_id") String user_id, @Param("cp_idx") String cp_idx);

	// 쿠폰 이벤트 클릭시 해당 유저한테 추가해줌
	public int cpInsertDao(Map<String, String> insertCp);

	// 쿠폰목록을 리스트로 들고옴
	public List<CouponDto> couponListDao(String user_id);

	// 상품 구매시 사용한 쿠폰을 삭제
	public int cpDeleteDao(@Param("user_id") String user_id, @Param("cp_idx") String cp_idx);

	// 유저꺼 전부 삭제
	public int cpDeleteDao2(String user_id);

	// 검색결과
	public List<itemDto> searchDao(String searchWord);

	// 검색갯수
	public int searchCountDao(String searchWord);

    // 홈페이지index에서 상품메뉴상세 눌러서 itemDetail페이지로 들어갈 때 해당 상품의 item_idx로 정보를 불러옴
	// itemService로 @Override처리 
	public itemDto itemDetailDao(String item_idx);

	// itemBuy에서 주문자에 대한 정보를 불러온다. (####MemberDao부분을 수정하면 안 써도 될 수 있음)
	public MemberDto orderinfoDao(String user_id);

	// 아이템분류
	public List<itemDto> SortListDao(String item_sort);

}
