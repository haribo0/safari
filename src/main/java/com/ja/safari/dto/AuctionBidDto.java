package com.ja.safari.dto;

import java.util.Date;

public class AuctionBidDto {
	
	private int id;
	private int auction_item_id;
	private int user_buyer_id;
	private int bid_price;
	private Date reg_date;
	public AuctionBidDto() {
	}
	public AuctionBidDto(int id, int auction_item_id, int user_buyer_id, int bid_price, Date reg_date) {
		this.id = id;
		this.auction_item_id = auction_item_id;
		this.user_buyer_id = user_buyer_id;
		this.bid_price = bid_price;
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
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
