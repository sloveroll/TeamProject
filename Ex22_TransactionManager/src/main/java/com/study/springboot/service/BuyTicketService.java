package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.study.springboot.dao.ITransaction1Dao;
import com.study.springboot.dao.ITransaction2Dao;

@Service
public class BuyTicketService implements IBuyTicketService {

	@Autowired
	ITransaction1Dao transaction1;
	@Autowired
	ITransaction2Dao transaction2;
	
	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
	@Override
	public int buy(String consumerId, int amount, String error) {
		
		//1.트랜잭션 관리 시작!
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try {
			//테이블A에 처리
			transaction1.pay(consumerId, amount);
			
			//중간에 Exception이 발생하면,
			//테이블A에만 DB수정이 되고,
			//테이블B에는 DB수정이 안일어나는 상황임.
			if( error.equals("1")) {
				int n = 10 / 0; //에러 고의발생!
			}
			
			//테이블B에 처리를 한번에.
			transaction2.pay(consumerId, amount);
			
			//2.문제가 없으면 커밋!
			transactionManager.commit(status);
			
			return 1;
		} catch(Exception e) {
			System.out.println("롤백 됨");
			//3.오류발생시 롤백됨. 롤백: DB를 예전상태로 돌려놓는다.
			transactionManager.rollback(status);
			
			return 0;
		}
		
	}

}
