package com.foodapp.DAO;

import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.Menu;

public interface MenuDAO {
    // Method to insert a new menu item, including the category
    int insert(Menu m);
    
  boolean addMenu(Menu menu);

    // Method to fetch all menu items
    ArrayList<Menu> fetchAll();

    // Method to fetch a specific menu item by ID
    Menu fetchOne(int id);

    // Method to update a menu item, including category as a parameter
    int update(int menuId, int restrauntId, String name, String description, int price, boolean isAvailable, 
               String imagePath, String category);

    // Method to delete a menu item by ID
    int delete(int id);

    // Method to fetch all menu items from a specific restaurant
    ArrayList<Menu> fetchMenuByRestraunt(int restrauntId);

    // Method to fetch menu items by category (new feature)
    ArrayList<Menu> fetchMenuByCategory(String category);

    // Method to fetch menu items by restaurant and category (new feature)
    ArrayList<Menu> fetchMenuByRestrauntAndCategory(int restrauntId, String category);
    
    
    Menu getMenuById(int menuId); 
    
    
    // Method to add a new menu item
    void addMenuItem(String name, String category, String description, int price, boolean isAvailable, String imagePath, int restaurantId);

    // Method to update an existing menu item
    int updateMenuItem(int menuId, String name, String category, String description, int price, boolean isAvailable);

    // Method to delete a menu item
    int  deleteMenuItem(int menuId);

    // Method to get a list of all menu items for a restaurant
    List<Menu> getMenuItems(int restaurantId);

    // Method to get a single menu item by ID
    Menu getMenuItem(int menuId);
    
    
    int getTotalMenuItems(int restaurantId); 
    
}
