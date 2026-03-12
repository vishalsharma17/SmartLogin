package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.http.*;

import com.db.DBConnection;
import com.model.User;

public class UpdateProfileServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String email = request.getParameter("email");

		try {

			Connection con = DBConnection.getConnection();

			String sql = "UPDATE users SET " + "name = CASE WHEN ?='' THEN name ELSE ? END,"
					+ "mobile = CASE WHEN ?='' THEN mobile ELSE ? END,"
					+ "address = CASE WHEN ?='' THEN address ELSE ? END " + "WHERE email=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, name);
			ps.setString(2, name);

			ps.setString(3, mobile);
			ps.setString(4, mobile);

			ps.setString(5, address);
			ps.setString(6, address);

			ps.setString(7, email);

			int i = ps.executeUpdate();

			if (i > 0) {
				HttpSession session = request.getSession();

				User user = (User) session.getAttribute("user");

				if(!name.equals(""))
				user.setName(name);

				if(!mobile.equals(""))
				user.setMobile(mobile);

				if(!address.equals(""))
				user.setAddress(address);

				session.setAttribute("user", user);

				response.sendRedirect("dashboard.jsp");

			} else {

				response.getWriter().println("Update failed");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}