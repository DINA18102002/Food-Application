package com.foodapp.DAOImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.DAO.RestrauntDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.Restraunt;

public class RestrauntDAOImpl implements RestrauntDAO {


	private static ArrayList<Restraunt> restrauntList = new ArrayList<Restraunt>();
	private static final String INSERT = "insert into restraunt ( name, cuisinetype, deliverytime, address, rating, isactive, imagepath) values ( ?,?,?,?,?,?,?)";
	private static final String FETCHALL = "select * from restraunt";
	private static final String FETCHONE = "select * from restraunt where restrauntid=?";
	private static final String UPDATE = "update restraunt set name=?,cuisinetype=?,deliverytime=?,address=?,rating=?,isactive=?,imagepath=? where name=?";
	private static final String DELETE = "delete from restraunt where name=?";

	 private static final String INSERT_RESTAURANT_SQL = "INSERT INTO restaurant (name, cuisineType, deliveryTime, address, rating, isActive, imagepath) VALUES (?, ?, ?, ?, ?, ?, ?)";


	private static Connection con;


	static {
		con = DBConnection.connect();
	       
	}
	
 
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private Restraunt r;


	@Override
	public int insert(Restraunt r) {

		try {
			pstmt = con.prepareStatement(INSERT,Statement.RETURN_GENERATED_KEYS);
			
			
			pstmt.setString(1, r.getName());
			pstmt.setString(2, r.getCuisineType());
			pstmt.setInt(3, r.getDeliveryTime());
			pstmt.setString(4, r.getAddress());
			pstmt.setFloat(5, r.getRating());
			pstmt.setBoolean(6, r.isActive());
			pstmt.setString(7, "images/"+r.getName()+".jpg");

			 int affectedRows = pstmt.executeUpdate();
		        if (affectedRows > 0) {
		            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
		                if (generatedKeys.next()) {
		                    r.setId(generatedKeys.getInt(1)); // Set the generated ID to the restaurant object
		                   
		                    return 1; // Indicate success
		                }
		            }
		        }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	@Override
	public ArrayList<Restraunt> getAll() {
		try {
			 ArrayList<Restraunt> restrauntList = new ArrayList<>();

			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
		
			restrauntList = extractRestrauntlistFromResultSet(resultSet);
			
			for(Restraunt r: restrauntList) {
				
				System.out.println(r);
			}
			return restrauntList;
		}
		catch(Exception e) {
		    
			e.printStackTrace();
			return null;
		}
		
	}
	
	


	@Override
	public Restraunt fetchOne(int id) {
	    try {
	        pstmt = con.prepareStatement(FETCHONE);
	        pstmt.setInt(1, id);
	        resultSet = pstmt.executeQuery();

	        return extractRestrauntlistFromResultSet(resultSet).get(0);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	     
	}



	private ArrayList<Restraunt> extractRestrauntlistFromResultSet(ResultSet resultSet) {
	    
	    try {
	        while(resultSet.next()) {
	        	restrauntList.add(new Restraunt(
	            		resultSet.getInt("restrauntid"),
	                resultSet.getString("name"),
	                resultSet.getString("cuisinetype"),
	                resultSet.getInt("deliverytime"),
	                resultSet.getString("address"),
	                resultSet.getFloat("rating"),
	                resultSet.getBoolean("isactive"),
	                resultSet.getString("imagepath")
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return restrauntList; // Return the fresh list
	}



	@Override
	public int update( String name, String cuisinetype, int deliverytime, String address, float rating,
			boolean isActive, String imagepath) {
		
		try {
			pstmt=con.prepareStatement(UPDATE);
			
			pstmt.setString(1, cuisinetype);
			pstmt.setInt(2, deliverytime);
			pstmt.setString(3, address);
			pstmt.setFloat(4, rating);
			pstmt.setBoolean(5, isActive);
			pstmt.setString(6, imagepath);
			pstmt.setString(7, name);
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}


	@Override
	public int delete(String name) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setString(1, name);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}


	@Override
	public ArrayList<Restraunt> validateRestraunt(String name,int id) {
		try {
			con=DBConnection.connect();
			String query="select * from restraunt where name=? and restrauntid=?";
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setInt(2, id);
			
			resultSet=pstmt.executeQuery();
			 ArrayList<Restraunt> restrauntList = new ArrayList<>();
		        while (resultSet.next()) {
		            Restraunt restraunt = new Restraunt();
		            restraunt.setName(resultSet.getString("name"));
		            restraunt.setId(resultSet.getInt("restrauntid"));
		            restrauntList.add(restraunt);
		        }
		        return restrauntList;
				
			}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		  return new ArrayList<>();




	}


	@Override
	public ArrayList<Integer> getAllRestrauntIds() {
		 ArrayList<Integer> restrauntIds = new ArrayList<>();
	        try {
	            stmt = con.createStatement();
	            resultSet = stmt.executeQuery(FETCHALL);
	            
	            // Clear the list to ensure you're getting fresh data
	            restrauntIds.clear();
	            
	            while (resultSet.next()) {
	                restrauntIds.add(resultSet.getInt("restrauntid"));
	            }
	            return restrauntIds;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	}


	@Override
	public void saveRestraunt(Restraunt restraunt) {
		try {
			pstmt=con.prepareStatement(INSERT_RESTAURANT_SQL);
			pstmt.setString(1, restraunt.getName());
			pstmt.setString(2, restraunt.getCuisineType());
            pstmt.setInt(3, restraunt.getDeliveryTime());
            pstmt.setString(4, restraunt.getAddress());
            pstmt.setFloat(5, restraunt.getRating());
            pstmt.setBoolean(6, restraunt.isActive());
            pstmt.setString(7, "images/"+r.getName()+".jpg");

            pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
