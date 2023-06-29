package com.ja.safari.dto;

public class RecruitLikeDto {
	
	private int id;
	private int user_id;
	private int recruit_id;
	private int reg_date;
	
	public RecruitLikeDto() {
		super();
	}

	public RecruitLikeDto(int id, int user_id, int recruit_id, int reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.recruit_id = recruit_id;
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

	public int getRecruit_id() {
		return recruit_id;
	}

	public void setRecruit_id(int recruit_id) {
		this.recruit_id = recruit_id;
	}

	public int getReg_date() {
		return reg_date;
	}

	public void setReg_date(int reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
