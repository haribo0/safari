package com.ja.safari.dto;

public class RentalReturnExtraCharge {
	
	private int number;
	private int return_id;
	private String reason;
	private int charge;
	
	public RentalReturnExtraCharge() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RentalReturnExtraCharge(int number, int return_id, String reason, int charge) {
		super();
		this.number = number;
		this.return_id = return_id;
		this.reason = reason;
		this.charge = charge;
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getReturn_id() {
		return return_id;
	}
	public void setReturn_id(int return_id) {
		this.return_id = return_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	
	
	

}
