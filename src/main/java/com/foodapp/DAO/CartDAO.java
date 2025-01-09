package com.foodapp.DAO;

import java.util.Map;

import com.foodapp.model.CartItem;

public interface CartDAO {
	void addItem(CartItem item);
	
	 void removeItem(int itemId);  // Declare the removeItem method
	    
	    Map<Integer, CartItem> getItems();
	    
	    void updateItems(int itemId, int quantity);

	    void clear();
	
}
