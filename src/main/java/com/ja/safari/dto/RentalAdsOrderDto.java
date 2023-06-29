package com.ja.safari.dto;

import java.util.Date;

public class RentalAdsOrderDto {
	
	private int id;
	private int item_id;
	private int price;
	private String period;
	private Date reg_date;
	private Date end_date;
	
	public RentalAdsOrderDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentalAdsOrderDto(int id, int item_id, int price, String period, Date reg_date, Date end_date) {
		super();
		this.id = id;
		this.item_id = item_id;
		this.price = price;
		this.period = period;
		this.reg_date = reg_date;
		this.end_date = end_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
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
