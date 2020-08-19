package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IAdminDao;
import com.study.springboot.dto.CscenterDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.OrderListDto;
import com.study.springboot.dto.itemDto;

@Service
public class AdminService implements IAdminService {

	@Autowired
	IAdminDao adminDao;

	// 회원관리
	@Override
	public List<MemberDto> adminMember() {

		return adminDao.adminMemberDao();
	}
	
	//회원삭제
	@Override
	public int adminMemberDelete(String user_idx) {
		int nResult = adminDao.adminMemberDeleteDao(user_idx);
		return nResult;
	}

	// 고객문의
	@Override
	public List<CscenterDto> adminCscenter() {

		return adminDao.adminCscenterDao();
	}
	//고객문의삭제
	@Override
	public int cscenterDelete(String cs_idx) {
		int nResult = adminDao.adminCscenterDeleteDao(cs_idx);
		return nResult;
	}

	// 상품리스트
	@Override
	public List<itemDto> adminItemList() {

		return adminDao.adminItemListDao();
	}

	// 상품작성
	@Override
	public int adminProductWrite(Map<String, String> map) {
		int nResult = adminDao.adminProductWriteDao(map);
		return nResult;
	}

	// 상품뷰
	@Override
	public itemDto productView(String item_idx) {

		return adminDao.productViewDao(item_idx);
	}

	// 상품수정
	@Override
	public int productModify(Map<String, String> map) {
		int nResult = adminDao.productModifyDao(map);
		return nResult;
	}
	
	//상품삭제
	@Override
	public int productDelete(String item_idx) {
		int nResult = adminDao.productDeleteDao(item_idx);
		return nResult;
	}
	
	//주문목록
	@Override
	public List<OrderListDto> adminOrderList() {
		return adminDao.adminOrderListDao();
	}
	
	//상품현황수정
	@Override
	public int confirm(String or_confirm,String or_idx) {
		int nResult = adminDao.confirmDao(or_confirm,or_idx);
		return nResult;
	}
	
	//상품현황뷰
	@Override
	public OrderListDto confirmView(String or_idx) {
		return adminDao.confirmViewDao(or_idx);
	}
	
	


}