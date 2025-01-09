<%@ page import="com.foodapp.model.Restraunt"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Zomato</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/home.css">



</head>
<body>
	<!-- Navbar -->
	<nav class="navbar">
    <a href="index.jsp" class="app-name">Zomato</a>
    <div class="search-bar-container">
        <input type="text" placeholder="Search for restaurants, cuisines, or dishes..." class="search-input">
        <button class="search-button"><i class="fas fa-search"></i></button>
    </div>
    <div class="profile">
        <img src="images/profile.jpg" alt="Profile" id="profile-pic">
    </div>
</nav>


	<!-- Hero Section & Offer Section Combined -->
	<div class="hero-offer-section"
		onclick="window.location.href='offers.jsp'">
		<h2>Special Offers & Festivals</h2>

		<!-- Sliding Offer Cards Section -->
		<div class="offer-slider">
			<div class="offer-item">
				<h3>50% Off on Your First Order</h3>
				<p>Get 50% off on your first meal with us!</p>
			</div>
			<div class="offer-item">
				<h3>Free Delivery on Orders Above $20</h3>
				<p>Enjoy free delivery for orders above $20!</p>
			</div>
			<div class="offer-item">
				<h3>Festival Specials</h3>
				<p>Celebrate this festive season with exclusive discounts!</p>
			</div>
		</div>


	</div>

	<!-- Restaurant Grid -->
	<div class="restaurant-container">

		<% 
    ArrayList<Restraunt> restrauntList = (ArrayList<Restraunt>)session.getAttribute("restrauntList"); 
    if (restrauntList != null && !restrauntList.isEmpty()) {
        for (Restraunt r : restrauntList) {
            double rating = r.getRating();
            int fullStars = (int) rating; // Calculate full stars
            double halfStar = rating - fullStars; // Check for half star
%>
		<div class="restaurant-card">
			<a
				href="GetMenu?restrauntId=<%=r.getId() %>&name=<%=r.getName() %>&cuisine=<%=r.getCuisineType() %>"
				class="first-a"> 
				<img src="<%= r.getImagepath() %>"
				alt="<%= r.getName() %>">
				<div class="card-content">
					<h2 class="restaurant-name"><%= r.getName() %></h2>
					<p class="cuisine-type"><%= r.getCuisineType() %></p>
					<div class="restaurant-details">
						<span class="rating"> <% 
                        // Display stars based on rating
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
						</span> <span class="delivery-time"><%= r.getDeliveryTime() %>
							mins</span>
					</div>
					<p class="address"><%= r.getAddress() %></p>
				</div>

			</a>
		</div>
		<% 
        } 
    } else { 
%>
		<p id="nores">
			No restaurants available. <a href="login.jsp">Login </a> to get
			Restraunts
		</p>
		<% 
    } 
%>

	</div>
</body>
<script>
        document.addEventListener("DOMContentLoaded", function () {
            const profilePic = document.getElementById('profile-pic');
            if (profilePic) {
                profilePic.addEventListener('click', function () {
                    window.location.href = 'profiledetails.jsp';
                });
            }
        });
    </script>
</html>
