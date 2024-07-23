package com.programm;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet1")
public class Servlet1 extends HttpServlet{

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		PrintWriter out = resp.getWriter(); 
		
		// Create cookies 
		
		Cookie ck = new Cookie("name", name);
		resp.addCookie(ck);
		
		
		
		resp.setContentType("text/html");
		out.print( "Welcome Servlet1 "+name);
		
		out.println("<a href='servlet2'> servlet2 </a> ");
		}
	
	
}
