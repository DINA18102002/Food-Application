package com.foodapp.model;

import java.util.List;

public class Orders {
	private int orderId;
	private int userid;
	private int restrauntId;
	private String orderDate;
	private int totalAmount;
	private String status;
	private String paymentMode;
	
	private List<CustomerFeedback> feedbackList;
	
	 public List<CustomerFeedback> getFeedbackList() {
	        return feedbackList;
	    }

	    public void setFeedbackList(List<CustomerFeedback> feedbackList) {
	        this.feedbackList = feedbackList;
	    }
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRestrauntId() {
		return restrauntId;
	}
	public void setRestrauntId(int restrauntId) {
		this.restrauntId = restrauntId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public Orders(int orderId, int userid, int restrauntId, String orderDate, int totalAmount, String status,
			String paymentMode) {
		super();
		this.orderId = orderId;
		this.userid = userid;
		this.restrauntId = restrauntId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", userid=" + userid + ", restrauntId=" + restrauntId + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode=" + paymentMode
				+ "]";
	}
	
	
	
}
