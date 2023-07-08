package com.ja.safari.dto;

import java.util.Date;

public class RentalItemReturnDto {
    private int id;
    private int rental_order_id;
    private String is_item_returned;
    private int discount_revoation;
    private String is_completed;
    private Date reg_date;

    public RentalItemReturnDto() {
    	
    }
   
    public RentalItemReturnDto(int id, int rental_order_id, String is_item_returned, int discount_revoation,
			String is_completed, Date reg_date) {
		super();
		this.id = id;
		this.rental_order_id = rental_order_id;
		this.is_item_returned = is_item_returned;
		this.discount_revoation = discount_revoation;
		this.is_completed = is_completed;
		this.reg_date = reg_date;
	}


	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRental_order_id() {
        return rental_order_id;
    }

    public void setRental_order_id(int rental_order_id) {
        this.rental_order_id = rental_order_id;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getIs_item_returned() {
        return is_item_returned;
    }

    public void setIs_item_returned(String is_item_returned) {
        this.is_item_returned = is_item_returned;
    }

	public int getDiscount_revoation() {
		return discount_revoation;
	}

	public void setDiscount_revoation(int discount_revoation) {
		this.discount_revoation = discount_revoation;
	}

	public String getIs_completed() {
		return is_completed;
	}

	public void setIs_completed(String is_completed) {
		this.is_completed = is_completed;
	}
    
}
