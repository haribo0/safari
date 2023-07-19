package com.ja.safari.dto;

public class AuctionItemOrderAddressDto {

	private int id; // 낙찰 pk
	private String address;
	private String phone;
	private String delivery_message;
	public AuctionItemOrderAddressDto() {
	}
	public AuctionItemOrderAddressDto(int id, String address, String phone, String delivery_message) {
		this.id = id;
		this.address = address;
		this.phone = phone;
		this.delivery_message = delivery_message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDelivery_message() {
		return delivery_message;
	}
	public void setDelivery_message(String delivery_message) {
		this.delivery_message = delivery_message;
	}

}
