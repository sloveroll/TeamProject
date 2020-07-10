package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

//MyBatis와 연동 
@Mapper
public interface ITransaction2Dao {
	
  public void pay(String consumerId , int amount);
  
  
  
}
