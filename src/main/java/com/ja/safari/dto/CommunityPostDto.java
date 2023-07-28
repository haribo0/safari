package com.ja.safari.dto;

import java.util.Date;

public class CommunityPostDto {
	private int id;
	private String board;
	private String title;
	private int likecount;
	private Date reg_date;
	
	public CommunityPostDto() {
		super();
	}

	public CommunityPostDto(int id, String board, String title, int likecount, Date reg_date) {
		super();
		this.id = id;
		this.board = board;
		this.title = title;
		this.likecount = likecount;
		this.reg_date = reg_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
