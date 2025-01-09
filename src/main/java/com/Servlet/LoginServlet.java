package com.Servlet;

import java.io.IOException;
import java.sql.Connection;

import com.foodapp.DAO.UserDAO;
import com.foodapp.DAOImpl.UserDAOImpl;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.User;
import com.secure.MyEncrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.foodapp.model.User;
import com.foodapp.model.User;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {




	private Connection con;
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String email=MyEncrypt.encrypt(req.getParameter("email"));
		String password=MyEncrypt.encrypt(req.getParameter("password"));

		try {
			
			  
			
			con=DBConnection.connect();
			UserDAO userDAO=new UserDAOImpl();
			User user = userDAO.fetchByEmail(email);
			System.out.println(user.getUsername());
			if(user.getPassword().equals(password)) {

				   session.setAttribute("email", user.getEmail());
				session.setAttribute("user", user);

				Cookie ck1 = new Cookie("email",  email);
				resp.addCookie(ck1);

				resp.sendRedirect("GetAllRestrauntsServlet");
				
			}
			else {
				resp.sendRedirect("passwordMissmatch.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		resp.getWriter().println("Invalid Username try Again! ");
	}




}
