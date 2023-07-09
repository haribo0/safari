package com.ja.safari.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true) // 서버에서 json parse할때 키와 값을 dto로 생성시 무시되는 값 있을때 오류 무시
public class RentalOrderKakaopayApprove {

	private int id;
    private String aid; // 요청 고유 번호
    private String tid; // 결제 고유 번호
    private String cid; // 가맹점 코드
    private String sid; // 정기결제용 ID
    private String partner_order_id; // 가맹점 주문 번호
    private String partner_user_id; // 가맹점 회원 id
    private String payment_method_type; // 결제 수단
    private String item_name; // 상품명
    private int quantity; // 상품 수량
    // private Amount amount; // 결제 금액 정보
    private Date created_at; // 결제 요청 시간
    private Date approved_at; // 결제 승인 시간
    
	public RentalOrderKakaopayApprove() {
		super();
	}

	public RentalOrderKakaopayApprove(int id, String aid, String tid, String cid, String sid, String partner_order_id,
			String partner_user_id, String payment_method_type, String item_name, int quantity, Date created_at,
			Date approved_at) {
		super();
		this.id = id;
		this.aid = aid;
		this.tid = tid;
		this.cid = cid;
		this.sid = sid;
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.payment_method_type = payment_method_type;
		this.item_name = item_name;
		this.quantity = quantity;
		this.created_at = created_at;
		this.approved_at = approved_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
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

	public String getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}

	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}

	public String getPayment_method_type() {
		return payment_method_type;
	}

	public void setPayment_method_type(String payment_method_type) {
		this.payment_method_type = payment_method_type;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getApproved_at() {
		return approved_at;
	}

	public void setApproved_at(Date approved_at) {
		this.approved_at = approved_at;
	}


    
	
}

