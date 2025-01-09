package com.foodapp.DAO;

import java.util.ArrayList;

import com.foodapp.model.User;

public interface UserDAO {

		int insert(User u);
		ArrayList<User> fetchAll();
		User fetchByEmail(String email);
		int update(int userid,String username,String password,String email,String mobile,String address);
		int delete(int id);
		
		int getUserIdByEmail(String email);
}
