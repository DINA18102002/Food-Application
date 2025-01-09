<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - Zomato</title>
    
    <link rel="stylesheet" href="css/userform.css">
    
    <script src="form.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Account</h1>
            <p>Join Zomato today</p>
        </div>

        <form action="RegisterServlet" method="POST" onsubmit="return validate()">
            <div class="form-group">
                <label for="username">UserName</label>
                <input type="text" id="username" name="username" >
                 <div id="msg1" style="color: red;"></div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" >
                 <div id="msg3" style="color: red;"></div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" >
                <div id="msg4" style="color: red;"></div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" >
                <div id="msg5" style="color: red;"></div>
                <div id="msg6" style="color: red;"></div>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" >
                 <div id="msg8" style="color: red;"></div>
            </div>

            <div class="form-group">
                <label for="address">Delivery Address</label>
                <textarea id="address" name="address" ></textarea>
                 <div id="msg7" style="color: red;"></div>
            </div>

            <button type="submit" class="create-account-btn">Create Account</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>