package com.ja.safari.dto;

import java.util.Date;

public class AuctionDeliveryDto {

	private int id;
	private int partner_order_id;
	private String delivery_status;
	private Date reg_date;
	public AuctionDeliveryDto() {
	}
	public AuctionDeliveryDto(int id, int partner_order_id, String delivery_status, Date reg_date) {
		this.id = id;
		this.partner_order_id = partner_order_id;
		this.delivery_status = delivery_status;
		this.reg_date = reg_date;
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
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
