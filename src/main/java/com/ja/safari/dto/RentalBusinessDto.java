package com.ja.safari.dto;

import java.util.Date;

public class RentalBusinessDto {

    private int id;
    private String business_userid;
    private String pw;
    private int reg_num;
    private String reg_img_link;
    private String business_owner;
    private String business_name;
    private String business_address;
    private String phone;
    private Date reg_date;
    private String permission;

    public RentalBusinessDto() {
    }

    public RentalBusinessDto(int id, String business_userid, String pw, int reg_num, String reg_img_link, String business_owner, String business_name, String business_address, String phone, Date reg_date, String permission) {
        this.id = id;
        this.business_userid = business_userid;
        this.pw = pw;
        this.reg_num = reg_num;
        this.reg_img_link = reg_img_link;
        this.business_owner = business_owner;
        this.business_name = business_name;
        this.business_address = business_address;
        this.phone = phone;
        this.reg_date = reg_date;
        this.permission = permission;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBusiness_userid() {
        return business_userid;
    }

    public void setBusiness_userid(String business_userid) {
        this.business_userid = business_userid;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public int getReg_num() {
        return reg_num;
    }

    public void setReg_num(int reg_num) {
        this.reg_num = reg_num;
    }

    public String getReg_img_link() {
        return reg_img_link;
    }

    public void setReg_img_link(String reg_img_link) {
        this.reg_img_link = reg_img_link;
    }

    public String getBusiness_owner() {
        return business_owner;
    }

    public void setBusiness_owner(String business_owner) {
        this.business_owner = business_owner;
    }

    public String getBusiness_name() {
        return business_name;
    }

    public void setBusiness_name(String business_name) {
        this.business_name = business_name;
    }

    public String getBusiness_address() {
        return business_address;
    }

    public void setBusiness_address(String business_address) {
        this.business_address = business_address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

}
