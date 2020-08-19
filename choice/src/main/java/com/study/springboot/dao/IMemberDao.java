package com.study.springboot.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MemberDto;

@Mapper
public interface IMemberDao {
	//회원가입
	public int joinDao(Map<String, String> map);
	//id중복확인 //int는 , 해당 아이디명의 값갯수 카운트 
	public int countDao(@Param("user_id") String user_id);
	//회원정보
	public MemberDto modifyFormDao(@Param("user_id") String user_id, @Param("user_pw")  String user_pw);
	//회원정보 수정
	public int modifyUpdateDao(Map<String, String> map);
	//로그인
	public MemberDto loginDao(MemberDto mem);
	//회원탈퇴
	public int leaveDao(@Param("user_id") String user_id, @Param("user_pw") String user_pw);
	
	//아이디 찾기
	public MemberDto findIdDao(@Param("user_name")String user_name, @Param("user_email")String user_email);

	//비번 찾기
	public MemberDto findPwDao(@Param("user_id")String user_id,@Param("user_email") String user_email );	

}
