package com.Servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.foodapp.DAO.CartDAO;
import com.foodapp.DAO.OrderHistoryDAO;
import com.foodapp.DAO.OrderItemsDAO;
import com.foodapp.DAO.OrdersDAO;
import com.foodapp.DAO.UserDAO;
import com.foodapp.DAOImpl.OrderHistoryDAOImpl;
import com.foodapp.DAOImpl.OrderItemsDAOImpl;
import com.foodapp.DAOImpl.OrdersDAOImpl;
import com.foodapp.DAOImpl.UserDAOImpl;
import com.foodapp.model.CartItem;
import com.foodapp.model.OrderHistory;
import com.foodapp.model.OrderItems;
import com.foodapp.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(CheckoutServlet.class.getName());
    private OrdersDAO ordersDAO = new OrdersDAOImpl();
    private OrderItemsDAO orderItemsDAO = new OrderItemsDAOImpl();
    private OrderHistoryDAO orderHistoryDAO = new OrderHistoryDAOImpl(); 
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        
        
        String email = (String) session.getAttribute("email");
        if (email == null) {
            LOGGER.log(Level.WARNING, "User not logged in. Redirecting to login page.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            UserDAO userDAO = new UserDAOImpl();
            int userId = userDAO.getUserIdByEmail(email);

            if (userId <= 0) {
                LOGGER.log(Level.WARNING, "Invalid user ID. Redirecting to login page.");
                response.sendRedirect("login.jsp");
                return;
            }

            LOGGER.log(Level.INFO, "User ID fetched successfully: {0}", userId);
            session.setAttribute("userId", userId);

            CartDAO cartDAO = (CartDAO) session.getAttribute("cart");
            if (cartDAO == null || cartDAO.getItems().isEmpty()) {
                LOGGER.log(Level.WARNING, "Cart is empty or null. Redirecting to menu page.");
                response.sendRedirect("menu.jsp");
                return;
            }

            // Validate Cart and Fetch Restaurant ID
            int restaurantId = validateCartAndFetchRestaurantId(cartDAO);
            if (restaurantId <= 0 || !ordersDAO.isValidRestrauntId(restaurantId)) {
                LOGGER.log(Level.SEVERE, "Invalid or mismatched restaurant ID: {0}", restaurantId);
                response.sendRedirect("menu.jsp");
                return;
            }

            // Calculate total amount
            int totalAmount = cartDAO.getItems().values().stream()
                .mapToInt(CartItem::getTotalPrice).sum();

            // Create Order
            Orders order = new Orders(0, userId, restaurantId, getCurrentDate(), totalAmount, "Pending", "COD");
            int orderId = ordersDAO.insert(order);

            if (orderId > 0) {
                LOGGER.log(Level.INFO, "Order inserted successfully. Order ID: {0}", orderId);
                
                // Update OrderHistory
                OrderHistory orderHistory = new OrderHistory(0, orderId, userId, totalAmount, "Pending", getCurrentDate());
                int orderHistoryId = orderHistoryDAO.insert(orderHistory);
                
                if (orderHistoryId > 0) {
                    LOGGER.log(Level.INFO, "Order history inserted successfully. Order History ID: {0}", orderHistoryId);
                } else {
                    LOGGER.log(Level.SEVERE, "Failed to insert order history.");
                }
                
                processOrderItems(cartDAO, orderId);
                cartDAO.clear();
                LOGGER.log(Level.INFO, "Cart cleared successfully.");

                // Fetch order details and order items
                order = ordersDAO.getOrderById(orderId);
                Collection<OrderItems> orderItems = orderItemsDAO.getOrderItemsForOrder(orderId);

                // Set attributes for the JSP
                request.setAttribute("order", order);
                request.setAttribute("orderItems", orderItems);
                
                request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
            } else {
                LOGGER.log(Level.SEVERE, "Failed to insert order. Redirecting to menu page.");
                response.sendRedirect("menu.jsp");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error during checkout process.", e);
            response.sendRedirect("error.jsp");
        }
    }

    // Validate Cart and Fetch Restaurant ID
    private int validateCartAndFetchRestaurantId(CartDAO cartDAO) {
        int restaurantId = -1;

        for (CartItem item : cartDAO.getItems().values()) {
            LOGGER.log(Level.INFO, "Cart item details: MenuID={0}, RestaurantID={1}",
                    new Object[]{item.getMenuId(), item.getRestrauntId()});

            if (item.getRestrauntId() <= 0) {
                LOGGER.log(Level.SEVERE, "Invalid restaurant ID found in cart item: {0}", item.getRestrauntId());
                return -1;
            }

            if (restaurantId == -1) {
                restaurantId = item.getRestrauntId();
            } else if (restaurantId != item.getRestrauntId()) {
                LOGGER.log(Level.SEVERE, "Cart contains items from multiple restaurants.");
                return -1;
            }
        }
        return restaurantId;
    }

//    // Process the items in the cart and add them to the order
//    private void processOrderItems(CartDAO cartDAO, int orderId) {
//        for (CartItem item : cartDAO.getItems().values()) {
//            OrderItems orderItem = new OrderItems(0, orderId, item.getMenuId(), item.getQuantity(), item.getTotalPrice());
//            int isItemInserted = orderItemsDAO.insert(orderItem);
//
//            if (isItemInserted > 0) {
//                LOGGER.log(Level.INFO, "Order item inserted successfully: {0}", orderItem);
//            } else {
//                LOGGER.log(Level.WARNING, "Failed to insert order item: {0}", orderItem);
//            }
//        }
//    }
    
    private void processOrderItems(CartDAO cartDAO, int orderId) {
        if (orderId <= 0) {
            LOGGER.log(Level.SEVERE, "Invalid orderId: {0}", orderId);
            return; // Avoid processing if orderId is invalid
        }

        for (CartItem item : cartDAO.getItems().values()) {
            if (item.getMenuId() <= 0) {
                LOGGER.log(Level.WARNING, "Invalid menuId in cart item: {0}", item);
                continue; // Skip invalid items
            }

            // Create OrderItems
            OrderItems orderItem = new OrderItems(0, orderId, item.getMenuId(), item.getQuantity(), item.getTotalPrice());
            int isItemInserted = orderItemsDAO.insert(orderItem);

            if (isItemInserted > 0) {
                LOGGER.log(Level.INFO, "Order item inserted successfully: {0}", orderItem);
            } else {
                LOGGER.log(Level.WARNING, "Failed to insert order item: {0}", orderItem);
            }
        }
    }


    // Get current date in string format
    private String getCurrentDate() {
        return java.time.LocalDateTime.now().toString();
    }
    
    
    
    
    
}
