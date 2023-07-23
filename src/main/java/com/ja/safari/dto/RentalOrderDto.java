package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RentalOrderDto {
    private int id;
    private int user_id;
    private int item_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end_date;
    private String address;
    private int price;
    private int original_price;
    private int deposit;
    private String name;
    private Date reg_date;
    private String is_shipped;

    public RentalOrderDto() {
    }

	public RentalOrderDto(int id, int user_id, int item_id, Date start_date, Date end_date, String address, int price,
			int original_price, int deposit, String name, Date reg_date, String is_shipped) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.item_id = item_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.address = address;
		this.price = price;
		this.original_price = original_price;
		this.deposit = deposit;
		this.name = name;
		this.reg_date = reg_date;
		this.is_shipped = is_shipped;
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

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getOriginal_price() {
		return original_price;
	}

	public void setOriginal_price(int original_price) {
		this.original_price = original_price;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getIs_shipped() {
		return is_shipped;
	}

	public void setIs_shipped(String is_shipped) {
		this.is_shipped = is_shipped;
	}

    
    
}
