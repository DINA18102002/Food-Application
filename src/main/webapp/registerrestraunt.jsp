<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Registration</title>
    <link rel="stylesheet" href="css/registerrestraunt.css">
    
</head>
<body>

    <form action="RegisterRestrauntServlet" method="post" >
        <h1>Zomato</h1>

        <label for="restaurantName">Restaurant Name</label>
        <input type="text" id="name" name="name" required>

        <label for="cuisineType">Cuisine Type</label>
        <select id="cuisineType" name="cuisineType" required>
            <option value="" disabled selected>Select a cuisine</option>
            <option value="Indian">Indian</option>
            <option value="Chinese">Chinese</option>
            <option value="Italian">Italian</option>
            <option value="Mexican">Mexican</option>
            <option value="Japanese">Japanese</option>
        </select>

        <label for="deliveryTime">Delivery Time (in minutes)</label>
        <input type="number" id="deliveryTime" name="deliveryTime" required>

        <label for="address">Address</label>
        <textarea id="address" name="address" rows="4" required></textarea>

        <label for="rating">Rating</label>
        <select id="rating" name="rating" required>
            <option value="" disabled selected>Select a rating</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="3.5">3.5</option>
            <option value="4">4</option>
            <option value="4.5">4.5</option>
            <option value="5">5</option>
        </select>

        <label for="isActive">Is Active</label>
        <select id="isActive" name="isActive" required>
            <option value="" disabled selected>Choose an option</option>
            <option value="yes">Yes</option>
            <option value="no">No</option>
        </select>

       

        <button type="submit">Register Restaurant</button>

        <div class="form-footer">
            <p>Already registered? <a href="yourrestrauntlogin.jsp">Login here</a></p>
        </div>
    </form>

</body>
</html>
