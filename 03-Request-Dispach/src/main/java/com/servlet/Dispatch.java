package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class Dispatch extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		RequestDispatcher rd;
		
		if("demo@gmail.com".equals(email) && "demo12".equals(password)) {
			// Redirect to Home page
//			rd=req.getRequestDispatcher("/servlet2");
//			rd.forward(req, resp);
			resp.sendRedirect("servlet2");
			
		}else {
			// Redirect to Again login page
			out.println("<h3>Invalid Emai and password</h3>");
			rd = req.getRequestDispatcher("/index.html");
			rd.include(req, resp);
			
		}
	}
	

}
