package com.UserServlet;

import java.io.IOException;

import com.DataAccess.CartDAOImpl;
import com.DataAccess.itemDAOImpl;
import com.DataBase.DatabaseConnect;
import com.entity.Cart;
import com.entity.itemDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/card")
public class CardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bId = Integer.parseInt(req.getParameter("bid"));
			int usetId = Integer.parseInt(req.getParameter("userId"));
			
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			itemDetails b =dao.getItemById(bId);
			
			Cart c = new Cart();
			c.setBid(bId);
			c.setUserId(usetId);
			c.setItemName(b.getitemName());
			c.setAuth(b.getAuth());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DatabaseConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("add_cart", "item Added to Cart");
				resp.sendRedirect("all_new_item.jsp");
				
			//System.out.println("Add cart success");
			}else {
				session.setAttribute("failes_msg", "Not Added to Cart");
				resp.sendRedirect("all_new_item.jsp");
				//System.out.println(":Not added successfully");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
