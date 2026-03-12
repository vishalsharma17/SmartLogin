package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.db.DBConnection;
import com.util.PasswordUtil;

public class ResetPasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		
		String encryptedPassword = PasswordUtil.hashPassword(password);

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE email=?");

			ps.setString(1, encryptedPassword);
			ps.setString(2, email);

			int i = ps.executeUpdate();

			if (i > 0) {

				RequestDispatcher rd = request.getRequestDispatcher("passwordSuccess.jsp");

				rd.forward(request, response);

			} else {

				response.getWriter().println("Error updating password");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
}