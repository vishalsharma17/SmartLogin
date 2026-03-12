package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.model.User;
import com.util.PasswordUtil;

public class RegisterServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = new User();

		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		user.setAddress(request.getParameter("address"));

		String password = request.getParameter("password");

		
		String encryptedPassword = PasswordUtil.hashPassword(password);

		user.setPassword(encryptedPassword);

		UserDao dao = new UserDao();

		boolean status = dao.registerUser(user);

		if (status) {
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}

	}
}