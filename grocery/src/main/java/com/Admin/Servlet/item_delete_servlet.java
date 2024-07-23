package com.Admin.Servlet;

import java.io.IOException;

import com.DataAccess.itemDAOImpl;
import com.DataBase.DatabaseConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class item_delete_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	
	int id = Integer.parseInt(req.getParameter("id"));
	
	itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
	
	boolean f = dao.deleteItem(id);
	HttpSession session = req.getSession();
	
	if(f) {
		session.setAttribute("success_msg", "Item Delete Successfully!!!");
		resp.sendRedirect("admin/all_items.jsp");
	}else {
		session.setAttribute("failed_msg" ,"Something wrong on delete_servlet.java page!!");
		resp.sendRedirect("admin/all_items.jsp");
	}
	
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
}
}
