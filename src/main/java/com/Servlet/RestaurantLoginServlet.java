package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.DAO.RestrauntDAO;
import com.foodapp.DAOImpl.RestrauntDAOImpl;
import com.foodapp.model.Restraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RestaurantLoginServlet
 */
//@WebServlet("/RestaurantLoginServlet")
public class RestaurantLoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String restaurantName = req.getParameter("name");
	        String restrauntIdParam = req.getParameter("restrauntid");

	        // Check if the restrauntId parameter is null or empty
	        if (restrauntIdParam != null && !restrauntIdParam.trim().isEmpty()) {
	            try {
	                int id = Integer.parseInt(restrauntIdParam); // Try to parse the id
	                
	                // Validate the restaurant with the DAO
	                RestrauntDAO rdao = new RestrauntDAOImpl();
	                ArrayList<Restraunt> validRestraunt = rdao.validateRestraunt(restaurantName, id);

	                if (validRestraunt != null && !validRestraunt.isEmpty()) {
	                    Restraunt restraunt = validRestraunt.get(0);
	                    // Valid restaurant - set session attributes
	                    HttpSession session = req.getSession();
	                    session.setAttribute("restaurantName", restraunt.getName());
	                    session.setAttribute("restaurantId", restraunt.getId());

	                    // Log the session info for debugging purposes
	                    System.out.println("Restaurant Name: " + restaurantName);
	                    System.out.println("Restaurant ID: " + restrauntIdParam);

	                    // Redirect to the dashboard or menu page after successful login
	                    resp.sendRedirect("restaurant-dashboard.jsp");
	                } else {
	                    // Invalid restaurant - redirect back to login page with an error message
	                    req.setAttribute("errorMessage", "Invalid Restaurant Name or ID.");
	                    req.getRequestDispatcher("restaurant-login.jsp").forward(req, resp);
	                }
	            } catch (NumberFormatException e) {
	                // Handle the case where restrauntId is not a valid integer
	                req.setAttribute("errorMessage", "Invalid Restaurant ID format. Please enter a valid number.");
	                req.getRequestDispatcher("restaurant-login.jsp").forward(req, resp);
	            }
	        } else {
	            // If restrauntId is null or empty, show an error message
	            req.setAttribute("errorMessage", "Restaurant ID cannot be empty.");
	            req.getRequestDispatcher("restaurant-login.jsp").forward(req, resp);
	        }
	    }

}
