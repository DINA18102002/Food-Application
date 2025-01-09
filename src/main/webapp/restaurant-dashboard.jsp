<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Menu" %>
<%@ page import="com.foodapp.DAOImpl.MenuDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Dashboard - Zomato</title>
    <link rel="stylesheet" href="css/restrauntdashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

<% 
    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
    String restaurantName = (String) session.getAttribute("restaurantName");

    if (restaurantId == null || restaurantName == null) {
        response.sendRedirect("yourrestrauntlogin.jsp?error=session_expired");
        return;
    }
%>

<!-- Navbar -->
<nav class="navbar">
    <a href="index.jsp" class="go-back">&#8592;</a>
    <span class="app-name">Zomato Partner</span>
    <a href="restaurant-details.jsp" class="profile">
        <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=400" alt="Restaurant Profile">
    </a>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <h1>Welcome to <%= restaurantName %></h1>
    <div class="options">
        <a href="addMenu.jsp" class="option-box">
            Add New Menu Item
        </a>
        <a href="delivery-partner.jsp" class="option-box">
            Manage Delivery Partners
        </a>
        <a href="add-offers.jsp" class="option-box">
            Create Special Offers
        </a>
        <a href="analytics.jsp" class="option-box">
            View Analytics
        </a>
    </div>
</section>

<!-- Menu Section -->
<section class="menu-section">
    <h2>Current Menu</h2>
    <div class="menu-items">
        <% 
            MenuDAOImpl menuDAO = new MenuDAOImpl();
            List<Menu> menuList = menuDAO.fetchMenuByRestraunt(restaurantId);
            
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu item : menuList) { 
        %>
            <div class="menu-item">
                <img src="<%= item.getImagePath() %>" alt="<%= item.getName() %>" class="menu-item-image">
                <div class="menu-item-details">
                    <h3><%= item.getName() %></h3>
                    <p class="price">₹<%= item.getPrice() %></p>
                    <p><%= item.getDescription() %></p>
                    <p><strong>Category:</strong> <%= item.getCategory() %></p>
                    <div class="status <%= item.isAvailable() ? "available" : "unavailable" %>">
                        <%= item.isAvailable() ? "Available" : "Not Available" %>
                    </div>
                </div>
                <div class="links-container">
                    <a href="updateMenu.jsp?id=<%= item.getMenuId() %>" class="update-link">Update</a>
                    <a href="deleteMenu.jsp?id=<%= item.getMenuId() %>" 
                       class="delete-link"
                       onclick="return confirm('Are you sure you want to delete this item?')">
                        Delete
                    </a>
                </div>
            </div>
        <% 
                }
            } else {
        %>
            <div class="empty-state">
                <p>No menu items found. Start by adding your first menu item!</p>
                <a href="addMenu.jsp" class="option-box">Add Menu Item</a>
            </div>
        <% 
            }
        %>
    </div>
</section>

<!-- Quick Stats Section -->
<section class="stats-section">
    <h2>Today's Overview</h2>
    <div class="stats-grid">
        <div class="stat-card">
            <h3>Total Orders</h3>
            <p class="stat-number">25</p>
            <p class="stat-trend positive">↑ 15%</p>
        </div>
        <div class="stat-card">
            <h3>Revenue</h3>
            <p class="stat-number">₹12,450</p>
            <p class="stat-trend positive">↑ 8%</p>
        </div>
        <div class="stat-card">
            <h3>Active Items</h3>
            <p class="stat-number"><%= menuList != null ? menuList.size() : 0 %></p>
        </div>
        <div class="stat-card">
            <h3>Rating</h3>
            <p class="stat-number">4.5</p>
            <p class="stat-trend positive">↑ 0.2</p>
        </div>
    </div>
</section>

<script>
    // Add fade-in animation to menu items
    document.addEventListener('DOMContentLoaded', function() {
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach((item, index) => {
            item.style.animationDelay = `${index * 0.2}s`;
        });
    });

    // Confirm delete action
    function confirmDelete() {
        return confirm('Are you sure you want to delete this menu item?');
    }
</script>

</body>
</html>