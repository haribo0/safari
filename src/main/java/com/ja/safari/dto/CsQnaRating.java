package com.ja.safari.dto;

public class CsQnaRating {
	
	private int id;
	private int qna_id;
	private int rating;
	private String text_review;
	
	
	public CsQnaRating() {
		// TODO Auto-generated constructor stub
	}


	public CsQnaRating(int id, int qna_id, int rating, String text_review) {
		super();
		this.id = id;
		this.qna_id = qna_id;
		this.rating = rating;
		this.text_review = text_review;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getQna_id() {
		return qna_id;
	}


	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
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
