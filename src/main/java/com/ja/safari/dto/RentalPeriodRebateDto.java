package com.ja.safari.dto;

public class RentalPeriodRebateDto {
    private int id;
    private int item_id;
    private double discount_rate;
    private int rental_period;

    public RentalPeriodRebateDto() {
    }

    public RentalPeriodRebateDto(int id, int item_id, double discount_rate, int rental_period) {
        this.id = id;
        this.item_id = item_id;
        this.discount_rate = discount_rate;
        this.rental_period = rental_period;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public double getDiscount_rate() {
        return discount_rate;
    }

    public void setDiscount_rate(double discount_rate) {
        this.discount_rate = discount_rate;
    }

    public int getRental_period() {
        return rental_period;
    }

    public void setRental_period(int rental_period) {
        this.rental_period = rental_period;
    }
}
