<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.DAO.OrdersDAO, com.foodapp.DAOImpl.OrdersDAOImpl" %>
<%@ page import="com.foodapp.model.Orders" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Your Order</title>
    <link rel="stylesheet" href="css/trackorder.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar">
        <a href="home.jsp" class="go-back-btn">
            <i class="fas fa-arrow-left"></i> Back
        </a>
        <h1 class="navbar-title">Track Your Order</h1>
        <div class="nav-actions">
            <button class="help-btn"><i class="fas fa-question-circle"></i></button>
        </div>
    </nav>

    <div class="container">
        <div class="order-status-container">
            <h2>Order Status</h2>
            <div class="timeline">
                <div class="timeline-item active">
                    <div class="timeline-icon"><i class="fas fa-utensils"></i></div>
                    <div class="timeline-content">
                        <h3>Preparing</h3>
                        <p>Your order is being prepared</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-box"></i></div>
                    <div class="timeline-content">
                        <h3>Packed</h3>
                        <p>Your order has been packed</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-motorcycle"></i></div>
                    <div class="timeline-content">
                        <h3>On the Way</h3>
                        <p>Your order is on its way</p>
                    </div>
                </div>
                <div class="timeline-item">
                    <div class="timeline-icon"><i class="fas fa-home"></i></div>
                    <div class="timeline-content">
                        <h3>Delivered</h3>
                        <p>Your order has been delivered</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="delivery-info-container">
            <h2>Delivery Information</h2>
            <div class="delivery-time">
                <i class="fas fa-clock"></i>
                <p>Estimated delivery time: <strong>30-45 minutes</strong></p>
            </div>
            <div class="delivery-address">
                <i class="fas fa-map-marker-alt"></i>
                <p>Delivering to: <strong>Murali Krishna Pg, Old Madiwala,13th cross, Bengaluru</strong></p>
            </div>
        </div>

        <div class="map-container">
            <h2>Live Tracking</h2>
            <div id="map">
                <img src="images/track.jpg" alt="Live Tracking Map">
            </div>
        </div>

        <div class="delivery-partner-container">
            <h2>Your Delivery Partner</h2>
            <div class="delivery-partner-info">
                <img src="images/profile.jpg" alt="Delivery Partner" class="partner-image">
                <div class="partner-details">
                    <h3>John Doe</h3>
                    <p><i class="fas fa-star"></i> 4.8 (200+ deliveries)</p>
                    <p><i class="fas fa-motorcycle"></i> Red Scooter</p>
                    <button class="contact-btn"><i class="fas fa-phone"></i> Contact</button>
                </div>
            </div>
        </div>

        <div class="chat-container">
            <h2>Chat with Delivery Partner</h2>
            <div id="chat-box" class="chat-box">
                <div class="message partner-message">
                    <span class="message-text">Hello! I'm on my way with your order.</span>
                </div>
                <div class="message user-message">
                    <span class="message-text">Great, thanks for the update!</span>
                </div>
            </div>
            <div class="chat-input">
                <textarea id="message-input" class="message-input" placeholder="Type your message..."></textarea>
                <button id="send-btn" class="send-btn"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
    </div>

    <div class="floating-action-btn">
        <button class="support-btn"><i class="fas fa-headset"></i> Need Help?</button>
    </div>

    <script>
        // Simulating order status change
        let currentStatus = 0;
        const timelineItems = document.querySelectorAll('.timeline-item');
        
        function updateStatus() {
            if (currentStatus < timelineItems.length) {
                timelineItems[currentStatus].classList.add('active');
                currentStatus++;
                setTimeout(updateStatus, 5000); // Update every 5 seconds
            }
        }
        
        updateStatus();

        // Chat functionality
        document.getElementById('send-btn').addEventListener('click', function() {
            const messageInput = document.getElementById('message-input');
            const messageText = messageInput.value.trim();

            if (messageText !== "") {
                const chatBox = document.getElementById('chat-box');
                const newMessage = document.createElement('div');
                newMessage.classList.add('message', 'user-message');
                newMessage.innerHTML = `<span class="message-text">${messageText}</span>`;
                chatBox.appendChild(newMessage);
                messageInput.value = "";
                chatBox.scrollTop = chatBox.scrollHeight;
            }
        });
    </script>
</body>
</html>

