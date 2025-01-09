<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.foodapp.model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Zomato</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif;
            background-color: #f8f8f8;
            color: #333;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #e23744;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .go-back {
            background-color: white;
            color: #e23744;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
        }

        /* Main Container Styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 2rem;
        }

        .page-title {
            color: #e23744;
            text-align: center;
            font-size: 2rem;
            margin-bottom: 2rem;
            grid-column: 1 / -1;
        }

        /* Menu Grid Styles */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .menu-item {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .menu-item-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background-color: #f0f0f0;
        }

        .menu-item-details {
            padding: 1rem;
        }

        .menu-item-name {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .menu-item-price {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }

        /* Cart Controls Styles */
        .cart-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .cart-btn {
            background-color: #e23744;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            min-width: 40px;
        }

        .cart-btn:hover {
            background-color: #d32f2f;
        }

        .cart-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .cart-quantity {
            font-weight: 500;
            min-width: 30px;
            text-align: center;
        }

        /* Cart Section Styles */
        .cart-section {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            position: sticky;
            top: 2rem;
            height: fit-content;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .cart-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .cart-items {
            margin-bottom: 1.5rem;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #eee;
        }

        .cart-item-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .cart-total {
            display: flex;
            justify-content: space-between;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px solid #eee;
        }

        .checkout-btn {
            width: 100%;
            background-color: #e23744;
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 1rem;
        }

        .checkout-btn:hover {
            background-color: #d32f2f;
        }

        .empty-cart {
            text-align: center;
            color: #666;
            padding: 2rem 0;
        }

        .unavailable {
            opacity: 0.6;
            pointer-events: none;
        }

        .unavailable-text {
            color: #e23744;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }
            
            .cart-section {
                position: static;
                margin-top: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <a href="home.jsp" class="brand">Zomato</a>
        <button onclick="history.back()" class="go-back">Go Back</button>
    </nav>

    <!-- Main Container -->
    <div class="container">
     <% 
        String restrauntName = (String) request.getAttribute("restrauntName");
        ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");
        %>
    
        <h1 class="page-title">Menu for <%= request.getAttribute("restaurantName") != null ? request.getAttribute("restaurantName") : "Restaurant Name" %></h1>

        <!-- Menu Grid -->
        <div class="menu-grid">
            <% 
           
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu menu : menuList) {
            %>
                <div class="menu-item <%= !menu.isAvailable() ? "unavailable" : "" %>" data-id="<%= menu.getName() %>">
                    <img src="<%= menu.getImagePath() %>" alt="<%= menu.getName() %>" class="menu-item-image">
                    <div class="menu-item-details">
                        <h3 class="menu-item-name"><%= menu.getName() %></h3>
                        <div class="menu-item-price">₹<%= menu.getPrice() %></div>
                        <% if (menu.isAvailable()) { %>
                            <div class="cart-controls" id="controls-<%= menu.getMenuId() %>">
                                <button class="cart-btn" onclick="addToCart('<%= menu.getMenuId() %>', '<%= menu.getName() %>', <%= menu.getPrice() %>)">
                                    Add to Cart
                                </button>
                            </div>
                        <% } else { %>
                            <div class="unavailable-text">Unavailable</div>
                        <% } %>
                    </div>
                </div>
            <%
                }
            } else {
            %>
                <div>No menu items available</div>
            <%
            }
            %>
        </div>

        <!-- Cart Section -->
        <div class="cart-section">
            <h2 class="cart-title">My Cart</h2>
            <div id="cart-items" class="cart-items">
                <div class="empty-cart">Your cart is empty</div>
            </div>
            <div class="cart-total" style="display: none;">
                <span>Total:</span>
                <span>₹<span id="cart-total-amount">0</span></span>
            </div>
            <button class="checkout-btn" onclick="checkout()" style="display: none;">
                Proceed to Checkout
            </button>
        </div>
    </div>

    <script>
        // Cart state management
        let cart = {};

        function addToCart(id, name, price) {
            if (!cart[id]) {
                cart[id] = {
                    id: id,
                    name: name,
                    price: price,
                    quantity: 0
                };
            }
            cart[id].quantity++;
            updateCartDisplay();
            updateItemControls(id);
        }

        function removeFromCart(id) {
            if (cart[id] && cart[id].quantity > 0) {
                cart[id].quantity--;
                if (cart[id].quantity === 0) {
                    delete cart[id];
                }
                updateCartDisplay();
                updateItemControls(id);
            }
        }

        function updateItemControls(id) {
            const controlsContainer = document.getElementById(`controls-${id}`);
            if (cart[id] && cart[id].quantity > 0) {
                controlsContainer.innerHTML = `
                    <button class="cart-btn" onclick="removeFromCart('${id}')">-</button>
                    <span class="cart-quantity">${cart[id].quantity}</span>
                    <button class="cart-btn" onclick="addToCart('${id}', '${cart[id].name}', ${cart[id].price})">+</button>
                `;
            } else {
                controlsContainer.innerHTML = `
                    <button class="cart-btn" onclick="addToCart('${id}', '${cart[id] ? cart[id].name : ''}', ${cart[id] ? cart[id].price : 0})">
                        Add to Cart
                    </button>
                `;
            }
        }

        function updateCartDisplay() {
            const cartItemsContainer = document.getElementById('cart-items');
            const cartTotal = document.querySelector('.cart-total');
            const checkoutBtn = document.querySelector('.checkout-btn');
            let cartHTML = '';
            let total = 0;

            const cartItems = Object.values(cart);
            
            if (cartItems.length === 0) {
                cartItemsContainer.innerHTML = '<div class="empty-cart">Your cart is empty</div>';
                cartTotal.style.display = 'none';
                checkoutBtn.style.display = 'none';
                return;
            }

            cartItems.forEach(item => {
                if (item.quantity > 0) {
                    cartHTML += `
                        <div class="cart-item">
                            <div class="cart-item-info">
                                <span>${item.name}</span>
                                <div class="cart-controls">
                                    <button class="cart-btn" onclick="removeFromCart('${item.id}')">-</button>
                                    <span class="cart-quantity">${item.quantity}</span>
                                    <button class="cart-btn" onclick="addToCart('${item.id}', '${item.name}', ${item.price})">+</button>
                                </div>
                            </div>
                            <span>₹${item.price * item.quantity}</span>
                        </div>
                    `;
                    total += item.price * item.quantity;
                }
            });

            cartItemsContainer.innerHTML = cartHTML;
            document.getElementById('cart-total-amount').textContent = total;
            cartTotal.style.display = 'flex';
            checkoutBtn.style.display = 'block';
        }

        function checkout() {
            const total = document.getElementById('cart-total-amount').textContent;
            alert(`Proceeding to checkout. Total amount: ₹${total}`);
            // Here you would typically submit the cart data to your server
            // window.location.href = 'checkout.jsp';
        }
    </script>
</body>
</html>