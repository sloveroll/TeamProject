package com.study.springboot.bean;

public class Member {

	private String name;
	private String nickname;
	private Printer printer;
	
	public void print() {
		printer.frint("Helo " + name + " : " + nickname );
	}
	
	public Member(String name, String nickname, Printer printer) {
		super();
		this.name = name;
		this.nickname = nickname;
		this.printer = printer;
	}
	public Member() {
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Printer getPrinter() {
		return printer;
	}

	public void setPrinter(Printer printer) {
		this.printer = printer;
	}

	
}
