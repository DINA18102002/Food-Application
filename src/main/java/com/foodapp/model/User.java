package com.foodapp.model;

public class User {

	
	private String username;
	private String password;
	private String email;
	private String mobile;
	private String address;
	
	
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User( String username, String password, String email, String mobile,String address) {
		super();
		
		this.username = username;
		this.password = password;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		
	}
	
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [ username=" + username + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", mobile=" + mobile + "]";
	}
	
	

}
