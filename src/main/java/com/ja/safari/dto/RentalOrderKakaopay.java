package com.ja.safari.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true) // 서버에서 json parse할때 키와 값을 dto로 생성시 무시되는 값 있을때 오류 무시
public class RentalOrderKakaopay {
	
	private Integer id;
	private Integer partner_user_id;
	private String cid;
	private String tid;
	private Integer amount;
	private String pg_token;
	private String payment_method_type;
	private Integer partner_order_id;
	private String item_name;
	private String next_redirect_pc_url;
	private Date reg_date;
	
	public RentalOrderKakaopay() {
		super();
	}

	public RentalOrderKakaopay(Integer id, Integer partner_user_id, String cid, String tid, Integer amount,
			String pg_token, String payment_method_type, Integer partner_order_id, String item_name,
			String next_redirect_pc_url, Date reg_date) {
		super();
		this.id = id;
		this.partner_user_id = partner_user_id;
		this.cid = cid;
		this.tid = tid;
		this.amount = amount;
		this.pg_token = pg_token;
		this.payment_method_type = payment_method_type;
		this.partner_order_id = partner_order_id;
		this.item_name = item_name;
		this.next_redirect_pc_url = next_redirect_pc_url;
		this.reg_date = reg_date;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(Integer partner_user_id) {
		this.partner_user_id = partner_user_id;
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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPg_token() {
		return pg_token;
	}

	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public Integer getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(Integer partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	

}
