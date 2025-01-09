package com.foodapp.model;

public class CartItem {

    private int itemId;
    private int restrauntId;
    private String name;
    private int quantity;
    private int price;  // Keep price as int
    private int menuId;
    
    // Constructor that matches your use case
    public CartItem(int itemId, String name, int price, int quantity) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }
    
//    public CartItem(int itemId, String name, int price, int quantity, int restrauntId) {
//        this.itemId = itemId;
//        this.name = name;
//        this.price = price;
//        this.quantity = quantity;
//        this.restrauntId = restrauntId;  // Set restaurant ID
//    }

    
    public CartItem(int itemId, String name, int price, int quantity, int restrauntId, int menuId) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.restrauntId = restrauntId;  // Set restaurant ID
        this.menuId = menuId;  // Set menuId directly
    }
    
    
    public CartItem(int itemId, String name, int price, int quantity, int restrauntId) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.restrauntId = restrauntId;  // Set restaurant ID
        this.menuId = itemId;  // Set menuId as itemId (if they are the same)
    }

    // Getter for menuId
    public int getMenuId() {
        return menuId;
    }

    // Setter for menuId
    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }
    
    // Getters and setters
    public int getItemId() {
        return itemId;
    }
    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getRestrauntId() {
        return restrauntId;
    }
    public void setRestrauntId(int restrauntId) {
        this.restrauntId = restrauntId;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }

    // Method to calculate total price based on price * quantity
    public int getTotalPrice() {
        return price * quantity;
    }

    @Override
    public String toString() {
        return "CartItem [itemId=" + itemId + ", restrauntId=" + restrauntId + ", name=" + name + ", quantity=" 
                + quantity + ", price=" + price + "]";
    }
}
