package com.ja.safari.dto;

public class RentalSurchargeBillDto {
    private int id;
    private int rental_return_id;
    private int condition_check_charge;
    private String is_completed;

    public RentalSurchargeBillDto() {
    }

    public RentalSurchargeBillDto(int id, int rentalReturnId, int conditionCheckCharge, String isCompleted) {
        this.id = id;
        this.rental_return_id = rentalReturnId;
        this.condition_check_charge = conditionCheckCharge;
        this.is_completed = isCompleted;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRental_return_id() {
        return rental_return_id;
    }

    public void setRental_return_id(int rentalReturnId) {
        this.rental_return_id = rentalReturnId;
    }

    public int getCondition_check_charge() {
        return condition_check_charge;
    }

    public void setCondition_check_charge(int conditionCheckCharge) {
        this.condition_check_charge = conditionCheckCharge;
    }

    public String getIs_completed() {
        return is_completed;
    }

    public void setIs_completed(String isCompleted) {
        this.is_completed = isCompleted;
    }
}
