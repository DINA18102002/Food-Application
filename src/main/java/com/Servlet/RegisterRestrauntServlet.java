package com.Servlet;

import java.io.IOException;
import java.sql.Connection;

import com.foodapp.DAO.RestrauntDAO;
import com.foodapp.DAOImpl.RestrauntDAOImpl;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.Restraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterRestrauntServlet
 */
public class RegisterRestrauntServlet extends HttpServlet {
	
	private Connection con;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
	            // Retrieve form data
	            String name = req.getParameter("name");
	            String cuisineType = req.getParameter("cuisineType");
	            String deliveryTimeStr = req.getParameter("deliveryTime");
	            String address = req.getParameter("address");
	            String ratingStr = req.getParameter("rating");
	            String isActiveStr = req.getParameter("isActive");

	            // Validate and parse delivery time
	            int deliveryTime = 0;
	            if (deliveryTimeStr != null && !deliveryTimeStr.trim().isEmpty()) {
	                try {
	                    deliveryTime = Integer.parseInt(deliveryTimeStr);
	                } catch (NumberFormatException e) {
	                    resp.getWriter().println("Invalid delivery time. Please provide a valid number.");
	                    return;
	                }
	            } else {
	                resp.getWriter().println("Delivery time cannot be empty.");
	                return;
	            }

	            // Validate and parse rating
	            float rating = 0.0f;
	            if (ratingStr != null && !ratingStr.trim().isEmpty()) {
	                try {
	                    rating = Float.parseFloat(ratingStr);
	                } catch (NumberFormatException e) {
	                    resp.getWriter().println("Invalid rating. Please provide a valid number.");
	                    return;
	                }
	            } else {
	                resp.getWriter().println("Rating cannot be empty.");
	                return;
	            }

	            // Parse isActive value
	            boolean isActive = "yes".equalsIgnoreCase(isActiveStr);

	            // Create restaurant object
	            Restraunt restraunt = new Restraunt(name, cuisineType, deliveryTime, address, rating, isActive);

	            // Create DAO object and call insert method
	            RestrauntDAO restrauntDAO = new RestrauntDAOImpl();
	            int result = restrauntDAO.insert(restraunt);

	            // Fetch restaurant details after insertion (including the restaurant ID)
	            int restrauntId = restraunt.getId();
	            String restrauntName = restraunt.getName();
	            
	            // Debug: Log the inserted data
	            System.out.println("Inserted Restaurant ID: " + restrauntId);
	            System.out.println("Restaurant Name: " + restrauntName);
	            
	            // Create session and store restaurant details
	            HttpSession session = req.getSession(true); // Ensure session is created if not already present
	            session.setAttribute("restrauntid", restrauntId);
	            session.setAttribute("restrauntname", restrauntName);
	            session.setAttribute("cuisinetype", cuisineType);
	            session.setAttribute("address", address);
	            session.setAttribute("deliverytime", deliveryTime);
	            session.setAttribute("rating", rating);
	            session.setAttribute("isactive", isActive);

	            // Debugging: Print session details
	            System.out.println("Session ID: " + session.getId());
	            System.out.println("Restaurant ID in session: " + session.getAttribute("restrauntid"));

	            // Check if insertion was successful and forward/redirect accordingly
	            if (result > 0) {
	                req.setAttribute("restrauntid", restrauntId);
	                req.setAttribute("restrauntname", restrauntName);
	                req.getRequestDispatcher("registerrestrauntsuccess.jsp").forward(req, resp); // Forward to success page
	            } else {
	                resp.sendRedirect("registerrestrauntfailure.jsp"); // Redirect to failure page
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            resp.getWriter().println("An error occurred. Please try again.");
	        }
	    }
}
