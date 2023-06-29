package com.ja.safari.dto;

import java.util.Date;

public class RentalItemReturnDto {
    private int id;
    private int rental_order_id;
    private Date reg_date;
    private String is_item_returned;

    public RentalItemReturnDto() {
    }

    public RentalItemReturnDto(int id, int rental_order_id, Date reg_date, String is_item_returned) {
        this.id = id;
        this.rental_order_id = rental_order_id;
        this.reg_date = reg_date;
        this.is_item_returned = is_item_returned;
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
}
