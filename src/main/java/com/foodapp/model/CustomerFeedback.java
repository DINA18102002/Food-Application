package com.foodapp.model;

import java.sql.Timestamp;

public class CustomerFeedback {
    private int orderId;
    private String customerName;
    private String review;
    private String report;
    private Timestamp reportDate;
    private int rating; // Optional: If you want to store rating
    private String status; // New field

    // Getters and setters for orderId
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    // Getters and setters for customerName
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    // Getters and setters for review
    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    // Getters and setters for report
    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    // Getters and setters for reportDate
    public Timestamp getReportDate() {
        return reportDate;
    }

    public void setReportDate(Timestamp reportDate) {
        this.reportDate = reportDate;
    }

    // Getters and setters for rating
    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    // Getters and setters for status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
