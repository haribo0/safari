package com.ja.safari.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class ProductDto {
	private int id;
	private int user_id;
	private int product_sub_category;
	private int product_town_id;
	private String title;
	private int price;
	private String content;
	private String location;
	private int views;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reg_date;

	public ProductDto() {}

	public ProductDto(int id, int user_id, int product_sub_category, int product_town_id, String title, int price, String content, String location, int views, Date reg_date) {
	    this.id = id;
	    this.user_id = user_id;
	    this.product_sub_category = product_sub_category;
	    this.product_town_id = product_town_id;
	    this.title = title;
	    this.price = price;
	    this.content = content;
	    this.location = location;
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

	public int getProduct_sub_category() {
		return product_sub_category;
	}

	public void setProduct_sub_category(int product_sub_category) {
		this.product_sub_category = product_sub_category;
	}
	
	public int getProduct_town_id() {
		return product_town_id;
	}
	
	public void setProduct_town_id(int product_town_id) {
		this.product_town_id = product_town_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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
