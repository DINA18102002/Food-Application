package com.foodapp.model;

public class Menu {
    
    private int menuId;
    private int restrauntId;
    private String name;
    private String description;
    private int price;
    private boolean isAvailable;
    private String imagePath;
    private String category;
    
    // Getter and Setter methods
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getMenuId() {
        return menuId;
    }
    
    public void setMenuId(int menuId) {
        this.menuId = menuId;
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
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getPrice() {
        return price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public boolean isAvailable() {
        return isAvailable;
    }
    
    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    // Constructor with category and imagePath
    public Menu(int menuId, int restrauntId, String name, String description, int price, boolean isAvailable, String imagePath, String category) {
        super();
        this.menuId = menuId;
        this.restrauntId = restrauntId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.imagePath = imagePath;
        this.category = category;
    }

    // Constructor without category
    public Menu(int menuId, int restrauntId, String name, String description, int price, boolean isAvailable, String imagePath) {
        super();
        this.menuId = menuId;
        this.restrauntId = restrauntId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.isAvailable = isAvailable;
        this.imagePath = imagePath;
    }

    // Default constructor
    public Menu() {
        super();
    }

    @Override
    public String toString() {
        return "Menu [menuId=" + menuId + ", restrauntId=" + restrauntId + ", name=" + name + ", description=" + description + ", price=" + price + ", isAvailable=" + isAvailable + ", imagePath=" + imagePath + "]";
    }
}
