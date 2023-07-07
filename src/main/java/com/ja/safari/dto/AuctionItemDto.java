package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AuctionItemDto {
	private int id;
	private int user_seller_id;
	private int auction_sub_category_id;
	private String title;
	private String description;
	private int start_price;
	private int max_price;
	private String auction_status;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date end_date;
	private Date reg_date;
	
	// 조인
	private int bid_price;
	private String auction_item_img_link;
	private String main_category_name;
	private String sub_category_name;
	
	
	public AuctionItemDto() {
	}

	public AuctionItemDto(int id, int user_seller_id, int auction_sub_category_id, String title, String description,
			int start_price, int max_price, String auction_status, Date start_date, Date end_date, Date reg_date) {
		this.id = id;
		this.user_seller_id = user_seller_id;
		this.auction_sub_category_id = auction_sub_category_id;
		this.title = title;
		this.description = description;
		this.start_price = start_price;
		this.max_price = max_price;
		this.auction_status = auction_status;
		this.start_date = start_date;
		this.end_date = end_date;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_seller_id() {
		return user_seller_id;
	}

	public void setUser_seller_id(int user_seller_id) {
		this.user_seller_id = user_seller_id;
	}

	public int getAuction_sub_category_id() {
		return auction_sub_category_id;
	}

	public void setAuction_sub_category_id(int auction_sub_category_id) {
		this.auction_sub_category_id = auction_sub_category_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStart_price() {
		return start_price;
	}

	public void setStart_price(int start_price) {
		this.start_price = start_price;
	}

	public int getMax_price() {
		return max_price;
	}

	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}

	public String getAuction_status() {
		return auction_status;
	}

	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}




	// 조인
	public int getBid_price() {
		return bid_price;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}

	public String getAuction_item_img_link() {
		return auction_item_img_link;
	}

	public void setAuction_item_img_link(String auction_item_img_link) {
		this.auction_item_img_link = auction_item_img_link;
	}

	public String getMain_category_name() {
		return main_category_name;
	}

	public void setMain_category_name(String main_category_name) {
		this.main_category_name = main_category_name;
	}

	public String getSub_category_name() {
		return sub_category_name;
	}

	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	
	
	
	
}
