package com.ja.safari.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true) // 서버에서 json parse할때 키와 값을 dto로 생성시 무시되는 값 있을때 오류 무시
public class RentalOrderKakaopayInactivation {

	private int id;
	private String cid;
	private String sid;
	private String status;
	private Date created_at;
	private Date inactivated_at;
	
	public RentalOrderKakaopayInactivation() {
		super();
	}

	public RentalOrderKakaopayInactivation(int id, String cid, String sid, String status, Date created_at,
			Date inactivated_at) {
		super();
		this.id = id;
		this.cid = cid;
		this.sid = sid;
		this.status = status;
		this.created_at = created_at;
		this.inactivated_at = inactivated_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getInactivated_at() {
		return inactivated_at;
	}

	public void setInactivated_at(Date inactivated_at) {
		this.inactivated_at = inactivated_at;
	}

	
}
