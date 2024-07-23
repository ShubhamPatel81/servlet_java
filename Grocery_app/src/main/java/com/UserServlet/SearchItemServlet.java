package com.UserServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("searchItem")
public class SearchItemServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  try {
		
		  String ch = req.getParameter("ch");
		  
		  
		  
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}
}
