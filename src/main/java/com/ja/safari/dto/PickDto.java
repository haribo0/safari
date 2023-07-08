package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PickDto {
	
	private int id;
	private int user_id;
	private String content;
	private int views;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	
	public PickDto() {
		super();
	}

	public PickDto(int id, int user_id, String content, int views, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.content = content;
		this.views = views;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	
	
}
