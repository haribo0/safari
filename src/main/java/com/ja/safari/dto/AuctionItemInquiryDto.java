package com.ja.safari.dto;

import java.util.Date;

public class AuctionItemInquiryDto {

	private int id;
	private int auction_item_id;
	private int user_buyer_id;
	private String content;
	private Date reg_date;
	
	public AuctionItemInquiryDto() {
	}

	public AuctionItemInquiryDto(int id, int auction_item_id, int user_buyer_id, String content, Date reg_date) {
		this.id = id;
		this.auction_item_id = auction_item_id;
		this.user_buyer_id = user_buyer_id;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAuction_item_id() {
		return auction_item_id;
	}

	public void setAuction_item_id(int auction_item_id) {
		this.auction_item_id = auction_item_id;
	}

	public int getUser_buyer_id() {
		return user_buyer_id;
	}

	public void setUser_buyer_id(int user_buyer_id) {
		this.user_buyer_id = user_buyer_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	

}
