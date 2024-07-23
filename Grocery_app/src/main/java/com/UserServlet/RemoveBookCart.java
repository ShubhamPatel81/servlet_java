package com.UserServlet;

import java.io.IOException;
import java.sql.Connection;

import com.DataAccess.CartDAOImpl;
import com.DataBase.DatabaseConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Clear previous messages
        session.removeAttribute("success_msg");
        session.removeAttribute("failes_msg");

        try {
            // Get parameters
            String bidParam = req.getParameter("bid");
            String userIdParam = req.getParameter("userId");
String cidParam = req.getParameter("cid");
            // Log the parameters to check if they are null
            //System.out.println("Received bid: " + bidParam);
            //System.out.println("Received userId: " + userIdParam);

            // Check if parameters are not null
            if (bidParam == null || userIdParam == null ||cidParam== null ) {
                throw new IllegalArgumentException("Missing required parameters");
            }

            // Trim and parse the parameters to integers
            int bid = Integer.parseInt(bidParam.trim());
            int userId = Integer.parseInt(userIdParam.trim());
            int cidId = Integer.parseInt(cidParam.trim());
            
            // Get database connection
            Connection conn = DatabaseConnect.getConn();
            if (conn == null) {
                throw new Exception("Database connection is null");
            }

            CartDAOImpl dao = new CartDAOImpl(conn);
            boolean f = dao.removeItemCart(bid, userId, cidId);

            if (f) {
                session.setAttribute("success_msg", "Removed item from cart");
            } else {
                session.setAttribute("failes_msg", "Item not removed from cart");
            }
            resp.sendRedirect("checkout.jsp");

        } catch (NumberFormatException e) {
            // Handle the exception for invalid number format
            e.printStackTrace();
            session.setAttribute("failes_msg", "Invalid input format");
            resp.sendRedirect("checkout.jsp");
        } catch (IllegalArgumentException e) {
            // Handle the exception for missing parameters
            e.printStackTrace();
            session.setAttribute("failes_msg", "Missing required parameters");
            resp.sendRedirect("checkout.jsp");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            session.setAttribute("failes_msg", "An unexpected error occurred: " + e.getMessage());
            resp.sendRedirect("checkout.jsp");
        }
    }
}
