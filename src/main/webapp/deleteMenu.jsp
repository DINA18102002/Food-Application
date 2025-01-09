<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.DAOImpl.MenuDAOImpl" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Menu Item</title>
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
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
            border: none;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-cancel {
            background-color: #6c757d;
            color: #fff;
            border: none;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
        .message {
            animation: slideIn 0.7s ease-in-out;
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="card text-center">
        <%
            String menuIdStr = request.getParameter("id");
            if (menuIdStr == null || menuIdStr.isEmpty()) {
        %>
            <div class="alert alert-danger message" role="alert">
                Invalid menu item.
            </div>
        <%
            } else {
                int menuId = Integer.parseInt(menuIdStr);
                String confirm = request.getParameter("confirm");
                if ("yes".equalsIgnoreCase(confirm)) {
                    MenuDAOImpl menuDAO = new MenuDAOImpl();
                    int isDeleted = menuDAO.deleteMenuItem(menuId);

                    if (isDeleted > 0) {
        %>
                        <div class="alert alert-success message" role="alert">
                            Menu Item Deleted Successfully!
                        </div>
                        <a href="restaurant-dashboard.jsp" class="btn btn-custom w-100 mt-3">Back to Restaurant</a>
        <%
                    } else {
        %>
                        <div class="alert alert-danger message" role="alert">
                            Failed to delete menu item.
                        </div>
                        <a href="restaurant-dashboard.jsp" class="btn btn-custom w-100 mt-3">Back to Restaurant</a>
        <%
                    }
                } else {
        %>
                    <h4 class="card-title">Are you sure?</h4>
                    <p class="card-text mb-4">Do you want to delete this menu item?</p>
                    <form method="GET" action="deleteMenu.jsp">
                        <input type="hidden" name="id" value="<%= menuIdStr %>">
                        <input type="hidden" name="confirm" value="yes">
                        <button type="submit" class="btn btn-delete w-100 mb-3">Yes, Delete</button>
                    </form>
                    <a href="restaurant-dashboard.jsp" class="btn btn-cancel w-100">No, Go Back</a>
        <%
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
