package com.ja.safari.dto;

import java.util.Date;

public class AuctionItemOrderPaymentDto {

		private int id; // 낙찰 pk
		private int user_buyer_id; // 구매자 pk
		private int auction_item_id; // 경매 아이템
		private String main_category_name;
		private String sub_category_name;
		private String title;
		private String bid_price;
		private Date reg_date;
		private Date end_date;
		private String auction_item_img_link;
		private String email; // 판매자 id
		private String nickname; // 판매자 닉네임
		private String phone; // 판매자 전화번호
		private String payment_exists;
		public AuctionItemOrderPaymentDto() {
		}
		
		public AuctionItemOrderPaymentDto(int id, int user_buyer_id, int auction_item_id, String main_category_name,
				String sub_category_name, String title, String bid_price, Date reg_date, Date end_date,
				String auction_item_img_link, String email, String nickname, String phone, String payment_exists) {
			this.id = id;
			this.user_buyer_id = user_buyer_id;
			this.auction_item_id = auction_item_id;
			this.main_category_name = main_category_name;
			this.sub_category_name = sub_category_name;
			this.title = title;
			this.bid_price = bid_price;
			this.reg_date = reg_date;
			this.end_date = end_date;
			this.auction_item_img_link = auction_item_img_link;
			this.email = email;
			this.nickname = nickname;
			this.phone = phone;
			this.payment_exists = payment_exists;
		}

		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public int getUser_buyer_id() {
			return user_buyer_id;
		}

		public void setUser_buyer_id(int user_buyer_id) {
			this.user_buyer_id = user_buyer_id;
		}

		public int getAuction_item_id() {
			return auction_item_id;
		}
		public void setAuction_item_id(int auction_item_id) {
			this.auction_item_id = auction_item_id;
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
		public String getBid_price() {
			return bid_price;
		}
		public void setBid_price(String bid_price) {
			this.bid_price = bid_price;
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
		public String getAuction_item_img_link() {
			return auction_item_img_link;
		}
		public void setAuction_item_img_link(String auction_item_img_link) {
			this.auction_item_img_link = auction_item_img_link;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getPayment_exists() {
			return payment_exists;
		}
		public void setPayment_exists(String payment_exists) {
			this.payment_exists = payment_exists;
		}

}
