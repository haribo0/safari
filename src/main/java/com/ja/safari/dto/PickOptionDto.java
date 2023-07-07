package com.ja.safari.dto;

public class PickOptionDto {
	
	private int id;
	private int pick_id;
	private int product_id;
	
	public PickOptionDto() {
		super();
	}

	public PickOptionDto(int id, int pick_id, int product_id) {
		super();
		this.id = id;
		this.pick_id = pick_id;
		this.product_id = product_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPick_id() {
		return pick_id;
	}

	public void setPick_id(int pick_id) {
		this.pick_id = pick_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	
	
}
