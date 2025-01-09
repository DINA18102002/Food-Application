package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import com.foodapp.DAO.CartDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.CartItem;

public class CartDAOImpl implements CartDAO {
	
	Map<Integer,CartItem> items;
	private CartItem existingItem;
	
	
	public CartDAOImpl() {
		this.items=new HashMap<>();
	}
	
//	@Override
//	public void addItem(CartItem item) {
//		
//
//		
//		int itemId = item.getItemId();
//		if(items.containsKey(itemId)) {
//			CartItem existingItem = items.get(itemId);
//			existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
//		}
//		else {
//			items.put(itemId, item);
//		}
//	}
	
	@Override
	public void addItem(CartItem item) {
	    // Retrieve menuId for debugging
	    int menuId = item.getMenuId();
	    
	    // Log the received item details for better traceability
	    System.out.println("Received item for adding to cart: " + item);  // Log all item details

	    // Check if menuId is valid
	    if (menuId <= 0) {
	        // Log the invalid menuId
	        System.out.println("WARNING: Invalid menuId detected: " + menuId);
	        return; // Prevent adding invalid item to the cart
	    }

	    // If the cart already contains this item (based on menuId), update the quantity
	    if (items.containsKey(menuId)) {
	        CartItem existingItem = items.get(menuId);
	        existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
	        
	        // Log the update
	        System.out.println("Updated item in cart. New quantity: " + existingItem.getQuantity());
	    } else {
	        // Otherwise, add the new item to the cart
	        items.put(menuId, item);
	        
	        // Log the item added
	        System.out.println("Added new item to cart: " + item);
	    }

	    // Log the current state of the cart
	    System.out.println("Current cart items: " + items);
	}

	
	
	public void removeItem(int itemId) {
		items.remove(itemId);
	}
	
	public void clear() {
		items.clear();
	}
	
	public Map<Integer,CartItem>getItems(){
		return items;
	}
	
	public void updateItems(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity <=0) {
				items.remove(itemId);
			}
			else {
				
				
				items.get(itemId).setQuantity(quantity);
			}
		}
	}

	

	

}
