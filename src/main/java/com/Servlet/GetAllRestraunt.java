package com.Servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.DAO.RestrauntDAO;
import com.foodapp.DAOImpl.RestrauntDAOImpl;
import com.foodapp.model.Restraunt;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetAllRestraunt extends HttpServlet {
    

	 private List<Restraunt> restrauntList;

	
	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	
	        if (true) {
	            RestrauntDAO rdao = new RestrauntDAOImpl();
	            restrauntList = rdao.getAll();
	           //
	            for(Restraunt r : restrauntList) {
	            	System.out.println(r.getName());
	            }
	            HttpSession session = req.getSession();
	            session.setAttribute("restrauntList", restrauntList);
	            resp.sendRedirect("home.jsp");
	        } 
	       
	
	

}}