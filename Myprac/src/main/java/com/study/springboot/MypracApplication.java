package com.study.springboot;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.study.springboot.bean.Config;
import com.study.springboot.bean.Member;
import com.study.springboot.bean.Printer;



public class MypracApplication {

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
		
		Member member1 = (Member) context.getBean("member1");
		member1.print();
		
		//3. Member Bean 가져오기 ( 빈 이름 등록 )
		
						 //형변환
		Member member2 = (Member) context.getBean("Bean1");
		member2.print();
		
		Printer printer = context.getBean("PrinterA", Printer.class);
		//Bean 주입
		member1.setPrinter(printer);
		member1.print();
	}

}
