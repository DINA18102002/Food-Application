<%@page import="java.util.ArrayList"%>
<%@page import="com.foodapp.model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Zomato</title>
    <link rel="stylesheet" href="css/menu.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="js/menu.js" defer></script>
</head>
<body>
    <header class="header">
        <nav class="navbar container">
            <a href="home.jsp" class="logo">Zomato</a>
            <div class="nav-links">
                <a href="home.jsp">Home</a>
                <a href="cart.jsp">Cart</a>
                <a href="profile.jsp">Profile</a>
            </div>
            <button onclick="history.back()" class="btn btn-secondary">Go Back</button>
        </nav>
    </header>

    <main class="container">
        <% 
            String restaurantName = (String) request.getAttribute("restrauntName");
            ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");

            if (menuList == null || menuList.isEmpty()) {
        %>
            <div class="error-message">
                <p>Error: No menu items available. Please check the data source.</p>
            </div>
        <% } else { %>
            <section class="restaurant-info">
                <h1><%= restaurantName != null ? restaurantName : "Unknown Restaurant" %></h1>
                <div class="restaurant-details">
                    <span class="rating">4.5 ★</span>
                    <span class="cuisine">Indian, Chinese, Italian</span>
                    <span class="timing">Open: 11:00 AM - 11:00 PM</span>
                </div>
            </section>

            <section class="menu-categories">
                <button class="category-btn active" data-category="all">All</button>
                <button class="category-btn" data-category="starters">Starters</button>
                <button class="category-btn" data-category="main-course">Main Course</button>
                <button class="category-btn" data-category="desserts">Desserts</button>
                <button class="category-btn" data-category="beverages">Beverages</button>
            </section>

            <section class="menu-list">
                <% if (!menuList.isEmpty()) { %>
                    <ul class="menu">
                        <% for (Menu menu : menuList) { 
                            if (menu != null && menu.getName() != null && menu.getPrice() > 0) { %>
                                <li class="menu-item <%= !menu.isAvailable() ? "unavailable" : "" %>" data-category="<%= menu.getCategory() %>">
                                    <div class="menu-img">
                                        <img src="<%= menu.getImagePath() != null ? menu.getImagePath() : "images/default-dish.jpg" %>" alt="<%= menu.getName() %>" loading="lazy" />
                                    </div>
                                    <div class="menu-details">
                                        <div class="menu-name-price">
                                            <h3 class="menu-name"><%= menu.getName() %></h3>
                                            <div class="menu-price">₹<%= menu.getPrice() %></div>
                                        </div>
                                        <p class="menu-description"><%= menu.getDescription() != null ? menu.getDescription() : "No description available" %></p>
                                        <div class="menu-actions">
                                            <form action="CartServlet" method="post" class="add-to-cart-form">
                                                <input type="hidden" name="action" value="add">
                                                <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                                                <input type="hidden" name="name" value="<%= menu.getName() %>">
                                                <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                                                <input type="hidden" name="restrauntId" value="<%= menu.getRestrauntId() %>">
                                                <div class="quantity-selector">
                                                    <button type="button" class="quantity-btn minus">-</button>
                                                    <input type="number" name="quantity" value="1" min="1" max="10" class="quantity-input">
                                                    <button type="button" class="quantity-btn plus">+</button>
                                                </div>
                                                <button type="submit" class="btn btn-primary add-cart-btn" <%= !menu.isAvailable() ? "disabled" : "" %>>
                                                    <%= menu.isAvailable() ? "Add to cart" : "Not available" %>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </li>
                            <% } %>
                        <% } %>
                    </ul>
                <% } else { %>
                    <div class="empty-menu">
                        <p>No menu items available for this restaurant.</p>
                    </div>
                <% } %>
            </section>
        <% } %>
    </main>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Zomato. All rights reserved.</p>
            <nav class="footer-nav">
                <a href="about.jsp">About Us</a>
                <a href="contact.jsp">Contact</a>
                <a href="terms.jsp">Terms of Service</a>
                <a href="privacy.jsp">Privacy Policy</a>
            </nav>
        </div>
    </footer>
</body>
</html>
