<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.DAOImpl.MenuDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Menu" %>
<%@ page import="com.foodapp.DAO.OrdersDAO" %>
<%@ page import="com.foodapp.DAOImpl.OrdersDAOImpl" %>
<%@ page import="com.foodapp.model.CustomerFeedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - Restaurant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .card {
            margin-bottom: 20px;
        }
        .action-buttons {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Restaurant Settings</h2>

        <!-- Total Menu Section -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Total Menu Items</h5>
                <p class="card-text">
                    <% 
                        MenuDAOImpl menuDAO = new MenuDAOImpl();
                        int totalMenuItems = 0;
                        try {
                            totalMenuItems = menuDAO.getTotalMenuItems((Integer) session.getAttribute("restaurantId"));
                        } catch (Exception e) {
                            out.println("Error fetching menu items: " + e.getMessage());
                        }
                    %>
                    Total Menu Items: <%= totalMenuItems %>
                </p>
            </div>
        </div>

        <!-- Total Orders Section -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Total Orders</h5>
                <p class="card-text">
                    <% 
                        OrdersDAO ordersDAO = new OrdersDAOImpl();
                        int totalOrders = 0;
                        try {
                            totalOrders = ordersDAO.getTotalOrders((Integer) session.getAttribute("restaurantId"));
                        } catch (Exception e) {
                            out.println("Error fetching orders: " + e.getMessage());
                        }
                    %>
                    Total Orders: <%= totalOrders %>
                </p>
            </div>
        </div>

        <!-- Total Ratings Section -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Total Ratings</h5>
                <p class="card-text">
                    <% 
                        double averageRating = 0.0;
                        try {
                            averageRating = ordersDAO.getAverageRating((Integer) session.getAttribute("restaurantId"));
                        } catch (Exception e) {
                            out.println("Error fetching ratings: " + e.getMessage());
                        }
                    %>
                    Average Rating: <%= averageRating %> / 5
                </p>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Customer Reviews</h5>
                <div class="accordion" id="reviewsAccordion">
                    <% 
                        List<CustomerFeedback> reviews = null;
                        try {
                            reviews = ordersDAO.getReviews((Integer) session.getAttribute("restaurantId"));
                        } catch (Exception e) {
                            out.println("Error fetching reviews: " + e.getMessage());
                        }

                        if (reviews != null && !reviews.isEmpty()) {
                            for (CustomerFeedback feedback : reviews) {
                    %>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading<%= feedback.getOrderId() %>">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= feedback.getOrderId() %>" aria-expanded="false" aria-controls="collapse<%= feedback.getOrderId() %>">
                                <strong><%= feedback.getCustomerName() %></strong>: <%= feedback.getReview() %>
                            </button>
                        </h2>
                        <div id="collapse<%= feedback.getOrderId() %>" class="accordion-collapse collapse" aria-labelledby="heading<%= feedback.getOrderId() %>" data-bs-parent="#reviewsAccordion">
                            <div class="accordion-body">
                                <p><strong>Review:</strong> <%= feedback.getReview() %></p>
                                <p><strong>Rating:</strong> 4 / 5</p> <!-- Adjust the rating display -->
                            </div>
                        </div>
                    </div>
                    <% 
                            }
                        } else {
                            out.println("<p>No reviews found.</p>");
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Report Section -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Customer Reports</h5>
                <div class="accordion" id="reportsAccordion">
                    <% 
                        List<CustomerFeedback> reports = null;
                        try {
                            reports = ordersDAO.getCustomerReports((Integer) session.getAttribute("restaurantId"));
                        } catch (Exception e) {
                            out.println("Error fetching reports: " + e.getMessage());
                        }

                        if (reports != null && !reports.isEmpty()) {
                            for (CustomerFeedback feedback : reports) {
                    %>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="reportHeading<%= feedback.getOrderId() %>">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#reportCollapse<%= feedback.getOrderId() %>" aria-expanded="false" aria-controls="reportCollapse<%= feedback.getOrderId() %>">
                                <strong><%= feedback.getCustomerName() %></strong>: <%= feedback.getReport() %>
                            </button>
                        </h2>
                        <div id="reportCollapse<%= feedback.getOrderId() %>" class="accordion-collapse collapse" aria-labelledby="reportHeading<%= feedback.getOrderId() %>" data-bs-parent="#reportsAccordion">
                            <div class="accordion-body">
                                <p><strong>Report:</strong> <%= feedback.getReport() %></p>
                            </div>
                        </div>
                    </div>
                    <% 
                            }
                        } else {
                            out.println("<p>No reports found.</p>");
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <!-- Delete Account Button -->
            <a href="DeleteAccountServlet" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
                Delete Account
            </a>
            <br><br>
            <!-- Logout Button -->
            <a href="yourrestrauntlogin.jsp" class="btn btn-warning">
                Logout
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
