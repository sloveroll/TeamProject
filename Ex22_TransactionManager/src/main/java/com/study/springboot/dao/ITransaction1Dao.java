package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

//MyBatis와 연동

@Mapper
public interface ITransaction1Dao {
	public void pay(String consumerId, int amount);
}
