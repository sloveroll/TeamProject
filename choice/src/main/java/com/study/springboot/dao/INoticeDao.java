package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;
@Mapper
public interface INoticeDao {
	//게시물 목록 가져오기
	
	public List<NoticeDto> NoticelistDao();
}
