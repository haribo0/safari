package com.ja.safari.dto;

import java.util.Date;

public class AuctionPurchaseConfirmedDto {
	
	private int partner_order_id;
	private int delivery_payment_id;
	private Date reg_date;
	
	public AuctionPurchaseConfirmedDto() {
	
	}

	public int getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public int getDelivery_payment_id() {
		return delivery_payment_id;
	}

	public void setDelivery_payment_id(int delivery_payment_id) {
		this.delivery_payment_id = delivery_payment_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



}
