package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.itemDto;

@Mapper
public interface IHomeDao {

	//index.jsp반찬 리스트
	public List<itemDto> itemListDao();
	
}
