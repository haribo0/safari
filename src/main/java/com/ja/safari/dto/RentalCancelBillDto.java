package com.ja.safari.dto;

public class RentalCancelBillDto {
    private int id;
    private int rental_cancel_id;
    private int discount_revocation;
    private int condition_check_charge;
    private String is_completed;

    public RentalCancelBillDto() {
    }

    public RentalCancelBillDto(int id, int rental_cancel_id, int discount_revocation, int condition_check_charge, String is_completed) {
        this.id = id;
        this.rental_cancel_id = rental_cancel_id;
        this.discount_revocation = discount_revocation;
        this.condition_check_charge = condition_check_charge;
        this.is_completed = is_completed;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRental_cancel_id() {
        return rental_cancel_id;
    }

    public void setRental_cancel_id(int rental_cancel_id) {
        this.rental_cancel_id = rental_cancel_id;
    }

    public int getDiscount_revocation() {
        return discount_revocation;
    }

    public void setDiscount_revocation(int discount_revocation) {
        this.discount_revocation = discount_revocation;
    }

    public int getCondition_check_charge() {
        return condition_check_charge;
    }

    public void setCondition_check_charge(int condition_check_charge) {
        this.condition_check_charge = condition_check_charge;
    }

    public String getIs_completed() {
        return is_completed;
    }

    public void setIs_completed(String is_completed) {
        this.is_completed = is_completed;
    }
}
