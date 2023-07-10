package com.ja.safari.dto;

import java.util.Date;

public class CsChatListDto {
	
	private int id;
	private int user_id;
	private String user_nickname;
	private String category;
	private int emp_id;
	private Date reg_date;
	private Date end_date;
	
	public CsChatListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CsChatListDto(int id, int user_id, String user_nickname, String category, int emp_id, Date reg_date,
			Date end_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.category = category;
		this.emp_id = emp_id;
		this.reg_date = reg_date;
		this.end_date = end_date;
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
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	

}
