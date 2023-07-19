package com.ja.safari.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AuctionBidDto {
	
	private int id;
	private int auction_item_id;
	private int user_buyer_id;
	private int bid_price;
	private Date reg_date;
	
	
	// 조인
	private int user_seller_id;
	private String main_category_name;
	private String sub_category_name;
	private String title;
	private String nickname;
	private String email;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date start_date;
	private Date end_date;
	private String auction_item_img_link;
	private String payment_exists;
	private String auction_status;
	private String delivery_exists;
	
	private Date payment_reg_date;
	private Date delivery_reg_date;
	
	private String purchase_confirmed;
	private String purchase_confirmed_exists;
	private String delivery_status;
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getAuction_item_img_link() {
		return auction_item_img_link;
	}
	public void setAuction_item_img_link(String auction_item_img_link) {
		this.auction_item_img_link = auction_item_img_link;
	}
	public String getPayment_exists() {
		return payment_exists;
	}
	public void setPayment_exists(String payment_exists) {
		this.payment_exists = payment_exists;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAuction_status() {
		return auction_status;
	}
	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}
	public int getUser_seller_id() {
		return user_seller_id;
	}
	public void setUser_seller_id(int user_seller_id) {
		this.user_seller_id = user_seller_id;
	}
	public String getDelivery_exists() {
		return delivery_exists;
	}
	public void setDelivery_exists(String delivery_exists) {
		this.delivery_exists = delivery_exists;
	}
	public Date getPayment_reg_date() {
		return payment_reg_date;
	}
	public void setPayment_reg_date(Date payment_reg_date) {
		this.payment_reg_date = payment_reg_date;
	}
	public Date getDelivery_reg_date() {
		return delivery_reg_date;
	}
	public void setDelivery_reg_date(Date delivery_reg_date) {
		this.delivery_reg_date = delivery_reg_date;
	}
	public String getPurchase_confirmed() {
		return purchase_confirmed;
	}
	public void setPurchase_confirmed(String purchase_confirmed) {
		this.purchase_confirmed = purchase_confirmed;
	}
	public String getPurchase_confirmed_exists() {
		return purchase_confirmed_exists;
	}
	public void setPurchase_confirmed_exists(String purchase_confirmed_exists) {
		this.purchase_confirmed_exists = purchase_confirmed_exists;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	


}
