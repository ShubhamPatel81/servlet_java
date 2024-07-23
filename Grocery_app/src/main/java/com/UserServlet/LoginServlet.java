package com.UserServlet;

import java.io.IOException;
import com.DataAccess.UserDAOImpl;
import com.DataBase.DatabaseConnect;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.getWriter().write("GET method is not supported for login. Please use POST.");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            String email = req.getParameter("email1");
            String password = req.getParameter("password1");

            UserDAOImpl dao = new UserDAOImpl(DatabaseConnect.getConn());

            HttpSession session = req.getSession();

            if (email.equals(email) && password.equals(password) ) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect("admin/adminhome.jsp");
            } else {
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failed_msg", "Email or Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("An error occurred during login.");
        }
    }
}
