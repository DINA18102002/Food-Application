package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import com.foodapp.DAO.OrderItemsDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.OrderItems;

public class OrderItemsDAOImpl implements OrderItemsDAO {
	
	static ArrayList<OrderItems>orderItemList=new ArrayList<OrderItems>();
	private static final String INSERT = "insert into orderitems (orderid,menuid,quantity,itemtotal) values (?,?,?,?)";
	private static final String FETCHALL ="select * from orderitems";
	private static final String FETCHONE ="select * from orderitems where orderitemid=?";
	private static final String UPDATE ="update  orderitems set orderid=?,menuid=?,quantity=?,itemtotal=? where orderitemid=?";
	private static final String DELETE="delete from orderitems where orderitemid=?"; 
	private static Connection con;

	
	static {
		con=DBConnection.connect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private OrderItems oi;
	
	@Override
	public int insert(OrderItems oi) {
		try {
			pstmt=con.prepareStatement(INSERT);
			
			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3, oi.getQuantity());
			pstmt.setInt(4, oi.getItemTotal());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<OrderItems> fetchAll() {
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			
			orderItemList=extractorderItemListfromResultSet(resultSet);
			
			while(resultSet.next()) {
				orderItemList.add(
						new OrderItems(
								resultSet.getInt("orderitemid"),
								resultSet.getInt("orderid"),
								resultSet.getInt("menuid"),
								resultSet.getInt("quantity"),
								resultSet.getInt("itemtotal")
								));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return orderItemList;
	}

	@Override
	public OrderItems fetchOne(int id) {
		try {
			pstmt =con.prepareStatement(FETCHONE);
			pstmt.setInt(1, id);
			
			resultSet=pstmt.executeQuery();
			oi=extractorderItemListfromResultSet(resultSet).get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return oi;
	}

	private ArrayList<OrderItems> extractorderItemListfromResultSet(ResultSet resultSet2) {
		
		try {
			while(resultSet.next()) {
				orderItemList.add(
						new OrderItems(
								resultSet.getInt("orderitemid"),
								resultSet.getInt("orderid"),
								resultSet.getInt("menuid"),
								resultSet.getInt("quantity"),
								resultSet.getInt("itemtotal")
								));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return orderItemList;
	}

	@Override
	public int update(int orderItemId, int orderId, int menuId, int quantity, int itemTotal) {
		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(1, orderId);
			pstmt.setInt(2, menuId);
			pstmt.setInt(3, quantity);
			pstmt.setInt(4, itemTotal);
			pstmt.setInt(5, orderItemId);
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
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
			return 0;
		}
		
	}

	@Override
	public Collection<OrderItems> getOrderItemsForOrder(int orderId) {
		String query = "select * from orderitems where orderid=?";
		Collection<OrderItems> orderItemsList = new ArrayList<>();
		
		try {
			PreparedStatement preparedStatement=con.prepareStatement(query);
			preparedStatement.setInt(1, orderId);
			 ResultSet resultSet = preparedStatement.executeQuery();
			
			 while(resultSet.next()) {
				 OrderItems orderItem = new OrderItems(
						 resultSet.getInt("orderitemid"),
							resultSet.getInt("orderid"),
							resultSet.getInt("menuid"),
							resultSet.getInt("quantity"),
							resultSet.getInt("itemtotal")
						 );
				 orderItemsList.add(orderItem);
			 }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		  return orderItemsList;
	}
	
	
	
	
	
	

}
