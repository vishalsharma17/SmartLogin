package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.db.DBConnection;

public class ForgotPasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				request.setAttribute("email", email);

				RequestDispatcher rd = request.getRequestDispatcher("resetPassword.jsp");

				rd.forward(request, response);

			} else {

				response.getWriter().println("Email not found");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}
}