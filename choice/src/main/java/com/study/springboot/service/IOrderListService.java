package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.OrderListDto;

public interface IOrderListService {
	
	
	public OrderListDto orderListList(String user_id);
	//itemBuy에서 orderlist로 form과get방식을 insert함.
	public int orderListWrite(Map<String, String> map);	
	
	//itemBuy에서 orderList로 form과 get방식을 insert
	public int orderList2(Map<String, String> map);	
	
	public List<OrderListDto> orderListView(String user_id);
}
