package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	IMemberDao dao;
	 
	
	@Override
	public int join(Map<String, String> map) {
	int nResult = dao.joinDao(map); 
	return nResult;  
	}
}
