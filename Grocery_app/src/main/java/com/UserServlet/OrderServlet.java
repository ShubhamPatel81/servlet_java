package com.UserServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DataAccess.CartDAOImpl;
import com.DataAccess.ItemOrderImpl;
import com.DataBase.DatabaseConnect;
import com.entity.Cart;
import com.entity.ItemOrder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String pnumber = req.getParameter("pnumber");
		String address = req.getParameter("address");
		String landmark = req.getParameter("landmark");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String pincode = req.getParameter("pincode");
		String paymenttype = req.getParameter("paymenttype");
		
		String fullAddress= address+","+landmark+","+city+","+state+","+pincode;
		//System.out.println(name+" "+ email+" "+ pnumber+" "+fullAddress+" " + paymenttype);
		
		HttpSession session = req.getSession();
		
		CartDAOImpl dao=new CartDAOImpl(DatabaseConnect.getConn());
		 List<Cart> bList=  dao.getItemByUser(userId);
		if(bList.isEmpty()) {
			session.setAttribute("failes_msg", "Add items ");
			resp.sendRedirect("checkout.jsp");
			
			
		}else{
			
			 ItemOrderImpl  dao2 = new ItemOrderImpl(DatabaseConnect.getConn());
			 ItemOrder o = null;
		
			ArrayList<ItemOrder> orderList = new ArrayList<ItemOrder>();
			Random r = new Random();
			
			 for(Cart c:bList) {
				//System.out.println(c.getItemName()+" "+c.getAuth()+" "+c.getPrice()); 
				o= new ItemOrder();
				 o.setOrderId("ITEM-ORD-00"+r.nextInt(1000));
				 o.setUserName(name);
				 o.setEmail(email);
				 o.setPnumber(pnumber);
				 o.setFullAddress(fullAddress);
				 o.setItemName(c.getItemName());
				 o.setAuth(c.getAuth());
				 o.setPrice(c.getPrice()+"");
				 o.setPaymenttype(paymenttype);
				 
				 orderList.add(o);
			
				 
			 }
			 
			if("noselect".equals(paymenttype)) {
				session.setAttribute("failes_msg", "Please Choose Payment method");
				resp.sendRedirect("checkout.jsp");
			}else {
				
				boolean f = dao2.saveOrder(orderList);
				if(f) {
					//System.out.println("order Success");
					resp.sendRedirect("order_success.jsp");
				}else {
					//System.out.println("Oreder Failed");
					session.setAttribute("failes_msg", "Your Order Failed");
					resp.sendRedirect("checkout.jsp");
				}
			}
			
			
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
}
