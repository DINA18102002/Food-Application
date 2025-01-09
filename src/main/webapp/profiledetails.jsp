<%@ page import="com.foodapp.model.User"%>
<%@ page import="com.foodapp.model.Restraunt"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/profiledetails.css">

</head>

<body>

	<!-- Navbar -->
	<nav class="navbar">
	
		<a href="home.jsp" class="app-name">Zomato</a>
		<p>
			 Offers going on<a href="home.jsp">OrderNow</a>
		</p>
	</nav>

	<!-- Profile Header -->
	<div class="container">
		<div class="profile-header">
			<img src="images/profile.jpg" alt="User Profile">
			<div>
				<h2>Theena</h2>
				<p>Email: theenaxz@example.com</p>
				<p>Member Since: 2024</p>
			</div>
		</div>

		<!-- Profile Section (Settings, Orders, etc.) -->
		<div class="profile-section">
			<h3>Account Settings</h3>
			<ul>
				<li onclick="window.location.href='updateDetails.jsp'">Update
					Details <i class="fas fa-pencil-alt"></i>
				</li>
				<li onclick="window.location.href='storedRestaurants.jsp'">Stored
					Restaurants <i class="fas fa-store"></i>
				</li>
				<li onclick="window.location.href='vegMode.jsp'">Veg Mode <i
					class="fas fa-leaf"></i></li>
				<li onclick="window.location.href='appearance.jsp'">Appearance
					<i class="fas fa-palette"></i>
				</li>
			</ul>
		</div>

		<div class="profile-section">
			<h3>Your Information</h3>
			<ul>
				<li onclick="window.location.href='yourRatings.jsp'">Your
					Ratings <i class="fas fa-star"></i>
				</li>
				<li onclick="window.location.href='yourOrders.jsp'">Your Orders
					<i class="fas fa-box"></i>
				</li>
				<li onclick="window.location.href='favoriteOrders.jsp'">Favorite
					Orders <i class="fas fa-heart"></i>
				</li>
				<li onclick="window.location.href='addressBook.jsp'">Address
					Book <i class="fas fa-address-book"></i>
				</li>
			</ul>
		</div>

		<div class="profile-section">
			<h3>Promotions</h3>
			<ul>
				<li onclick="window.location.href='coupons.jsp'">Coupons <i
					class="fas fa-gift"></i></li>
				<li onclick="window.location.href='help.jsp'">Online Ordering
					Help <i class="fas fa-question-circle"></i>
				</li>
			</ul>
		</div>

		<div class="profile-section">
			<h3>More</h3>
			<ul>
				<li onclick="window.location.href='chooseLanguage.jsp'">Choose
					Language <i class="fas fa-language"></i>
				</li>
				<li onclick="window.location.href='about.jsp'">About <i
					class="fas fa-info-circle"></i></li>
				<li onclick="window.location.href='sendFeedback.jsp'">Send
					Feedback <i class="fas fa-comment"></i>
				</li>
				<li onclick="window.location.href='reportSafetyEmergency.jsp'">Report
					a Safety Emergency <i class="fas fa-exclamation-triangle"></i>
				</li>
				<li onclick="window.location.href='settings.jsp'">Settings <i
					class="fas fa-cogs"></i></li>
				<li onclick="window.location.href='index.jsp'">Logout <i
					class="fas fa-sign-out-alt"></i></li>
			</ul>
		</div>
	</div>

</body>

</html>
