package com.ja.safari.dto;

public class CsEmpRatingResponseDto {
	
	private double qna_rating;
	private double chat_rating;
	public CsEmpRatingResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CsEmpRatingResponseDto(double qna_rating, double chat_rating) {
		super();
		this.qna_rating = qna_rating;
		this.chat_rating = chat_rating;
	}
	public double getQna_rating() {
		return qna_rating;
	}
	public void setQna_rating(double qna_rating) {
		this.qna_rating = qna_rating;
	}
	public double getChat_rating() {
		return chat_rating;
	}
	public void setChat_rating(double chat_rating) {
		this.chat_rating = chat_rating;
	}
	
	
	

}
