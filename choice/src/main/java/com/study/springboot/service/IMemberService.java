package com.study.springboot.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MemberDto;

public interface IMemberService {
	

	//회원가입
	public int join(Map<String, String> map);
	//회원정보
	public MemberDto modifyForm(@Param("user_id") String user_id, @Param("user_pw")  String user_pw);
	//회원정보 수정
	public int modifyUpdate(Map<String, String> map);
	//로그인
	public MemberDto login(MemberDto mem);
	//회원탈퇴
	public int leave(@Param("user_id") String user_id, @Param("user_pw") String user_pw);
	//중복확인 
	public int count(@Param("user_id") String user_id);
	
	//아이디 찾기
	public MemberDto findId(String user_name, String user_email );
	
	//비번 찾기
	public MemberDto findPw(String user_id, String user_email );
}
