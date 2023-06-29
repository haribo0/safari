package com.ja.safari.dto;

public class RentalItemImgDto {
    private int id;
    private int item_id;
    private String img_link;

    public RentalItemImgDto() {
    }


    public RentalItemImgDto(int id, int item_id, String img_link) {
		super();
		this.id = id;
		this.item_id = item_id;
		this.img_link = img_link;
	}


	// Getters and Setters

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

    public String getImg_link() {
        return img_link;
    }

    public void setImg_link(String img_link) {
        this.img_link = img_link;
    }
}
