<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.DAOImpl.MenuDAOImpl, com.foodapp.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Menu Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .card {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border: none;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .btn-cancel {
            background-color: #6c757d;
            color: #fff;
            border: none;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="card text-center">
        <%
            String menuIdStr = request.getParameter("id");
            if (menuIdStr == null || menuIdStr.isEmpty()) {
        %>
            <div class="alert alert-danger" role="alert">
                Invalid menu item.
            </div>
        <%
            } else {
                int menuId = Integer.parseInt(menuIdStr);
                MenuDAOImpl menuDAO = new MenuDAOImpl();
                Menu menu = menuDAO.fetchOne(menuId);

                if (menu == null) {
        %>
            <div class="alert alert-danger" role="alert">
                Menu item not found.
            </div>
        <%
                } else {
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        // Form was submitted
                        String name = request.getParameter("name");
                        String category = request.getParameter("category");
                        String description = request.getParameter("description");
                        String priceStr = request.getParameter("price");
                        boolean isAvailable = request.getParameter("isAvailable") != null;

                        int price = Integer.parseInt(priceStr);


                        // Update the menu item
                        int rowsUpdated = menuDAO.updateMenuItem(menuId, name, category, description, price, isAvailable);
                        
                        if (rowsUpdated > 0) {
        %>
                            <div class="alert alert-success" role="alert">
                                Menu item updated successfully!
                            </div>
                            <a href="restaurant-dashboard.jsp" class="btn btn-custom w-100 mt-3">Back to Dashboard</a>
        <%
                        } else {
        %>
                            <div class="alert alert-danger" role="alert">
                                Failed to update menu item.
                            </div>
                            <a href="restaurant-dashboard.jsp" class="btn btn-custom w-100 mt-3">Back to Dashboard</a>
        <%
                        }
                    } else {
        %>
            <h3 class="card-title">Update Menu Item</h3>
            <form method="POST" action="updateMenu.jsp">
                <input type="hidden" name="id" value="<%= menuId %>">

                <div class="mb-3">
                    <label for="name" class="form-label">Menu Name</label>
                    <input type="text" name="name" class="form-control" value="<%= menu.getName() %>" required>
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" name="category" class="form-control" value="<%= menu.getCategory() %>" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea name="description" class="form-control" required><%= menu.getDescription() %></textarea>
                </div>

                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" name="price" class="form-control" value="<%= menu.getPrice() %>" required>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" name="isAvailable" <%= menu.isAvailable() ? "checked" : "" %>>
                    <label class="form-check-label" for="isAvailable">Available</label>
                </div>

                <button type="submit" class="btn btn-custom w-100">Update Menu</button>
            </form>

            <a href="restaurant-dashboard.jsp" class="btn btn-cancel w-100 mt-3">Go Back</a>
        <% 
                    }
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
