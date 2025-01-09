package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.OrdersDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.CustomerFeedback;
import com.foodapp.model.Orders;

public class OrdersDAOImpl implements OrdersDAO {

    private static final String INSERT = "INSERT INTO orders (userid, restrauntid, orderdate, totalamount, status, paymentmode) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String FETCH_ALL = "SELECT * FROM orders";
    private static final String FETCH_ONE = "SELECT * FROM orders WHERE orderid = ?";
    private static final String UPDATE = "UPDATE orders SET userid = ?, restrauntid = ?, orderdate = ?, totalamount = ?, status = ?, paymentmode = ? WHERE orderid = ?";
    private static final String DELETE = "DELETE FROM orders WHERE orderid = ?";
    private static final String VALIDATE_RESTRAUNT = "SELECT 1 FROM restraunt WHERE restrauntid = ?";

    private static Connection con;

    static {
        con = DBConnection.connect();
    }
    
   
    public int insert(Orders o) {
        if (!isValidRestrauntId(o.getRestrauntId())) {
            System.err.println("Invalid restraunt ID: " + o.getRestrauntId());
            return 0; // Return immediately if invalid
        }

        try (PreparedStatement pstmt = con.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS)) {
            pstmt.setInt(1, o.getUserid());
            pstmt.setInt(2, o.getRestrauntId());
            pstmt.setString(3, o.getOrderDate());
            pstmt.setInt(4, o.getTotalAmount());
            pstmt.setString(5, o.getStatus());
            pstmt.setString(6, o.getPaymentMode());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedOrderId = generatedKeys.getInt(1);
                        o.setOrderId(generatedOrderId);
                        return generatedOrderId;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }



    public boolean isValidRestrauntId(int restrauntId) {
        try (PreparedStatement validateStmt = con.prepareStatement(VALIDATE_RESTRAUNT)) {
            validateStmt.setInt(1, restrauntId);
            try (ResultSet rs = validateStmt.executeQuery()) {
                return rs.next(); // Returns true if restrauntId exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public ArrayList<Orders> fetchAll() {
        ArrayList<Orders> ordersList = new ArrayList<>();
        try (PreparedStatement pstmt = con.prepareStatement(FETCH_ALL);
             ResultSet resultSet = pstmt.executeQuery()) {

            while (resultSet.next()) {
                Orders order = new Orders(
                        resultSet.getInt("orderid"),
                        resultSet.getInt("userid"),
                        resultSet.getInt("restrauntid"),
                        resultSet.getString("orderdate"),
                        resultSet.getInt("totalamount"),
                        resultSet.getString("status"),
                        resultSet.getString("paymentmode")
                );
                ordersList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordersList;
    }

    @Override
    public Orders fetchOne(int id) {
        try (PreparedStatement pstmt = con.prepareStatement(FETCH_ONE)) {
            pstmt.setInt(1, id);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    return new Orders(
                            resultSet.getInt("orderid"),
                            resultSet.getInt("userid"),
                            resultSet.getInt("restrauntid"),
                            resultSet.getString("orderdate"),
                            resultSet.getInt("totalamount"),
                            resultSet.getString("status"),
                            resultSet.getString("paymentmode")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int update(int orderId, int userid, int restrauntId, String orderDate, int totalAmount, String status, String paymentMode) {
        try (PreparedStatement pstmt = con.prepareStatement(UPDATE)) {
            pstmt.setInt(1, userid);
            pstmt.setInt(2, restrauntId);
            pstmt.setString(3, orderDate);
            pstmt.setInt(4, totalAmount);
            pstmt.setString(5, status);
            pstmt.setString(6, paymentMode);
            pstmt.setInt(7, orderId);

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int delete(int id) {
        try (PreparedStatement pstmt = con.prepareStatement(DELETE)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }



	@Override
	public Orders getOrderById(int orderId) {
		
		
		String query= "select * from orders where orderid=?";
		
		Orders order =null;
		try {
			PreparedStatement preparedStatement =con.prepareStatement(query);
			preparedStatement.setInt(1, orderId);
			 ResultSet resultSet = preparedStatement.executeQuery();
			 
			 if (resultSet.next()) {
	                 order = new Orders(
	                        resultSet.getInt("orderid"),
	                        resultSet.getInt("userid"),
	                        resultSet.getInt("restrauntid"),
	                        resultSet.getString("orderdate"),
	                        resultSet.getInt("totalamount"),
	                        resultSet.getString("status"),
	                        resultSet.getString("paymentmode")
	                );
			 
			 
		}
		
		}catch(Exception e) {
			e.printStackTrace();
	}
	return order;
}



	@Override
	public int getTotalOrders(int restaurantId) {
		String sql = "select count(*) from orders where restrauntid=?";
		try {
			PreparedStatement pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, restaurantId);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				return res.getInt(1);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}



	
	public double getAverageRating(int restaurantId) {
		String sql = "SELECT AVG(rating) FROM reviews WHERE restrauntid = ?";
		try {
			PreparedStatement pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, restaurantId);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				return res.getDouble(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0.0;
	}



	
	public List<CustomerFeedback> getReviews(int restaurantId) {
	    List<CustomerFeedback> reviews = new ArrayList<>();
	    String sql = "SELECT o.orderid, c.customername, r.review, r.rating, r.reviewdate " +
	                 "FROM orders o " +
	                 "JOIN reviews r ON o.orderid = r.orderid " +
	                 "JOIN customer_details c ON o.userid = c.userid " +
	                 "WHERE o.restrauntid = ? AND r.review IS NOT NULL";

	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setInt(1, restaurantId);
	        ResultSet res = pstmt.executeQuery();
	        while (res.next()) {
	            CustomerFeedback feedback = new CustomerFeedback();
	            feedback.setOrderId(res.getInt("orderid"));
	            feedback.setCustomerName(res.getString("customername"));
	            feedback.setReview(res.getString("review"));
	            feedback.setRating(res.getInt("rating"));
	            feedback.setReportDate(res.getTimestamp("reviewdate"));
	            reviews.add(feedback);
	        }
	        System.out.println("Fetching reviews for restaurantId: " + restaurantId);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return reviews;
	}







	
	public List<CustomerFeedback> getCustomerReports(int restaurantId) {
	    List<CustomerFeedback> reports = new ArrayList<>();
	    String sql = "SELECT o.orderid, c.customername, r.report FROM orders o " +
	                 "JOIN reviews r ON o.orderid = r.orderid " +
	                 "JOIN customer_details c ON o.userid = c.userid " +
	                 "WHERE o.restrauntid = ?";

	    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
	        pstmt.setInt(1, restaurantId);
	        try (ResultSet res = pstmt.executeQuery()) {
	            while (res.next()) {
	                CustomerFeedback feedback = new CustomerFeedback();
	                feedback.setOrderId(res.getInt("orderid"));
	                feedback.setCustomerName(res.getString("customername"));

	                String report = res.getString("report");
	                if (report == null || report.trim().isEmpty()) {
	                    feedback.setReport("No report available");
	                } else {
	                    feedback.setReport(report);
	                }

	                reports.add(feedback);
	            }
	            System.out.println("Fetching customer reports for restaurantId: " + restaurantId);
	        }
	    } catch (SQLException e) {
	        System.err.println("SQL Error in getCustomerReports: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return reports;
	}






	
	
	
	
	
	
	
	
	
}
