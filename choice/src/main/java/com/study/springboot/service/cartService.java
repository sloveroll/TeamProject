package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dto.cartDto;

@Service
public class cartService implements ICartService {
	
	@Autowired
	ICartDao icartdao;
	
	//장바구니 리스트
		@Override
			public List<cartDto> cartList(String user_id){
			return icartdao.cartListDao(user_id);
			}
		//업뎃
		@Override
		public int cartUpdate(Map<String, String> map) {
			int nResult = icartdao.cartUpdateDao(map);
			return nResult;
		}
		//추가
		@Override
		public int cartInsert(Map<String, String> map) {
			int nReuslt = icartdao.cartInsertDao(map);
			return nReuslt;
		}

		
		//삭제 
		@Override public int cartDelete(String user_id, int cart_idx) { 
			int nResult = icartdao.cartDeleteDao(user_id, cart_idx); return nResult; 
			}
		 //유저카트 비우기
		@Override public int cartDelete2(String user_id) {
			int result = icartdao.cartDeleteDao2(user_id);
			return result;
		}
		//구매시삭제, 장바구니 선택삭제
		@Override
		public int cartBuyDelete(Map<String, String> cartBuyDelete) {
			int nResult = icartdao.cartBuyDeleteDao(cartBuyDelete);
			return nResult;
		}
		//갯수
		@Override
		public int cartCount(String user_id, String cr_item_idx) {
			int nResult = icartdao.cartCountDao(user_id, cr_item_idx);
			return nResult;
		}
		//갯수
		@Override
		public int cartIdxCount(String user_id) {
			int nResult = icartdao.cartIdxCountDao(user_id);
			return nResult;
		}
		@Override
		public List<cartDto> cartBuy(Map<String, String> map) {
			return icartdao.cartBuyDao(map);
		}

	}
