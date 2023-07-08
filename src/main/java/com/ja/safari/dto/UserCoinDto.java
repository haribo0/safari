package com.ja.safari.dto;

import java.util.Date;

public class UserCoinDto {
	private int id;
	private int user_id;
	private int coin_transaction;
	private String transaction_operand;
	private String transaction_detail;
	private Date reg_date;
	
	public UserCoinDto() {
		super();
	}

	public UserCoinDto(int id, int user_id, int coin_transaction, String transaction_operand, String transaction_detail,
			Date reg_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.coin_transaction = coin_transaction;
		this.transaction_operand = transaction_operand;
		this.transaction_detail = transaction_detail;
		this.reg_date = reg_date;
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

	public int getCoin_transaction() {
		return coin_transaction;
	}

	public void setCoin_transaction(int coin_transaction) {
		this.coin_transaction = coin_transaction;
	}

	public String getTransaction_operand() {
		return transaction_operand;
	}

	public void setTransaction_operand(String transaction_operand) {
		this.transaction_operand = transaction_operand;
	}

	public String getTransaction_detail() {
		return transaction_detail;
	}

	public void setTransaction_detail(String transaction_detail) {
		this.transaction_detail = transaction_detail;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
	
}
