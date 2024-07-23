package com.UserServlet;

import java.io.File;
import java.io.IOException;

import com.DataAccess.itemDAOImpl;
import com.DataBase.DatabaseConnect;
import com.entity.itemDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/add_old_items")
@MultipartConfig
public class AddoldItem extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			String itemName = req.getParameter("itemname");
			String description = req.getParameter("description");
			String price = req.getParameter("price");
			String itemCategory = "Old";
			String status = "active";
			Part part = req.getPart("itemimage");
			String useremail=req.getParameter("usersell");
			String fileName = part.getSubmittedFileName();
			
			

			if (itemName == null || description == null || price == null || itemCategory == null || status == null
					|| part == null) {
				session.setAttribute("failed_msg", "Missing required parameters.");
				resp.sendRedirect("sell_item.jsp");
				return;
			}

			itemDetails details = new itemDetails(itemName, description, price, itemCategory, status, fileName,useremail);

			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());

			boolean f = dao.addItem(details);

			if (f) {

				String path = getServletContext().getRealPath("") + "img";
				// System.out.println(path);
				File file = new File(path);

				part.write(path + File.separator + fileName);

				session.setAttribute("success_msg", "Item added successfully");
			} else {
				session.setAttribute("failed_msg", "Item not added successfully");
			}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("failed_msg", "Exception occurred: " + e.getMessage());
		}
		resp.sendRedirect("sell_item.jsp");
	}
}
