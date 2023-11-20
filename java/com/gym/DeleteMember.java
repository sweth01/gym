package com.gym;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMember")
public class DeleteMember extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        long id= Long.parseLong(request.getParameter("uid"));
    	
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gym", "root", "chennai123");
            String deleteSql = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(deleteSql);

            preparedStatement.setLong(1, id);
            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("login-success-admin.jsp");
            } else {
                response.getWriter().write("Failed to delete To-Do Item.");
            }

            preparedStatement.close();
            conn.close();
        } catch (Exception e) {
            response.getWriter().write(e.getMessage());
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}