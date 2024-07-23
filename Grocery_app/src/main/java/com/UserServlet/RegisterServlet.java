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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.print(name +" "+email +" "+phoneno +" "+password+" "+check );

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPnumber(phoneno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DatabaseConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegister(us);
					if (f) {
						// System.out.print("Register Successfully!!!!");
						session.setAttribute("success_msg", "Register Successfully!!!");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.print("Register unsuccessful !!!!");
						session.setAttribute("unsuccess_msg", "Register not Success!!!");
						resp.sendRedirect("register.jsp");
					}

				} else {
					session.setAttribute("unsuccess_msg", "User Already Exist Try Another Email Id !!");
					resp.sendRedirect("register.jsp");

				}

			} else {
				// System.out.print("please check box");
				session.setAttribute("success_msg", "please check the box !!!");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
