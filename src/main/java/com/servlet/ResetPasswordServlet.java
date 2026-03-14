package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.db.DBConnection;
import com.util.PasswordUtil;

public class ResetPasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		
		String encryptedPassword = PasswordUtil.hashPassword(password);

		UserDao dao = new UserDao();
		
		try {

			
			String oldPassword = dao.getOldPasswordByEmail(email);

			
			if (encryptedPassword.equals(oldPassword)) {

				response.getWriter().println("New password cannot be same as old password");

				return;

			}


        boolean status = dao.resetPassword(email, encryptedPassword);

        if (status) {

            RequestDispatcher rd =
                request.getRequestDispatcher("passwordSuccess.jsp");

            rd.forward(request, response);

        } else {

            response.getWriter().println("Error updating password");

        }
		} catch (Exception e) {

			e.printStackTrace();

		}

	}
}