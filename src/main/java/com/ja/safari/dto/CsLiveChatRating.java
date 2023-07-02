package com.ja.safari.dto;

public class CsLiveChatRating {
	
	private int id;
	private int chat_id;
	private int rating;
	private String text_review;
	
	public CsLiveChatRating() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CsLiveChatRating(int id, int chat_id, int rating, String text_review) {
		super();
		this.id = id;
		this.chat_id = chat_id;
		this.rating = rating;
		this.text_review = text_review;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getText_review() {
		return text_review;
	}
	public void setText_review(String text_review) {
		this.text_review = text_review;
	}
	
	
	
}
