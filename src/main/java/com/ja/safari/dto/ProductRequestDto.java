package com.ja.safari.dto;

import java.sql.Date;

public class ProductRequestDto {
	private int id;
	private int product_id;
	private int user_id;
	private String status;
	private Date reg_date;

	public ProductRequestDto() {}

	public ProductRequestDto(int id, int product_id, int user_id, String status, Date reg_date) {
	this.id = id;
	this.product_id = product_id;
	this.user_id = user_id;
	this.status = status;
	this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

