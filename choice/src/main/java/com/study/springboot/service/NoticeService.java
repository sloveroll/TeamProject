package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.NoticeDto;

@Service
public class NoticeService implements INoticeService {
	
	@Autowired
	INoticeDao Noticedao;
	 
	@Override
	public List<NoticeDto> Noticelist(){
		return Noticedao.NoticelistDao();
	}
	
	
}
