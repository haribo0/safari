package com.ja.safari.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true) // 서버에서 json parse할때 키와 값을 dto로 생성시 무시되는 값 있을때 오류 무시
public class RentalReturnKakaopayAmount {
	
	private int id;
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;
	private int green_deposit;
	
	public RentalReturnKakaopayAmount() {
		super();
	}
	

	public RentalReturnKakaopayAmount(int id, int total, int tax_free, int vat, int point, int discount,
			int green_deposit) {
		super();
		this.id = id;
		this.total = total;
		this.tax_free = tax_free;
		this.vat = vat;
		this.point = point;
		this.discount = discount;
		this.green_deposit = green_deposit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTax_free() {
		return tax_free;
	}

	public void setTax_free(int tax_free) {
		this.tax_free = tax_free;
	}

	public int getVat() {
		return vat;
	}

	public void setVat(int vat) {
		this.vat = vat;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getGreen_deposit() {
		return green_deposit;
	}

	public void setGreen_deposit(int green_deposit) {
		this.green_deposit = green_deposit;
	}


	@Override
	public String toString() {
		return "RentalOrderKakaopayAmount [id=" + id + ", total=" + total + ", tax_free=" + tax_free + ", vat=" + vat
				+ ", point=" + point + ", discount=" + discount + ", green_deposit=" + green_deposit + "]";
	}
	
	
	
	
}
