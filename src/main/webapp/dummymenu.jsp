<%@page import="java.util.ArrayList"%>
<%@page import="com.foodapp.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Zomato</title>
    <link rel=stylesheet href="css/menu.css">
    <style>
        /* Styles omitted for brevity */
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="home.jsp" class="app-name">Zomato</a>
        <button onclick="history.back()" class="go-back-btn">Go Back</button>
    </nav>

    <div class="container">
        <% 
            String restaurantName = (String) request.getAttribute("restrauntName");
            ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");

            if (menuList == null || menuList.isEmpty()) {
                out.println("<p style='color:red;'>Error: No menu items available. Please check the data source.</p>");
            }
 else {
        %>

        <h1>Menu for <%= restaurantName != null ? restaurantName : "Unknown Restaurant" %></h1>

        <% if (!menuList.isEmpty()) { %>
            <ul class="menu">
                <% for (Menu menu : menuList) { 
                    if (menu != null && menu.getName() != null && menu.getPrice() > 0) { %>
                        <li class="menu-item <%= !menu.isAvailable() ? "unavailable" : "" %>">
                            <div class="menu-img">
                                <img src="<%= menu.getImagePath() != null ? menu.getImagePath() : "default.jpg" %>" alt="<%= menu.getName() %>" />
                            </div>
                            <div class="menu-details">
                                <div class="menu-name"><%= menu.getName() %></div>
                                <div class="menu-price">₹<%= menu.getPrice() %></div>
                                <form action="CartServlet" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                                    <input type="hidden" name="name" value="<%= menu.getName() %>">
                                    <input type="hidden" name="price" value="<%= menu.getPrice() %>">
                                     <input type="hidden" name="restrauntId" value="<%=menu.getRestrauntId() %>">
                                    <input type="hidden" name="quantity" value="1"> <!-- Default quantity -->
                                    <button type="submit" class="add-cart-btn">Add to cart</button>
                                </form>
                            </div>
                        </li>
                    <% } else { %>
                        <li>Invalid menu item</li>
                    <% }
                } %>
            </ul>
        <% } else { %>
            <div class="empty-menu">
                <p>No menu items available for this restaurant.</p>
            </div>
        <% } } %>
    </div>
</body>
</html>
