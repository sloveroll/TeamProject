package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	IMemberDao dao;
	
	@Override
	public List<MemberDto> list(){
		return dao.listDao();
	}
}
