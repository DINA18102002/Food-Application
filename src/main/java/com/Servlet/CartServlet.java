package com.Servlet;

import java.io.IOException;

import com.foodapp.DAO.CartDAO;
import com.foodapp.DAO.OrderItemsDAO;
import com.foodapp.DAOImpl.CartDAOImpl;
import com.foodapp.DAOImpl.OrderItemsDAOImpl;
import com.foodapp.model.CartItem;
import com.foodapp.model.OrderItems;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;

    @Override
    public void init() {
        // This method is not necessary anymore for session management
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Get the session from the request
        HttpSession session = request.getSession();

        if (action != null) {
            try {
                switch (action) {
                    case "add":
                        addItemToCart(request, response, session);
                        break;
                    case "update":
                        updateItemQuantity(request, response, session);
                        break;
                    case "remove":
                        removeItemFromCart(request, response, session);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                }
            } catch (Exception e) {
                response.getWriter().println("Error processing request: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing");
        }
    }

//    private void addItemToCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
//        try {
//            String itemIdStr = request.getParameter("itemId");
//            String itemName = request.getParameter("name");
//            String itemPriceStr = request.getParameter("price");
//            String itemQuantityStr = request.getParameter("quantity");
//            String restaurantIdStr = request.getParameter("restrauntId"); // Make sure it's restaurantId
//
//            int itemId = Integer.parseInt(itemIdStr);
//            int itemPrice = Integer.parseInt(itemPriceStr);  // Convert price to int
//            int quantity = Integer.parseInt(itemQuantityStr);
//            int restaurantId = Integer.parseInt(restaurantIdStr); // Correctly parse restaurantId
//
//            // Ensure valid input
//            if (itemPrice <= 0 || quantity <= 0 || restaurantId <= 0 || itemId <= 0) {
//                throw new IllegalArgumentException("Invalid price, quantity, or restaurantId  or itemId");
//            }
//
//            // If cart doesn't exist in session, create a new cart
//            if (session.getAttribute("cart") == null) {
//                cartDAO = new CartDAOImpl();
//                session.setAttribute("cart", cartDAO);
//            } else {
//                cartDAO = (CartDAO) session.getAttribute("cart");
//            }
//
//            // Create CartItem and add it to the cart
//            CartItem cartItem = new CartItem(itemId, itemName, itemPrice, quantity, restaurantId);  // Using restaurantId
//            cartDAO.addItem(cartItem);
//
//            response.sendRedirect("cart.jsp");
//
//        } catch (NumberFormatException e) {
//            response.getWriter().println("Invalid input: " + e.getMessage());
//        }
//    }

    
    private void addItemToCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        try {
            String itemIdStr = request.getParameter("itemId");
            String itemName = request.getParameter("name");
            String itemPriceStr = request.getParameter("price");
            String itemQuantityStr = request.getParameter("quantity");
            String restaurantIdStr = request.getParameter("restrauntId");

            // Log all parameters to verify values
            System.out.println("Received itemId: " + itemIdStr);
            System.out.println("Received itemName: " + itemName);
            System.out.println("Received itemPrice: " + itemPriceStr);
            System.out.println("Received itemQuantity: " + itemQuantityStr);
            System.out.println("Received restaurantId: " + restaurantIdStr);

            // Convert parameters to integers
            int itemId = Integer.parseInt(itemIdStr);
            int itemPrice = Integer.parseInt(itemPriceStr);  // Convert price to int
            int quantity = Integer.parseInt(itemQuantityStr);
            int restaurantId = Integer.parseInt(restaurantIdStr); // Correctly parse restaurantId

            // Log to check values before creating CartItem
            System.out.println("Converted values - itemId: " + itemId + ", itemPrice: " + itemPrice + ", quantity: " + quantity + ", restaurantId: " + restaurantId);

            // Ensure valid input
            if (itemPrice <= 0 || quantity <= 0 || restaurantId <= 0 || itemId <= 0) {
                throw new IllegalArgumentException("Invalid price, quantity, restaurantId, or itemId");
            }

            // If cart doesn't exist in session, create a new cart
            if (session.getAttribute("cart") == null) {
                cartDAO = new CartDAOImpl();
                session.setAttribute("cart", cartDAO);
            } else {
                cartDAO = (CartDAO) session.getAttribute("cart");
            }

            // Create CartItem and add it to the cart
            CartItem cartItem = new CartItem(itemId, itemName, itemPrice, quantity, restaurantId);  // Using restaurantId
            System.out.println("Created CartItem: " + cartItem);

            cartDAO.addItem(cartItem);

            response.sendRedirect("cart.jsp");

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid input: " + e.getMessage());
        }
    }

    
    
    
    
    

    private void updateItemQuantity(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        try {
            if (session.getAttribute("cart") == null) {
                cartDAO = new CartDAOImpl();
                session.setAttribute("cart", cartDAO);
            } else {
                cartDAO = (CartDAO) session.getAttribute("cart");
            }

            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (quantity <= 0) {
                cartDAO.removeItem(itemId); // Remove item if quantity is 0
            } else {
                cartDAO.updateItems(itemId, quantity); // Update if > 0
            }

            response.sendRedirect("cart.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        }
    }


    private void removeItemFromCart(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        try {
            if (session.getAttribute("cart") == null) {
                cartDAO = new CartDAOImpl();
                session.setAttribute("cart", cartDAO);
            } else {
                cartDAO = (CartDAO) session.getAttribute("cart");
            }

            int itemId = Integer.parseInt(request.getParameter("itemId"));
            cartDAO.removeItem(itemId);

            response.sendRedirect("cart.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        }
    }

    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
