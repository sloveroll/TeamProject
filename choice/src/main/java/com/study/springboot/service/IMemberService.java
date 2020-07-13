package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.MemberDto;

public interface IMemberService {
	
	public List<MemberDto> list();
}
