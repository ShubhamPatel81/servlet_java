package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SecondProgramm extends GenericServlet{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("this is generic servlet");
		res.setContentType("text/html");
		PrintWriter out =res.getWriter();
		out.println("<h2> Generic Date: </h2> " + new Date().toString());
		
	}
}
