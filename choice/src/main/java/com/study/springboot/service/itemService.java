package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IitemDao;
import com.study.springboot.dto.CouponDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.itemDto;

@Service
public class itemService implements IitemService {
	
	@Autowired
	IitemDao itemdao;
	
	
	 //쿠폰수
	@Override
	public int CpCount(String user_id) {
		return itemdao.CpCountDao(user_id);
	}
	//쿠폰리스트
	@Override
	public List<CouponDto> couponList(String user_id) {
		return itemdao.couponListDao(user_id);
	}
	
	//쿠폰 발급 전 유저가 가지고 있는지 갯수 확인
	@Override
	public int cpCheck(@Param("user_id")String user_id, @Param("cp_idx")String cp_idx) {
		int Result = itemdao.cpCheckDao(user_id, cp_idx);
		return Result;
	}
	
	//쿠폰 이벤트 클릭시 해당 유저한테 추가해줌
	@Override
	public int cpInsert(Map<String, String> insertCp) {
		int Result = itemdao.cpInsertDao(insertCp);
		return Result;
	}
	@Override
	public int cpDelete2(String user_id) {
		int result = itemdao.cpDeleteDao2(user_id);
		return result;
	}
	
	
	//상품 구매시 쿠폰삭제
	@Override
	public int cpDelete(String user_id,String cp_idx) {
		int result = itemdao.cpDeleteDao(user_id, cp_idx);
		return result;
	}
	
	//홈페이지에서 상품 눌러서 Detail페이지로 들어갈 때 해당 상품의 idx로 정보를 불러옴
	@Override
	public itemDto itemDetail(String item_idx) {
		return itemdao.itemDetailDao(item_idx);
	}
	
	//주문자 정보 가져옴
	@Override
	public MemberDto orderinfo(String user_id) {
		return itemdao.orderinfoDao(user_id);
	}
	//검색
	public List<itemDto> search(String searchWord){
		return itemdao.searchDao(searchWord);
	}
	//검색갯수
		public int searchCount(String searchWord) {
			return itemdao.searchCountDao(searchWord);
		}
	
	}
