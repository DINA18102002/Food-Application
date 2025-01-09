package com.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import com.foodapp.DAO.MenuDAO;
import com.foodapp.DAOImpl.MenuDAOImpl;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class GetMenu
 */
//@WebServlet("/GetMenu")
public class GetMenu extends HttpServlet {
	
	private Connection con;
	private ArrayList<Menu> menuList;
	 {
		con=DBConnection.connect();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int  restrauntId=Integer.parseInt(req.getParameter("restrauntId"));
		String restrauntName = req.getParameter("name");
		
		try {
			
			MenuDAO mdao = new MenuDAOImpl();
			menuList = mdao.fetchMenuByRestraunt(restrauntId);
			 
			
			HttpSession session =req.getSession();
			session.setAttribute("restrauntName", restrauntName);
			
			session.setAttribute("menuList", menuList);

			
			req.setAttribute("menuList", menuList);
			req.setAttribute("restrauntName", restrauntName);

			req.getRequestDispatcher("menu.jsp").forward(req, resp);

			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
