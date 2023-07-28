package com.ja.safari.dto;

public class PromoReviewRentalInfoDto {
	private int id;
	private int rental_item_id;
	private String title;
	private String business_name;

	public PromoReviewRentalInfoDto() {
		super();
	}

	public PromoReviewRentalInfoDto(int id, int rental_item_id, String title, String business_name) {
		super();
		this.id = id;
		this.rental_item_id = rental_item_id;
		this.title = title;
		this.business_name = business_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRental_item_id() {
		return rental_item_id;
	}

	public void setRental_item_id(int rental_item_id) {
		this.rental_item_id = rental_item_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBusiness_name() {
		return business_name;
	}

	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}

}
