package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PickOptionVoteDto {

	private int id;
	private int user_id;
	private int pick_option_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg_Date;
	
	public PickOptionVoteDto() {
		super();
	}

	public PickOptionVoteDto(int id, int user_id, int pick_option_id, Date reg_Date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.pick_option_id = pick_option_id;
		this.reg_Date = reg_Date;
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

	public int getPick_option_id() {
		return pick_option_id;
	}

	public void setPick_option_id(int pick_option_id) {
		this.pick_option_id = pick_option_id;
	}

	public Date getReg_Date() {
		return reg_Date;
	}

	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	}
 
	
}
