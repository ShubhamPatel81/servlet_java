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
public class DeleteOldItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int itemId = Integer.parseInt(req.getParameter("itemId"));
            String email = req.getParameter("email"); // Use "email" instead of "user_email" as per query string parameter
            itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
            boolean f = dao.oldItemDelete(email, "Old", itemId);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("success_msg", "Old Item Removed");
            } else {
                session.setAttribute("failed_msg", "Error on deleting Old Item");
            }
            resp.sendRedirect("old_item.jsp"); // Redirect to old_item.jsp after processing

        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions here, typically logging or displaying an error message
        }
    }
}
