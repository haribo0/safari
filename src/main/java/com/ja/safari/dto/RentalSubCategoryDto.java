package com.ja.safari.dto;

public class RentalSubCategoryDto {
    private int id;
    private int main_category_id;
    private String sub_category_name;

    public RentalSubCategoryDto() {
    }

    public RentalSubCategoryDto(int id, int mainCategoryId, String subCategoryName) {
        this.id = id;
        this.main_category_id = mainCategoryId;
        this.sub_category_name = subCategoryName;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMain_category_id() {
        return main_category_id;
    }

    public void setMain_category_id(int mainCategoryId) {
        this.main_category_id = mainCategoryId;
    }

    public String getSub_category_name() {
        return sub_category_name;
    }

    public void setSub_category_name(String subCategoryName) {
        this.sub_category_name = subCategoryName;
    }
}
