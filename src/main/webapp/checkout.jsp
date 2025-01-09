<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="com.foodapp.DAO.CartDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Zomato</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/checkout.css">
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
                Back to Cart
            </button>
        </div>
    </nav>

    <div class="page-container">
        <div class="checkout-header">
            <h1><i class="fas fa-shopping-bag"></i> Checkout</h1>
            <p class="checkout-steps">
                <span class="step completed"><i class="fas fa-shopping-cart"></i> Cart</span>
                <span class="step-divider">→</span>
                <span class="step active"><i class="fas fa-credit-card"></i> Payment</span>
                <span class="step-divider">→</span>
                <span class="step"><i class="fas fa-check-circle"></i> Confirmation</span>
            </p>
        </div>

        <div class="checkout-content">
            <%
            CartDAO cartDAO = (CartDAO) session.getAttribute("cart");
            if (cartDAO == null || cartDAO.getItems().isEmpty()) {
            %>
                <div class="empty-cart">
                    <i class="fas fa-shopping-basket empty-cart-icon"></i>
                    <h2>Your cart is empty</h2>
                    <p>Please add items to your cart before proceeding to checkout</p>
                    <a href="home.jsp" class="browse-btn">
                        <i class="fas fa-utensils"></i>
                        Browse Restaurants
                    </a>
                </div>
            <%
            } else {
                int totalAmount = 0;
            %>
                <div class="checkout-grid">
                    <!-- Left Column - Order Details -->
                    <div class="order-details">
                        <div class="section-card">
                            <h2><i class="fas fa-receipt"></i> Order Summary</h2>
                            <div class="order-items">
                                <% 
                                for (Map.Entry<Integer, CartItem> entry : cartDAO.getItems().entrySet()) {
                                    CartItem item = entry.getValue();
                                    totalAmount += item.getTotalPrice();
                                %>
                                <div class="order-item">
                                    <div class="item-info">
                                        <span class="item-name"><%= item.getName() %></span>
                                        <span class="item-quantity">× <%= item.getQuantity() %></span>
                                    </div>
                                    <span class="item-price">₹<%= item.getTotalPrice() %></span>
                                </div>
                                <% } %>
                            </div>
                            
                            <div class="price-summary">
                                <div class="price-row">
                                    <span>Subtotal</span>
                                    <span>₹<%= totalAmount %></span>
                                </div>
                                <div class="price-row">
                                    <span>Delivery Fee</span>
                                    <span>₹40</span>
                                </div>
                                <div class="price-row">
                                    <span>Platform Fee</span>
                                    <span>₹20</span>
                                </div>
                                <div class="price-row total">
                                    <span>Total</span>
                                    <span>₹<%= totalAmount + 60 %></span>
                                </div>
                            </div>
                        </div>

                        <!-- Delivery Time Estimate -->
                        <div class="section-card delivery-estimate">
                            <h3><i class="fas fa-clock"></i> Estimated Delivery Time</h3>
                            <p>30-45 minutes</p>
                            <div class="delivery-progress">
                                <div class="progress-bar"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column - Delivery & Payment -->
                    <div class="payment-section">
                        <form action="CheckoutServlet" method="post" class="checkout-form">
                            <!-- Delivery Details -->
                            <div class="section-card">
                                <h2><i class="fas fa-map-marker-alt"></i> Delivery Details</h2>
                                
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" id="name" name="name" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="address">Delivery Address</label>
                                    <textarea id="address" name="address" rows="3" required></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="instructions">Delivery Instructions (Optional)</label>
                                    <textarea id="instructions" name="instructions" rows="2" placeholder="Any specific instructions for delivery?"></textarea>
                                </div>
                            </div>

                            <!-- Payment Method -->
                            <div class="section-card">
                                <h2><i class="fas fa-wallet"></i> Payment Method</h2>
                                
                                <div class="payment-options">
                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="COD" checked>
                                        <span class="option-content">
                                            <i class="fas fa-money-bill-wave"></i>
                                            <span>Cash on Delivery</span>
                                        </span>
                                    </label>
                                    
                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="UPI">
                                        <span class="option-content">
                                            <i class="fas fa-mobile-alt"></i>
                                            <span>UPI</span>
                                        </span>
                                    </label>
                                    
                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="Card">
                                        <span class="option-content">
                                            <i class="fas fa-credit-card"></i>
                                            <span>Credit/Debit Card</span>
                                        </span>
                                    </label>
                                </div>
                            </div>

                            <!-- Promo Code -->
                            <div class="section-card promo-section">
                                <div class="promo-input">
                                    <input type="text" placeholder="Enter promo code" id="promoCode" name="promoCode">
                                    <button type="button" class="apply-btn">Apply</button>
                                </div>
                                <div class="available-promos">
                                    <p><i class="fas fa-tag"></i> WELCOME50 - 50% off up to ₹100</p>
                                    <p><i class="fas fa-tag"></i> ZOMATO20 - Flat ₹20 off</p>
                                </div>
                            </div>

                            <button type="submit" class="place-order-btn">
                                <span>Place Order • ₹<%= totalAmount + 60 %></span>
                                <i class="fas fa-arrow-right"></i>
                            </button>
                        </form>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>