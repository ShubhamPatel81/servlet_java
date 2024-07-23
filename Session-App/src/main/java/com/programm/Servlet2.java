package com.programm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet2")
public class Servlet2 extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		
		 Cookie [ ] ck = req.getCookies();
		
		out.print("<h1> Welcome Servlet2 = "+ ck[0].getValue()+"</h1>");
	}
	

}
