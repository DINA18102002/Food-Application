package com.foodapp.DAO;

import java.util.ArrayList;
import java.util.Collection;

import com.foodapp.model.OrderItems;

public interface OrderItemsDAO {
	int insert(OrderItems oi);
	ArrayList<OrderItems> fetchAll();
	OrderItems fetchOne(int id); 
	int update(int orderItemId, int orderId, int menuId, int quantity, int itemTotal );
	int delete(int id);
	
	 Collection<OrderItems> getOrderItemsForOrder(int orderId);
}
