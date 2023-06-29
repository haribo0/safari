package com.ja.safari.dto;

import java.util.Date;

public class RentalItemLikeDto {
    private int id;
    private int user_id;
    private int item_id;
    private Date reg_date;

    public RentalItemLikeDto() {
    }

    public RentalItemLikeDto(int id, int user_id, int item_id, Date reg_date) {
        this.id = id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.reg_date = reg_date;
    }

    // Getters and Setters

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

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}
