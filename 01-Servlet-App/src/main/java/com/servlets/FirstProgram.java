package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Date;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FirstProgram implements Servlet{

	ServletConfig conn;
	
	@Override
	public void destroy() {
		System.out.println("This is destroy nethod");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("This is init nethod");
		conn = config;
		
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("This is service nethod");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("Welcome to Srevlet");
		out.println("today date   "+new Date().toString());
		out.println(getServletInfo());
	}
	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return conn;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return "This is my first programm ";
	}  

}
