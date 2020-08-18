package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.itemDto;

public interface IHomeService {
	

	//반찬리스트를 불러옴
	public List<itemDto> itemList();
	
}

