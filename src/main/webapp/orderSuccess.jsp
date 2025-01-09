<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Orders, com.foodapp.model.OrderItems" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.foodapp.model.Menu" %>
<%@ page import="com.foodapp.DAOImpl.MenuDAOImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - Zomato</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/ordersuccess.css">
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
                Back to Home
            </button>
        </div>
    </nav>

    <div class="page-container">
        <!-- Success Animation -->
        <div class="success-animation">
            <i class="fas fa-check-circle"></i>
        </div>

        <div class="order-success-header">
            <h1><i class="fas fa-check-circle"></i> Order Placed Successfully!</h1>
            <p class="success-message">Thank you for your order. We'll have your delicious food ready soon!</p>
        </div>

        <!-- Order Progress -->
        <div class="order-progress">
            <div class="progress-step active">
                <i class="fas fa-check-circle"></i>
                <span>Order Confirmed</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-step">
                <i class="fas fa-utensils"></i>
                <span>Preparing</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-step">
                <i class="fas fa-motorcycle"></i>
                <span>On the Way</span>
            </div>
            <div class="progress-line"></div>
            <div class="progress-step">
                <i class="fas fa-home"></i>
                <span>Delivered</span>
            </div>
        </div>

        <div class="order-content">
            <!-- Order Details Card -->
            <div class="section-card order-details">
                <h2><i class="fas fa-receipt"></i> Order Details</h2>
                <div class="details-grid">
                    <div class="detail-item">
                        <span class="label">Order ID</span>
                        <span class="value">#<%= request.getAttribute("order") != null ? ((Orders)request.getAttribute("order")).getOrderId() : "N/A" %></span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Status</span>
                        <span class="value status-badge"><%= request.getAttribute("order") != null ? ((Orders)request.getAttribute("order")).getStatus() : "N/A" %></span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Payment Method</span>
                        <span class="value"><%= request.getAttribute("order") != null ? ((Orders)request.getAttribute("order")).getPaymentMode() : "N/A" %></span>
                    </div>
                    <div class="detail-item">
                        <span class="label">Total Amount</span>
                        <span class="value price">₹<%= request.getAttribute("order") != null ? ((Orders)request.getAttribute("order")).getTotalAmount() : 0 %></span>
                    </div>
                </div>
            </div>

            <!-- Delivery Estimate -->
            <div class="section-card delivery-estimate">
                <h2><i class="fas fa-clock"></i> Estimated Delivery Time</h2>
                <div class="time-display">
                    <span class="time">30-45</span>
                    <span class="unit">minutes</span>
                </div>
                <div class="delivery-progress">
                    <div class="progress-bar"></div>
                </div>
            </div>

            <!-- Order Items -->
            <div class="section-card">
                <h2><i class="fas fa-shopping-bag"></i> Order Items</h2>
                <div class="order-items">
                    <%
                    MenuDAOImpl menuDAO = new MenuDAOImpl();
                    if (request.getAttribute("orderItems") != null) {
                        Collection<OrderItems> items = (Collection<OrderItems>) request.getAttribute("orderItems");
                        for (OrderItems item : items) {
                            Menu menu = menuDAO.getMenuById(item.getMenuId());
                            String menuName = (menu != null) ? menu.getName() : "Unknown Item";
                    %>
                    <div class="order-item">
                        <div class="item-info">
                            <span class="item-name"><%= menuName %></span>
                            <span class="item-quantity">× <%= item.getQuantity() %></span>
                        </div>
                        <span class="item-price">₹<%= item.getItemTotal() %></span>
                    </div>
                    <%
                        }
                    }
                    %>
                </div>
            </div>

            <!-- Actions -->
            <div class="action-buttons">
                <a href="trackOrder.jsp?orderId=<%= request.getAttribute("order") != null ? ((Orders)request.getAttribute("order")).getOrderId() : 0 %>" class="primary-btn">
                    <i class="fas fa-map-marker-alt"></i>
                    Track Order
                </a>
                <a href="home.jsp" class="secondary-btn">
                    <i class="fas fa-utensils"></i>
                    Order More
                </a>
            </div>

            <!-- Support Section -->
            <div class="section-card support-section">
                <h2><i class="fas fa-headset"></i> Need Help?</h2>
                <p>If you have any questions about your order, our support team is here to help.</p>
                <div class="support-options">
                    <a href="#" class="support-option">
                        <i class="fas fa-phone"></i>
                        <span>Call Support</span>
                    </a>
                    <a href="#" class="support-option">
                        <i class="fas fa-comments"></i>
                        <span>Live Chat</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>