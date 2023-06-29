package com.ja.safari.dto;

public class KaKaoPayApproveDto {
	
	private String cid;
	private String tid;
	private Integer partner_order_id;
	private Integer partner_user_id;
	private String pg_token;
	private String item_name;
	private Integer item_code;
	private Integer amount;
	private String payment_method_type;
	
	public KaKaoPayApproveDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public KaKaoPayApproveDto(String cid, String tid, Integer partner_order_id, Integer partner_user_id,
			String pg_token, String item_name, Integer item_code, Integer amount, String payment_method_type) {
		super();
		this.cid = cid;
		this.tid = tid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.pg_token = pg_token;
		this.item_name = item_name;
		this.item_code = item_code;
		this.amount = amount;
		this.payment_method_type = payment_method_type;
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

	public Integer getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(Integer partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public Integer getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(Integer partner_user_id) {
		this.partner_user_id = partner_user_id;
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



	public String getItem_name() {
		return item_name;
	}



	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public Integer getItem_code() {
		return item_code;
	}



	public void setItem_code(Integer item_code) {
		this.item_code = item_code;
	}


	public String getPayment_method_type() {
		return payment_method_type;
	}





	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}
	
	
	
	

}
