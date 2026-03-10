package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.model.User;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			User user = new User();
			user.setUsername(username);
			user.setPassword(password);

			UserDao dao = new UserDao();

			boolean status = dao.validateUser(user);

			if(status){

			HttpSession session = request.getSession();
			session.setAttribute("user", username);

			response.sendRedirect("dashboard.jsp");

			}
			else{

			response.sendRedirect("error.jsp");

			}
}
}
