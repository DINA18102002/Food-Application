<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Login - Zomato</title>
    <link rel="stylesheet" href="css/yourrestrauntlogin.css">
    <script>
        // JavaScript to close the form
        function closeForm() {
            document.querySelector(".login-container").style.display = "none";
        }
    </script>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="index.jsp" class="app-name">Zomato</a>
    </nav>
	  <!-- Error message display -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            <p>${errorMessage}</p>
        </div>
    </c:if>
    <!-- Login Form -->
    <div class="login-container">
        <!-- Cancel Icon -->
          <a href="addrestraunt.jsp" class="cancel-btn">&#10006;</a>
        <h2>Restaurant Login</h2>
        
        <form action="RestaurantLoginServlet" method="post">
            <div class="form-group">
                <label for="name">Restaurant Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your restaurant name" required>
            </div>

            <div class="form-group">
                <label for="restrauntid">Restaurant ID:</label>
                <input type="text" id="restrauntid" name="restrauntid" placeholder="Enter your restaurant ID" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <!-- Register Link -->
        <p class="register-link">
            New restaurant? <a href="registerrestraunt.jsp">Register here</a>
        </p>
    </div>

</body>
</html>
