package com.ja.safari.dto;

import java.util.Date;

public class CsLiveChatDto {
	
	private int id;
	private int user_id;
	private int category_id;
	private int emp_id;
	private Date reg_date;
	private Date end_date;
	
	public CsLiveChatDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsLiveChatDto(int id, int user_id, int category_id, int emp_id, Date reg_date, Date end_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.category_id = category_id;
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
