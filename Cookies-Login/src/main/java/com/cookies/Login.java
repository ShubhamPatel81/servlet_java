package com.cookies;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlet1")
public class Login extends HttpServlet  {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		
		
		Cookie ck = new Cookie("email", email);
		Cookie ckp = new Cookie("password", password);
		
		resp.addCookie(ck);
		resp.addCookie(ckp);
		
//		resp.sendRedirect(email);
//		resp.sendRedirect(password);
//		
		resp.sendRedirect("profile");
		
	}
	
	

}
