package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IHomeDao;
import com.study.springboot.dto.itemDto;

@Service
public class HomeService implements IHomeService {
	
	@Autowired
	IHomeDao homedao;
	
	
	 
	//인덱스 반찬 메뉴
	@Override
	public List<itemDto> itemList(){
		return homedao.itemListDao(); 
	}
	
	
	
	}
