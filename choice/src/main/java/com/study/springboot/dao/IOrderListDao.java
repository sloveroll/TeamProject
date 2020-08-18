package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {

	
		/* public List<OrderListDto> orderListListDao(String user_id); */
		public OrderListDto orderListListDao(String user_id);


		//itemBuy에서 orderlist로 form과get방식을 insert함.
		public int orderListWriteDao(Map<String, String> map);
		//itemBuy에서 orderlist로 form과get방식을 insert함.
		public int orderList2Dao(Map<String, String> map);
		
		public List<OrderListDto> orderListViewDao(String user_id);
	
}
