package com.foodapp.model;

public class Restraunt {
    
    private int id;
    private String name;
    private String cuisineType;
    private int deliveryTime;
    private String address;
    private float rating;
    private boolean isActive;
    private String imagepath;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImagepath() {
    	 return imagepath;  
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    // Constructors
    public Restraunt(int id, String name, String cuisineType, int deliveryTime, String address, float rating,
                     boolean isActive, String imagepath) {
        this.id = id;
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
        this.imagepath = imagepath;
    }

    public Restraunt(String name, String cuisineType, int deliveryTime, String address, float rating,
                     boolean isActive, String imagepath) {
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
        this.imagepath = imagepath;
    }

    public Restraunt(String name, String cuisineType, int deliveryTime, String address, float rating, boolean isActive) {
        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.rating = rating;
        this.isActive = isActive;
    }

    public Restraunt() {
    }

    // toString for debugging
    @Override
    public String toString() {
        return "Restraunt {\n" +
                "  id=" + id + ",\n" +
                "  name='" + name + "',\n" +
                "  cuisineType='" + cuisineType + "',\n" +
                "  deliveryTime=" + deliveryTime + ",\n" +
                "  address='" + address + "',\n" +
                "  rating=" + rating + ",\n" +
                "  isActive=" + isActive + ",\n" +
                "  imagepath='" + imagepath + "'\n" +
                '}';
    }
}
