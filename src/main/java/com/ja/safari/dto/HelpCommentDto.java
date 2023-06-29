package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HelpCommentDto {

	private int id;
	private int user_id;
	private int help_id;
	private String content;
	private String status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public HelpCommentDto() {
		super();
	}
	public HelpCommentDto(int id, int user_id, int help_id, String content, String status, Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.help_id = help_id;
		this.content = content;
		this.status = status;
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
	public int getHelp_id() {
		return help_id;
	}
	public void setHelp_id(int help_id) {
		this.help_id = help_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
