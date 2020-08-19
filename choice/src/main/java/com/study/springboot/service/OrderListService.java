package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IOrderListDao;
import com.study.springboot.dto.OrderListDto;

//@Service, Controller, @Repository가 동일한 기능을 한다. 저장소
//해당 클래스의 객체들을 빈으로 등록하고 만들 때 사용
@Service
public class OrderListService implements IOrderListService {

	@Autowired
	IOrderListDao orderListdao;

	@Override
	public OrderListDto orderListList(String user_id) {
		orderListdao.orderListListDao(user_id);
		return orderListdao.orderListListDao(user_id);
	}

	// itemBuy에서 orderlist로 form과get방식을 insert함.
	@Override
	public int orderListWrite(Map<String, String> map) {
		int nResult = orderListdao.orderListWriteDao(map);
		return nResult;
	}

	@Override
	// itemBuy에서 orderlist로 form과get방식을 insert함.
	public int orderList2(Map<String, String> map) {
		int nResult = orderListdao.orderList2Dao(map);
		return nResult;
	}

	@Override
	public List<OrderListDto> orderListView(String user_id) {

		return orderListdao.orderListViewDao(user_id);
	}

}