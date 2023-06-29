package com.ja.safari.dto;

import java.util.Date;

public class RentalItemDto {
    private int id;
    private int business_id;
    private int sub_category_id;
    private String title;
    private String item_description;
    private String main_img_link;
    private int deposit;
    private int price;
    private int quantity;
    private Date reg_date;
    private Date shipped_date;

    public RentalItemDto() {
    }

    

    public RentalItemDto(int id, int business_id, int sub_category_id, String title, String item_description,
			String main_img_link, int deposit, int price, int quantity, Date reg_date, Date shipped_date) {
		super();
		this.id = id;
		this.business_id = business_id;
		this.sub_category_id = sub_category_id;
		this.title = title;
		this.item_description = item_description;
		this.main_img_link = main_img_link;
		this.deposit = deposit;
		this.price = price;
		this.quantity = quantity;
		this.reg_date = reg_date;
		this.shipped_date = shipped_date;
	}



	// Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBusiness_id() {
        return business_id;
    }

    public void setBusiness_id(int business_id) {
        this.business_id = business_id;
    }

    public int getSub_category_id() {
        return sub_category_id;
    }

    public void setSub_category_id(int sub_category_id) {
        this.sub_category_id = sub_category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    

    public String getItem_description() {
		return item_description;
	}

	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}

	public String getMain_img_link() {
        return main_img_link;
    }

    public void setMain_img_link(String main_img_link) {
        this.main_img_link = main_img_link;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
    
	public Date getShipped_date() {
		return shipped_date;
	}
	
	public void setShipped_date(Date shipped_date) {
		this.shipped_date = shipped_date;
	}
    
    
}
