package com.ja.safari.dto;

public class RentalKakaoPaymentDto {

	private int id;
	private int partner_order_id;
	private int partner_user_id;
	private String cid;
	private String tid;
	private int amount;
	private String pg_token;
	private String payment_method_type;
	
	public RentalKakaoPaymentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RentalKakaoPaymentDto(int id, int partner_order_id, int partner_user_id, String cid, String tid, int amount,
			String pg_token, String payment_method_type) {
		super();
		this.id = id;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.cid = cid;
		this.tid = tid;
		this.amount = amount;
		this.pg_token = pg_token;
		this.payment_method_type = payment_method_type;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public int getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(int partner_user_id) {
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
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
	
	
	

	
}
