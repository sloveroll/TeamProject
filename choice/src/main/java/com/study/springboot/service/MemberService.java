package com.study.springboot.service;



import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	IMemberDao dao;
	 
	//회원가입
	@Override
	public int join(Map<String, String> map) {
	int nResult = dao.joinDao(map); 
	return nResult;  
	}
	
	//회원정보
	   @Override
	public MemberDto modifyForm(String user_id, String user_pw) {
	      
	      return  dao.modifyFormDao(user_id, user_pw);
	   }
	   
	//회원정보 수정
	   @Override
		public int modifyUpdate(Map<String, String> map) {
			int nResult = dao.modifyUpdateDao(map);
			return nResult;
		}
	   
	 
	//로그인
	@Override
	   public MemberDto login(MemberDto mem) {
		
	      MemberDto member = dao.loginDao(mem);
	   
	      
	      return member;
	   }
	
	//회원탈퇴
	@Override
	public int leave(@Param("user_id") String user_id, 
					 @Param("user_pw") String user_pw) {
		int nResult = dao.leaveDao(user_id, user_pw);
		return nResult;
	}
	
	//id중복확인
	@Override
	public int count(@Param("user_id") String user_id) {
	      int nResult = dao.countDao(user_id);
	      return nResult;
	}	
	//아이디 찾기
	@Override
	public MemberDto findId(String user_name, String user_email ) {
		return dao.findIdDao(user_name, user_email);
	}
	
	//비번 찾기
	@Override
	public MemberDto findPw(String user_id, String user_email ) {
		return dao.findPwDao(user_id, user_email);
	}

}
