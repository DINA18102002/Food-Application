package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.DAO.OrderHistoryDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.OrderHistory;

public class OrderHistoryDAOImpl implements OrderHistoryDAO {
	
	static ArrayList<OrderHistory>orderHistoryList=new ArrayList<OrderHistory>();
	private static final String INSERT ="insert into orderhistory (orderid,userid,totalamount,status,orderdate) values (?,?,?,?,?)";
	private static final String FETCHALL="select * from orderhistory";
	private static final String FETCHONE="select * from orderhistory where orderhistoryid=?";
	private static final String UPDATE="update orderhistory set orderid=?,userid=?,totalamount=?,status=?,orderdate=? where orderhistoryid=?";
	private static final String DELETE="delete from orderhistory where orderhistoryid=?";
	private static Connection con;

	static {
		con=DBConnection.connect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private OrderHistory oh;
	
	@Override
	public int insert(OrderHistory oh) {
		try {
			pstmt =con.prepareStatement(INSERT);
			
			pstmt.setInt(1, oh.getOrderId());
			pstmt.setInt(2, oh.getUserId());
			pstmt.setInt(3, oh.getTotalAmount());
			pstmt.setString(4, oh.getStatus());
			pstmt.setString(5, oh.getOrderdate());
			
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<OrderHistory> fetchAll() {
		try {
			stmt=con.createStatement();
			resultSet =stmt.executeQuery(FETCHALL);
			
			orderHistoryList=extractOrderHistoryListFromResultSet(resultSet);
			
			while(resultSet.next()) {
				orderHistoryList.add(
						new OrderHistory(
								resultSet.getInt("orderhistoryid"),
								resultSet.getInt("orderid"),
								resultSet.getInt("userid"),
								resultSet.getInt("totalamount"),
								resultSet.getString("status"),
								resultSet.getString("orderdate")
								));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return orderHistoryList;
	}

	@Override
	public OrderHistory fetchOne(int id) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, id);
			resultSet=pstmt.executeQuery();
			
			oh=extractOrderHistoryListFromResultSet(resultSet).get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return oh;
	}

	private ArrayList<OrderHistory> extractOrderHistoryListFromResultSet(ResultSet resultSet2) {
		try {
			while(resultSet.next()) {
				orderHistoryList.add(
						new OrderHistory(
								resultSet.getInt("orderhistoryid"),
								resultSet.getInt("orderid"),
								resultSet.getInt("userid"),
								resultSet.getInt("totalamount"),
								resultSet.getString("status"),
								resultSet.getString("orderdate")
								));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return orderHistoryList;
	}

	@Override
	public int update(int orderHistoryId, int orderId, int userId, int totalAmount, String status, String orderdate) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(1, orderId);
			pstmt.setInt(2, userId);
			pstmt.setInt(3, totalAmount);
			pstmt.setString(4, status);
			pstmt.setString(5, orderdate);
			pstmt.setInt(6, orderHistoryId);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(int id) {
		try {
			pstmt=con.prepareStatement(DELETE);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
