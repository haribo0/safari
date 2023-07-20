package com.ja.safari.dto;

public class CsQnaCountResponseDto {
	
	private int qna_count;
	private int reply_count;
	public CsQnaCountResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CsQnaCountResponseDto(int qna_count, int reply_count) {
		super();
		this.qna_count = qna_count;
		this.reply_count = reply_count;
	}
	public int getQna_count() {
		return qna_count;
	}
	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	
	

}
