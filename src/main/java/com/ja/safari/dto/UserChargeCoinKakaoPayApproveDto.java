package com.ja.safari.dto;

import java.util.Date;

public class UserChargeCoinKakaoPayApproveDto {

	private int partner_order_id; 
	private String cid;
	private String tid;
	private int partner_user_id;
	private String pg_token;
	private String item_name;
	private int amount;
	private String payment_method_type;
	private Date reg_date;
	
	public UserChargeCoinKakaoPayApproveDto() {
	}

	public UserChargeCoinKakaoPayApproveDto(int partner_order_id, String cid, String tid, int partner_user_id,
			String pg_token, String item_name, int amount, String payment_method_type, Date reg_date) {
		this.partner_order_id = partner_order_id;
		this.cid = cid;
		this.tid = tid;
		this.partner_user_id = partner_user_id;
		this.pg_token = pg_token;
		this.item_name = item_name;
		this.amount = amount;
		this.payment_method_type = payment_method_type;
		this.reg_date = reg_date;
	}

	public int getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public int getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(int partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPg_token() {
		return pg_token;
	}

	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
}
