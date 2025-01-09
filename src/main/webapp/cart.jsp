<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="com.foodapp.DAO.CartDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Zomato</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="nav-left">
            <a href="home.jsp" class="app-name">Zomato</a>
        </div>
        <div class="nav-right">
            <button onclick="history.back()" class="back-btn">
                <i class="fas fa-arrow-left"></i>
                Add More Items
            </button>
        </div>
    </nav>

    <div class="page-container">
        <div class="cart-header">
            <h1><i class="fas fa-shopping-cart"></i> Your Cart</h1>
            <p class="cart-subtitle">Review your items before checkout</p>
        </div>

        <div class="cart-container">
            <%
            CartDAO cartDAO = (CartDAO) session.getAttribute("cart");

            if (cartDAO == null || cartDAO.getItems().isEmpty()) {
            %>
                <div class="empty-cart">
                    <i class="fas fa-shopping-basket empty-cart-icon"></i>
                    <h2>Your cart is empty</h2>
                    <p>Looks like you haven't added anything to your cart yet</p>
                    <a href="home.jsp" class="browse-btn">
                        <i class="fas fa-utensils"></i>
                        Browse Restaurants
                    </a>
                </div>
            <%
            } else {
                int totalAmount = 0;
                int itemCount = 0;
                for (Map.Entry<Integer, CartItem> entry : cartDAO.getItems().entrySet()) {
                    CartItem item = entry.getValue();
                    totalAmount += item.getTotalPrice();
                    itemCount++;
            %>
                <div class="cart-item">
                    <div class="item-details">
                        <div class="item-main">
                            <h3><%= item.getName() %></h3>
                            <div class="price-tag">₹<%= item.getPrice() %></div>
                        </div>
                        <div class="item-controls">
                            <div class="quantity-controls">
                                <form action="CartServlet" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                                    <button type="submit" class="qty-btn" <%= item.getQuantity() <= 1 ? "disabled" : "" %>>
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </form>
                                
                                <span class="quantity"><%= item.getQuantity() %></span>
                                
                                <form action="CartServlet" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                    <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                                    <button type="submit" class="qty-btn">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </form>
                            </div>
                            
                            <div class="item-total">
                                <span class="total-label">Item Total:</span>
                                <span class="total-amount">₹<%= item.getTotalPrice() %></span>
                            </div>

                            <form action="CartServlet" method="post" class="remove-form">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <button type="submit" class="remove-btn">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
                <div class="cart-summary">
                    <div class="summary-header">
                        <h2>Order Summary</h2>
                        <span class="item-count"><%= itemCount %> items</span>
                    </div>
                    
                    <div class="summary-details">
                        <div class="summary-row">
                            <span>Items Total</span>
                            <span>₹<%= totalAmount %></span>
                        </div>
                        <div class="summary-row">
                            <span>Delivery Fee</span>
                            <span>₹40</span>
                        </div>
                        <div class="summary-row">
                            <span>Platform Fee</span>
                            <span>₹20</span>
                        </div>
                        <div class="summary-row total">
                            <span>Grand Total</span>
                            <span>₹<%= totalAmount + 60 %></span>
                        </div>
                    </div>

                    <a href="checkout.jsp" class="checkout-btn">
                        <span>Proceed to Checkout</span>
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>

                <div class="savings-banner">
                    <i class="fas fa-tag"></i>
                    <p>Save extra ₹50 with WELCOME50 code</p>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>