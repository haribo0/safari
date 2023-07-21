package com.ja.safari.dto;

public class CsWeeklyEmpWorkCountDto {
	
	private String name;
	private int total_count;
	private int chat_count;
	private int qna_count;
	
	public CsWeeklyEmpWorkCountDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CsWeeklyEmpWorkCountDto(String name, int total_count, int chat_count, int qna_count) {
		super();
		this.name = name;
		this.total_count = total_count;
		this.chat_count = chat_count;
		this.qna_count = qna_count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getChat_count() {
		return chat_count;
	}

	public void setChat_count(int chat_count) {
		this.chat_count = chat_count;
	}

	public int getQna_count() {
		return qna_count;
	}

	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}
	
	

}
