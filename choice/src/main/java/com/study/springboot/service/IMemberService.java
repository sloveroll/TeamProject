package com.study.springboot.service;

import java.util.List;
import java.util.Map;

import com.study.springboot.dto.MemberDto;

public interface IMemberService {
	

	public int join(Map<String, String> map);
}
