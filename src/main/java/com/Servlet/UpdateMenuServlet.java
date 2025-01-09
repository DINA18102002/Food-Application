package com.Servlet;

import java.io.IOException;

import com.foodapp.DAO.MenuDAO;
import com.foodapp.DAOImpl.MenuDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateMenuServlet
 */
public class UpdateMenuServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
             // Retrieve parameters
             String menuIdParam = request.getParameter("menuId");
             String priceParam = request.getParameter("price");

             // Validate that menuId and price are not empty or null
             if (menuIdParam == null || priceParam == null || priceParam.trim().isEmpty()) {
                 throw new IllegalArgumentException("Menu ID and price cannot be null or empty.");
             }

             // Parse menuId
             int menuId = Integer.parseInt(menuIdParam.trim()); // Menu ID should always be an integer

             // Validate and parse price
             int price = 0;

             // Only attempt to parse price if it's not an empty string
             if (priceParam.trim().isEmpty()) {
                 throw new IllegalArgumentException("Price must be a valid number.");
             }

             try {
                 price = Integer.parseInt(priceParam.trim());
             } catch (NumberFormatException e) {
                 throw new IllegalArgumentException("Price must be a valid integer.");
             }

             String name = request.getParameter("name");
             String category = request.getParameter("category");
             String description = request.getParameter("description");
             boolean isAvailable = request.getParameter("isAvailable") != null;

             // Update the menu item in the database
             MenuDAO menuDAO = new MenuDAOImpl();
             menuDAO.updateMenuItem(menuId, name, category, description, price, isAvailable);

             // Redirect to menu list after successful update
             response.sendRedirect("menuList.jsp");

         } catch (IllegalArgumentException e) {
             // Handle invalid input errors (empty fields or non-numeric price)
             e.printStackTrace();
             request.setAttribute("error", e.getMessage());
             request.getRequestDispatcher("updateMenu.jsp").forward(request, response);
         } catch (Exception e) {
             // Handle other unexpected errors
             e.printStackTrace();
             request.setAttribute("error", "An error occurred while updating the menu item. Please try again.");
             request.getRequestDispatcher("updateMenu.jsp").forward(request, response);
         }
     }
}
