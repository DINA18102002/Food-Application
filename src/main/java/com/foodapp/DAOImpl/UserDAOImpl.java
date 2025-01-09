package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.DAO.UserDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.User;



public class UserDAOImpl implements UserDAO {
	
	static ArrayList<User> userList = new ArrayList<User>();
	private static final String INSERT="insert into user (username,password,email,mobile,address) values (?,?,?,?,?)";
	private static final String FETCHALL = "select * from user";
	private static final String FETCHONE = "select * from user where email = ?";
	private static final String UPDATE = "update  user set username=?,password=?,email=?,mobile=?,address=? where userid=?";
	private static final String DELETE = "delete from user where userid=?";
		private static Connection con;

		static {
			con = DBConnection.connect();
		}
		
		
		private PreparedStatement pstmt;
		private Statement stmt;
		private ResultSet resultSet;
//		private  User u;

		@Override
		public int insert(User u) {
			try {
				pstmt = con.prepareStatement(INSERT);
				
				pstmt.setString(1, u.getUsername());
				pstmt.setString(2, u.getPassword());
				pstmt.setString(3, u.getEmail());
				pstmt.setString(4, u.getMobile());
				pstmt.setString(5, u.getAddress());
				
				return pstmt.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return 0;
		}

		@Override
		public ArrayList<User> fetchAll() {
			try {
				stmt = con.createStatement();
				resultSet = stmt.executeQuery(FETCHALL);
				
				userList = extractUserlistFromResultSet(resultSet);
				
//				while(resultSet.next()) {
//					userList.add(
//							new User(
//									resultSet.getInt("userid"),
//									resultSet.getString("username"),
//									resultSet.getString("password"),
//									resultSet.getString("email"),
//									resultSet.getString("mobile"),
//									resultSet.getString("address")
//									
//									)
//							);
//				}
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return userList;
		}

		@Override
		public User fetchByEmail(String  email) {
			
			try {
				pstmt = con.prepareStatement(FETCHONE);
				pstmt.setString(1, email);
				resultSet = pstmt.executeQuery();
			
//				return extractUserlistFromResultSet(resultSet).get(0);
				
				ArrayList<User> users = extractUserlistFromResultSet(resultSet);
		        if (users.isEmpty()) {
		            return null; // No user found
		        }
		        return users.get(0);
			}
			catch(Exception e) {
				e.printStackTrace();

			}
			return null;
		}

		private ArrayList<User> extractUserlistFromResultSet(ResultSet resultSet) {
			ArrayList<User> userList = new ArrayList<>();
			try {
				while(resultSet.next()) {
					userList.add(
							new User(

									resultSet.getString("username"),
									resultSet.getString("password"),
									resultSet.getString("email"),
									resultSet.getString("mobile"),
									resultSet.getString("address")
									));
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return userList;
		}

		@Override
		public int update(int userid, String username, String password, String email,String mobile, String address) {
			try {
				pstmt = con.prepareStatement(UPDATE);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				pstmt.setString(3, email);
				pstmt.setString(4, mobile);
				pstmt.setString(5, address);
				pstmt.setInt(6, userid);
				
				
				return pstmt.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
				return 0;
			}
			
		}

		@Override
		public int delete(int userid) {
			try {
				pstmt = con.prepareStatement(DELETE);
				pstmt.setInt(1, userid);
				return pstmt.executeUpdate();
				
			}
			catch(Exception e) {
				e.printStackTrace();
				return 0;
			}
			
		}

		@Override
		public int getUserIdByEmail(String email) {
			
			String query = "select userid from user where email=?";
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, email);
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next()) {
					return resultSet.getInt("userid");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

		
		
		
}






















