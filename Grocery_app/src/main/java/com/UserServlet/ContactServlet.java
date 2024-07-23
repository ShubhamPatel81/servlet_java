package com.UserServlet;


import java.io.IOException;
import java.sql.Connection;

import com.DataAccess.ContactDAO;
import com.DataBase.DatabaseConnect;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try (Connection conn = DatabaseConnect.getConn()) {
            ContactDAO contactDAO = new ContactDAO(conn);
            boolean isSaved = contactDAO.saveContact(name, email, subject, message);

            if (isSaved) {
                // Optionally, send an email notification here using JavaMail API
                // sendEmailNotification(name, email, subject, message);

                response.sendRedirect("contact_success.jsp");
            } else {
                response.getWriter().write("An error occurred while saving your contact information. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred during processing.");
        }
    }

    // Optional method to send email notifications
    // private void sendEmailNotification(String name, String email, String subject, String message) {
    //     // Implement email sending logic using JavaMail API
    // }
}

