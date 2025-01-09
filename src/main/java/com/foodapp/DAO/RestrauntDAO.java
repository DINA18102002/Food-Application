package com.foodapp.DAO;

import java.util.ArrayList;

import com.foodapp.model.Restraunt;

public interface RestrauntDAO {
	
	int insert(Restraunt r);
	ArrayList<Restraunt>getAll();
	Restraunt fetchOne(int  id);
	int update(String name, String cuisinetype, int deliverytime, String address, float rating,
			boolean isActive, String imagepath);
	int delete(String name);
	
	ArrayList<Restraunt>validateRestraunt(String name,int id);
	
	ArrayList<Integer> getAllRestrauntIds();
	
	void saveRestraunt(Restraunt restraunt);
}
