<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Zomato</title>
<link rel="stylesheet" href="css/registerrestrauntsuccess.css">

</head>
<body>
    <div class="container">
        <h1>Successfully Registered Your Restaurant</h1>
        <p>Your restaurant has been successfully registered on Zomato. You can now log in to manage your restaurant details.</p>
        
          
           <div class="restraunt-info-box">
            <p><strong>Restaurant Name:</strong> <span class="highlight">${restrauntname}</span></p>
            <p><strong>Restaurant ID:</strong> <span class="highlight">${restrauntid}</span></p>
        </div>
        
        <a href="yourrestrauntlogin.jsp">Login</a>
    </div>
</body>
</html>
