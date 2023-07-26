package com.ja.safari.dto;

public class UserAddressDto {
	
	private int id;
	private int user_id;
	private String addressee;
	private String address;
	private String address_name;
	private String phone;
	
	public UserAddressDto() {
		super();
	}

	public UserAddressDto(int id, int user_id, String addressee, String address, String address_name, String phone) {
		this.id = id;
		this.user_id = user_id;
		this.addressee = addressee;
		this.address = address;
		this.address_name = address_name;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


}
