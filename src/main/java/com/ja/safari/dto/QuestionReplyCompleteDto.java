package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestionReplyCompleteDto {

	private int id;
	private int question_reply_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public QuestionReplyCompleteDto() {
		super();
	}
	public QuestionReplyCompleteDto(int id, int question_reply_id, Date reg_date) {
		super();
		this.id = id;
		this.question_reply_id = question_reply_id;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuestion_reply_id() {
		return question_reply_id;
	}
	public void setQuestion_reply_id(int question_reply_id) {
		this.question_reply_id = question_reply_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}