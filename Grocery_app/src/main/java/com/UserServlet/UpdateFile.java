package com.UserServlet;

import java.io.IOException;

import com.DataAccess.UserDAOImpl;
import com.DataBase.DatabaseConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/update_profile")
public class UpdateFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("fname");
		String email = req.getParameter("email");
		String phoneno = req.getParameter("phoneno");
		String password = req.getParameter("password");
		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPnumber(phoneno);
		
		HttpSession session = req.getSession();
		
		UserDAOImpl dao = new UserDAOImpl(DatabaseConnect.getConn());
		boolean f =dao.checkPassword(id, password);
		if(f) {
			boolean f2 = dao.updateProfile(us);
			if (f2) {
				//System.out.print("Register  Successfully!!!!");
				session.setAttribute("success_msg", "Profile Updated Successfully!!!");
				resp.sendRedirect("edit_profile.jsp");
			} else {
				//System.out.print("Register  unsuccessful !!!!");
				session.setAttribute("failed_msg", "Error on edit_profile.jsp page");
				resp.sendRedirect("edit_profile.jsp");
			}
		} else {
			//System.out.print("please check box");
			session.setAttribute("failed_msg", "Password is incorrect");
			resp.sendRedirect("edit_profile.jsp");
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
}
