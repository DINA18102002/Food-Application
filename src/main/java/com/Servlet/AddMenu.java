package com.Servlet;

import java.io.IOException;

import com.foodapp.DAO.MenuDAO;
import com.foodapp.DAOImpl.MenuDAOImpl;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddMenu extends HttpServlet {

	
	private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        menuDAO = new MenuDAOImpl(); // Initialize the DAO
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	 String name = request.getParameter("name");
         String category = request.getParameter("category");
         String description = request.getParameter("description");
         String priceStr = request.getParameter("price");
         String isAvailableStr = request.getParameter("isavailable");
         String restaurantIdStr = request.getParameter("restaurantId");

         // Initialize default values in case of missing or invalid input
         int price = 0;
         boolean isAvailable = false;
         int restaurantId = 0;

         // Handling null and invalid values
         if (restaurantIdStr != null && !restaurantIdStr.trim().isEmpty()) {
             try {
                 restaurantId = Integer.parseInt(restaurantIdStr);
             } catch (NumberFormatException e) {
                 // Handle invalid restaurantId
                 request.setAttribute("error", "Invalid restaurantId: Cannot parse null string.");
                 request.getRequestDispatcher("addMenu.jsp").forward(request, response);
                 return;
             }
         } else {
             request.setAttribute("error", "Restaurant ID is missing.");
             request.getRequestDispatcher("addMenu.jsp").forward(request, response);
             return;
         }

         if (priceStr != null && !priceStr.trim().isEmpty()) {
             try {
                 price = Integer.parseInt(priceStr);
             } catch (NumberFormatException e) {
                 // Handle invalid price
                 request.setAttribute("error", "Invalid price: Cannot parse null string.");
                 request.getRequestDispatcher("addMenu.jsp").forward(request, response);
                 return;
             }
         } else {
             request.setAttribute("error", "Price is missing.");
             request.getRequestDispatcher("addMenu.jsp").forward(request, response);
             return;
         }

         if (isAvailableStr != null && !isAvailableStr.trim().isEmpty()) {
             isAvailable = Boolean.parseBoolean(isAvailableStr);
         }

         if (name == null || name.trim().isEmpty() || category == null || category.trim().isEmpty() || description == null || description.trim().isEmpty()) {
             request.setAttribute("error", "All fields must be filled.");
             request.getRequestDispatcher("addMenu.jsp").forward(request, response);
             return;
         }

         // Create Menu object
         Menu menu = new Menu();
         menu.setName(name);
         menu.setCategory(category);
         menu.setDescription(description);
         menu.setPrice(price);
         menu.setAvailable(isAvailable);
         menu.setRestrauntId(restaurantId);

         // Add menu to database
         MenuDAOImpl menuDAO = new MenuDAOImpl();
         boolean result = menuDAO.addMenu(menu);

         if (result) {
             response.sendRedirect("menuList.jsp?success=Menu added successfully.");
         } else {
             request.setAttribute("error", "Failed to add menu item.");
             request.getRequestDispatcher("addMenu.jsp").forward(request, response);
         }
     }
}
