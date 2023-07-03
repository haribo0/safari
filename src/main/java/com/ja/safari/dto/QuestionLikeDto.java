package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestionLikeDto {

	private int id;
	private int user_id;
	private int question_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public QuestionLikeDto() {
		super();
	}
	public QuestionLikeDto(int id, int user_id, int question_id, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.question_id = question_id;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
