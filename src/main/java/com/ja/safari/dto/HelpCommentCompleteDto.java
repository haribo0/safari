package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HelpCommentCompleteDto {

	private int id;
	private int help_comment_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_date;
	public HelpCommentCompleteDto() {
		super();
	}
	public HelpCommentCompleteDto(int id, int help_comment_id, Date reg_date) {
		super();
		this.id = id;
		this.help_comment_id = help_comment_id;
		this.reg_date = reg_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHelp_comment_id() {
		return help_comment_id;
	}
	public void setHelp_comment_id(int help_comment_id) {
		this.help_comment_id = help_comment_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
