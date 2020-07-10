package com.study.springboot.bean;

public class PrinterA implements Printer {
// Printer꺼
	@Override
	public void frint(String messa) {
		System.out.println("printerA - " + messa);
	}
}
