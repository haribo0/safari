package com.ja.safari.dto;

import java.util.Date;

public class AuctionDeliveryTrackingDto {

	private int id; // 입찰 pk
	private int auction_item_id;
	private String title;
	private int user_buyer_id;
	private int user_seller_id;
	private String nickname; // 판매자 닉네임
	private String payment_exists;
	private String delivery_exists;
	private Date payment_reg_date;
	private Date delivery_reg_date;
	private String purchase_confirmed;
	private String auction_item_img_link;
	private String delivery_status;
	private int amount;
	
	public AuctionDeliveryTrackingDto() {
	}

	public AuctionDeliveryTrackingDto(int id, int auction_item_id, String title, int user_buyer_id, int user_seller_id,
			String nickname, String payment_exists, String delivery_exists, Date payment_reg_date,
			Date delivery_reg_date, String purchase_confirmed, String auction_item_img_link) {
		this.id = id;
		this.auction_item_id = auction_item_id;
		this.title = title;
		this.user_buyer_id = user_buyer_id;
		this.user_seller_id = user_seller_id;
		this.nickname = nickname;
		this.payment_exists = payment_exists;
		this.delivery_exists = delivery_exists;
		this.payment_reg_date = payment_reg_date;
		this.delivery_reg_date = delivery_reg_date;
		this.purchase_confirmed = purchase_confirmed;
		this.auction_item_img_link = auction_item_img_link;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUser_buyer_id() {
		return user_buyer_id;
	}

	public void setUser_buyer_id(int user_buyer_id) {
		this.user_buyer_id = user_buyer_id;
	}

	public int getUser_seller_id() {
		return user_seller_id;
	}

	public void setUser_seller_id(int user_seller_id) {
		this.user_seller_id = user_seller_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPayment_exists() {
		return payment_exists;
	}

	public void setPayment_exists(String payment_exists) {
		this.payment_exists = payment_exists;
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

	public String getAuction_item_img_link() {
		return auction_item_img_link;
	}

	public void setAuction_item_img_link(String auction_item_img_link) {
		this.auction_item_img_link = auction_item_img_link;
	}

	public String getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
