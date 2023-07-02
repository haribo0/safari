package com.ja.safari.dto;

import java.util.Date;

public class CsQnaDto {
	
	private int id;
	private int user_id;
	private int category_id;
	private int emp_id;
	private String qna_title;
	private String qna_content;
	private Date reg_date;
	private String qna_reply;
	private Date reply_date;
	
	public CsQnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsQnaDto(int id, int user_id, int category_id, int emp_id, String qna_title, String qna_content,
			Date reg_date, String qna_reply, Date reply_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.emp_id = emp_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.reg_date = reg_date;
		this.qna_reply = qna_reply;
		this.reply_date = reply_date;
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
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	

}
