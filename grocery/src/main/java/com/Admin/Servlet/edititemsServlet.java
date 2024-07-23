package com.Admin.Servlet;

import java.io.IOException;

import com.DataAccess.itemDAOImpl;
import com.DataBase.DatabaseConnect;
import com.entity.itemDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edititems")
public class edititemsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			 
			int  id = Integer.parseInt(req.getParameter("id"));
			String itemName = req.getParameter("itemname");
			String author = req.getParameter("auth");
			
            //String description = req.getParameter("description");
            String price = req.getParameter("price");
//            String itemCategory = req.getParameter("itemtype");
            String status = req.getParameter("itemstatus");
            
            
            itemDetails b = new itemDetails();
			b.setItemId(id);
			b.setitemName(itemName);
			b.setAuth(author);
			b.setPrice(price);
			b.setStatus(status);
			
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			boolean f =  dao.updateEditItem(b);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("success_msg", "Item Update Successfully!!!");
				resp.sendRedirect("admin/all_items.jsp");
			}else {
				session.setAttribute("failed_msg" ,"Something wrong on edititemServlet.java page!!");
				resp.sendRedirect("admin/all_items.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
