package com.ja.safari.dto;

import java.util.Date;

public class AuctionPurchaseConfirmedDto {
	
	private int partner_order_id;
	private int auction_delivery_after_payment_id;
	private Date reg_date;
	
	public AuctionPurchaseConfirmedDto() {
	
	}

	public AuctionPurchaseConfirmedDto(int partner_order_id, int auction_delivery_after_payment_id, Date reg_date) {
		this.partner_order_id = partner_order_id;
		this.auction_delivery_after_payment_id = auction_delivery_after_payment_id;
		this.reg_date = reg_date;
	}

	public int getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public int getAuction_delivery_after_payment_id() {
		return auction_delivery_after_payment_id;
	}

	public void setAuction_delivery_after_payment_id(int auction_delivery_after_payment_id) {
		this.auction_delivery_after_payment_id = auction_delivery_after_payment_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
