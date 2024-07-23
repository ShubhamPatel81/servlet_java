package com.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servlet1")
public class Servlet1 extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		
		resp.setContentType("text/html");
		
		PrintWriter out = resp.getWriter();
		out.print("<h1> Name : "+name+"</h1>");
		
		
		HttpSession session=  req.getSession();
		session.setAttribute("userName", name);
		out.println("<a herf='servlet2'>Servlet2<a/>");
	}

	
}
