package com.ja.safari.dto;

public class RentalPeriodDiscDto {
    private int id;
    private int item_id;
    private int discounted_price;
    private int rental_period;
    
	public RentalPeriodDiscDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentalPeriodDiscDto(int id, int item_id, int discounted_price, int rental_period) {
		super();
		this.id = id;
		this.item_id = item_id;
		this.discounted_price = discounted_price;
		this.rental_period = rental_period;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	
	public int getDiscounted_price() {
		return discounted_price;
	}
	public void setDiscounted_price(int discounted_price) {
		this.discounted_price = discounted_price;
	}
	public int getRental_period() {
		return rental_period;
	}
	public void setRental_period(int rental_period) {
		this.rental_period = rental_period;
	}
    
    
    
    
}
