<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        /* Styling remains unchanged */
    </style>
</head>
<body>

     <%
        Integer userId = (Integer) session.getAttribute("userid");
        String username = (String) session.getAttribute("username");
        String mobile = (String) session.getAttribute("mobile");
        String address = (String) session.getAttribute("address");
        Integer restaurantId = (Integer) session.getAttribute("restrauntid");
        Integer orderId = (Integer) request.getAttribute("orderId");

        String orderDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); // This ensures it's available in the JSP

        if (userId == null || username == null || mobile == null || address == null || restaurantId == null || orderId == null) {
            // Handle missing session attributes (e.g., redirect to login page)
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <div class="container">
        <h2>Checkout</h2>

        <!-- Address Form -->
        <div class="address-section">
            <h4>Delivery Details</h4>
            <form action="CheckoutServlet" method="POST">
            
            <!-- Order Details -->
            <div class="mb-3">
                <label for="orderid" class="form-label">Order ID</label>
                <input type="text" id="orderid" name="orderid" class="form-control" value="<%= orderId %>" readonly>
            </div>
            <div class="mb-3">
                <label for="userid" class="form-label">User ID</label>
                <input type="text" id="userid" name="userid" class="form-control" value="<%= userId %>" required>
            </div>
            <div class="mb-3">
                <label for="restrauntid" class="form-label">Restaurant ID</label>
                <input type="text" id="restrauntid" name="restrauntid" class="form-control" value="<%= restaurantId %>" required>
            </div>
            <div class="mb-3">
                <label for="orderdate" class="form-label">Order Date</label>
                <input type="date" id="orderdate" name="orderdate" class="form-control" value="<%= orderDate %>" required>
            </div>
            
            <!-- Username -->
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control" value="<%= username %>" placeholder="Enter your username" required>
            </div>
            
            <!-- Mobile -->
            <div class="mb-3">
                <label for="mobile" class="form-label">Mobile</label>
                <input type="text" id="mobile" name="mobile" class="form-control" value="<%= mobile %>" placeholder="Enter your mobile number" required>
            </div>
            
            <!-- Address -->
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea id="address" name="address" class="form-control" rows="3" placeholder="Enter your delivery address" required><%= address %></textarea>
            </div>
                
            <!-- Payment Options -->
            <h4>Select Payment Option</h4>

            <!-- Cash on Delivery -->
            <div class="payment-option" id="cod-option">
                <i class="fas fa-money-bill-wave"></i>
                <span>Cash on Delivery</span>
                <i class="fas fa-check" style="display: none;"></i>
            </div>

            <!-- UPI -->
            <div class="payment-option" id="upi-option">
                <i class="fas fa-university"></i>
                <span>UPI Transactions</span>
                <i class="fas fa-check" style="display: none;"></i>
            </div>
            
            <!-- UPI Payment Details -->
            <div class="payment-details" id="upi-details">
                <div class="upi-icons">
                    <img src="gpay_icon.png" alt="Google Pay" />
                    <img src="phonepe_icon.png" alt="PhonePe" />
                    <img src="paytm_icon.png" alt="Paytm" />
                    <img src="amazonpay_icon.png" alt="Amazon Pay" />
                    <img src="paypal_icon.png" alt="PayPal" />
                </div>
            </div>

            <!-- Place Order -->
            <button type="submit" class="btn-place-order" name="placeOrder">Place Order</button>
            </form>
        </div>
    </div>

    <script>
        // Select payment options dynamically
        const codOption = document.getElementById('cod-option');
        const upiOption = document.getElementById('upi-option');
        const upiDetails = document.getElementById('upi-details');

        codOption.addEventListener('click', function() {
            codOption.classList.toggle('selected');
            upiOption.classList.remove('selected');
            upiDetails.style.display = 'none';
        });

        upiOption.addEventListener('click', function() {
            upiOption.classList.toggle('selected');
            codOption.classList.remove('selected');
            upiDetails.style.display = upiOption.classList.contains('selected') ? 'block' : 'none';
        });
    </script>
</body>
</html>
