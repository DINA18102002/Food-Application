<%@ page import="com.foodapp.model.Restraunt"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zomato</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="nav-left">
            <a href="index.jsp" class="app-name">Zomato</a>
            <div class="search-bar-container">
                <input type="text" placeholder="Search for restaurants, cuisines, or dishes..." class="search-input">
                <button class="search-button"><i class="fas fa-search"></i></button>
            </div>
        </div>
        <div class="nav-right">
            <div class="profile">
                <img src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=100&h=100&fit=crop" alt="Profile" id="profile-pic">
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Discover the best food & drinks</h1>
        <p>Order from the finest restaurants in your area</p>
    </div>

    <!-- Quick Links Section -->
    <div class="quick-links-section">
        <h2>Quick Links</h2>
        <div class="quick-links-grid">
            <a href="#" class="quick-link-card">
                <i class="fas fa-utensils"></i>
                <span>Top Rated</span>
            </a>
            <a href="#" class="quick-link-card">
                <i class="fas fa-leaf"></i>
                <span>Pure Veg</span>
            </a>
            <a href="#" class="quick-link-card">
                <i class="fas fa-motorcycle"></i>
                <span>Express Delivery</span>
            </a>
            <a href="#" class="quick-link-card">
                <i class="fas fa-fire"></i>
                <span>Trending</span>
            </a>
        </div>
    </div>

    <!-- Categories Section -->
    <div class="categories-section">
        <h2>What's on your mind?</h2>
        <div class="categories-grid">
            <div class="category-card">
                <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=300&h=200&fit=crop" alt="Pizza">
                <h3>Pizza</h3>
            </div>
            <div class="category-card">
                <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300&h=200&fit=crop" alt="Burgers">
                <h3>Burgers</h3>
            </div>
            <div class="category-card">
                <img src="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=300&h=200&fit=crop" alt="Sushi">
                <h3>Sushi</h3>
            </div>
            <div class="category-card">
                <img src="https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?w=300&h=200&fit=crop" alt="Biryani">
                <h3>Biryani</h3>
            </div>
        </div>
    </div>

    <!-- Offer Section -->
    <div class="hero-offer-section">
        <h2>Special Offers & Festivals</h2>
        <div class="offer-slider">
            <div class="offer-item">
                <h3>50% Off on Your First Order</h3>
                <p>Get 50% off on your first meal with us!</p>
                <button class="offer-btn">Order Now</button>
            </div>
            <div class="offer-item">
                <h3>Free Delivery on Orders Above $20</h3>
                <p>Enjoy free delivery for orders above $20!</p>
                <button class="offer-btn">Learn More</button>
            </div>
            <div class="offer-item">
                <h3>Festival Specials</h3>
                <p>Celebrate this festive season with exclusive discounts!</p>
                <button class="offer-btn">View Deals</button>
            </div>
        </div>
    </div>

    <!-- Popular Localities Section -->
    <div class="localities-section">
        <h2>Popular localities in your city</h2>
        <div class="localities-grid">
            <a href="#" class="locality-card">
                <h3>Downtown</h3>
                <p>388 places</p>
                <i class="fas fa-chevron-right"></i>
            </a>
            <a href="#" class="locality-card">
                <h3>Westside</h3>
                <p>255 places</p>
                <i class="fas fa-chevron-right"></i>
            </a>
            <a href="#" class="locality-card">
                <h3>Uptown</h3>
                <p>142 places</p>
                <i class="fas fa-chevron-right"></i>
            </a>
        </div>
    </div>

    <!-- Restaurants Section -->
    <div class="restaurants-section">
        <h2>Restaurants near you</h2>
        <div class="filters">
            <button class="filter-btn active">All</button>
            <button class="filter-btn">Rating 4.0+</button>
            <button class="filter-btn">Pure Veg</button>
            <button class="filter-btn">Fast Delivery</button>
        </div>
        <div class="restaurant-container">
            <% 
            ArrayList<Restraunt> restrauntList = (ArrayList<Restraunt>)session.getAttribute("restrauntList"); 
            if (restrauntList != null && !restrauntList.isEmpty()) {
                for (Restraunt r : restrauntList) {
                    double rating = r.getRating();
                    int fullStars = (int) rating;
                    double halfStar = rating - fullStars;
            %>
            <div class="restaurant-card">
                <a href="GetMenu?restrauntId=<%=r.getId() %>&name=<%=r.getName() %>&cuisine=<%=r.getCuisineType() %>" class="restaurant-link">
                    <img src="<%= r.getImagepath() %>" alt="<%= r.getName() %>">
                    <div class="card-content">
                        <h2 class="restaurant-name"><%= r.getName() %></h2>
                        <p class="cuisine-type"><%= r.getCuisineType() %></p>
                        <div class="restaurant-details">
                            <span class="rating">
                                <% 
                                for (int i = 0; i < 5; i++) {
                                    if (i < fullStars) {
                                        out.print("<i class='fas fa-star filled'></i>");
                                    } else if (i < 4) {
                                        out.print("<i class='fas fa-star low'></i>");
                                    } else {
                                        out.print("<i class='fas fa-star'></i>");
                                    }
                                }
                                %>
                            </span>
                            <span class="delivery-time"><%= r.getDeliveryTime() %> mins</span>
                        </div>
                        <p class="address"><%= r.getAddress() %></p>
                    </div>
                </a>
            </div>
            <% 
                } 
            } else { 
            %>
            <p class="no-results">No restaurants available. <a href="login.jsp">Login</a> to see restaurants</p>
            <% 
            } 
            %>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const profilePic = document.getElementById('profile-pic');
            if (profilePic) {
                profilePic.addEventListener('click', function () {
                    window.location.href = 'profiledetails.jsp';
                });
            }

            // Filter buttons interaction
            const filterBtns = document.querySelectorAll('.filter-btn');
            filterBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    filterBtns.forEach(b => b.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>