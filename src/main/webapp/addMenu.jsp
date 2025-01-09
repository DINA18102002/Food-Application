<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 400px;
            position: relative;
        }
        .form-container h2 {
            margin-top: 0;
            text-align: center;
            color: #333;
        }
        .form-container label {
            display: block;
            margin-top: 15px;
            color: #555;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container textarea,
        .form-container select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-container input[type="file"] {
            margin-top: 10px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            background-color: #ff6f00;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        .form-container input[type="submit"]:hover {
            background-color: #e65c00;
        }
        .cancel-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            color: #333;
            cursor: pointer;
        }
        .cancel-btn:hover {
            color: red;
        }
    </style>
    <script>
        function closeForm() {
            window.history.back();
        }
    </script>
</head>
<body>

    <!-- Form Container -->
    <div class="overlay">
        <div class="form-container">
            <span class="cancel-btn" onclick="closeForm()">&times;</span>
            <h2>Add Menu</h2>
            
            
            
            <form action="AddMenu" method="POST" enctype="multipart/form-data">
                <!-- Hidden field to pass restaurantId to the server -->
               <input type="hidden" name="restaurantId" value="<%= session.getAttribute("restrauntid") != null ? session.getAttribute("restrauntid").toString() : "0" %>">	
                
                <label for="name">Menu Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <option value="Main Course">Main Course</option>
                    <option value="Appetizer">Appetizer</option>
                    <option value="Side Dish">Side Dish</option>
                    <option value="Dessert">Dessert</option>
                    <option value="Beverage">Beverage</option>
                </select>

                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="3" required></textarea>

                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" required>

                <label for="isavailable">Availability:</label>
                <select id="isavailable" name="isavailable" required>
                    <option value="true">Available</option>
                    <option value="false">Not Available</option>
                </select>

               
                <input type="submit" value="Add Menu">
            </form>
        </div>
    </div>

</body>
</html>
