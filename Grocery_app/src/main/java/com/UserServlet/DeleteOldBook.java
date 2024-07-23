package com.UserServlet;

import java.io.IOException;

import com.DataAccess.itemDAOImpl;
import com.DataBase.DatabaseConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/delete_old_item")
public class DeleteOldItem  extends HttpServlet{
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			boolean f=dao.oldItemDelete(em, "Old");
			
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("success_msg", "old Item Removed");
				resp.sendRedirect("");
			}
			else {
				session.setAttribute("failed_msg", "Error on DeleteOl");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
