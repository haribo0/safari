package com.ja.safari.dto;

public class ReviewCheckboxCategoryDto {
    private int id;
    private String content;

    public ReviewCheckboxCategoryDto() {}

    public ReviewCheckboxCategoryDto(int id, String content) {
        this.id = id;
        this.content = content;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

    
}
