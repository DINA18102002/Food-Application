package com.Servlet;

import java.io.IOException;
import java.sql.Connection;

import com.foodapp.DAO.UserDAO;
import com.foodapp.DAOImpl.UserDAOImpl;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.User;
import com.secure.MyEncrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */

public class RegisterServlet extends HttpServlet {

	
	private Connection con;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		
		
		try {
			con=DBConnection.connect();
			UserDAO userDAO = new UserDAOImpl();
			
			int x= userDAO.insert(new User(
					MyEncrypt.encrypt(req.getParameter("username")),
					MyEncrypt.encrypt(req.getParameter("password")),
					MyEncrypt.encrypt(req.getParameter("email")),
					MyEncrypt.encrypt(req.getParameter("mobile")),
					MyEncrypt.encrypt(req.getParameter("address"))
					));

			if (x == 1) {
				resp.sendRedirect("success.jsp");
			} else {
				resp.sendRedirect("failure.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");  
		}
	}



}




