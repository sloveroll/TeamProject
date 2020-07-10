package com.study.springboot.bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {
//빈등록
	@Bean
	public Member member1() {
		Member member1 = new Member();
		member1.setName("홍길동");
		member1.setNickname("의적");
		member1.setPrinter(new PrinterA()); // DI : 의존주입
		
		return member1;
	}
	
	@Bean(name="Bean1")
	public Member member2() {
		
		return new Member("뵨사또", "공뭔", new PrinterA());
		
	}
}
