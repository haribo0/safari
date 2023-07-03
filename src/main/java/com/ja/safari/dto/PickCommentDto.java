package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PickCommentDto {
	
	private int id;
	private int user_id;
	private int pick_id;
	private String content;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	
	public PickCommentDto() {
		super();
	}

	public PickCommentDto(int id, int user_id, int pick_id, String content, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.pick_id = pick_id;
		this.content = content;
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

	public int getPick_id() {
		return pick_id;
	}

	public void setPick_id(int pick_id) {
		this.pick_id = pick_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
