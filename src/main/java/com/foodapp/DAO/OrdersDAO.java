package com.foodapp.DAO;

import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.CustomerFeedback;
import com.foodapp.model.Orders;

public interface OrdersDAO {
	int insert(Orders o);
	ArrayList<Orders>fetchAll();
	Orders fetchOne(int id);
	int update(int orderId, int userid, int restrauntId, String orderDate, int totalAmount, String status,
			String paymentMode);
	int delete (int id);
	
	boolean isValidRestrauntId(int restrauntId);
	 Orders getOrderById(int orderId);
	 
	 
	 int getTotalOrders(int restaurantId);
	 double getAverageRating(int restaurantId);
	public  List<CustomerFeedback> getReviews(int restaurantId);
	public List<CustomerFeedback> getCustomerReports(int restaurantId);
	 
	 
}
