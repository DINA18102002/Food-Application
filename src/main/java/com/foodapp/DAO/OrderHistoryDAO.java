package com.foodapp.DAO;

import java.util.ArrayList;

import com.foodapp.model.OrderHistory;

public interface OrderHistoryDAO {
	int insert(OrderHistory oh);
	ArrayList<OrderHistory>fetchAll();
	OrderHistory fetchOne(int id); 
	int update(int orderHistoryId, int orderId, int userId, int totalAmount, String status, String orderdate);
	int delete(int id);
	
	
}
