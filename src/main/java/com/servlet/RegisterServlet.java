package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.User;

public class RegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		User user=new User();

		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		user.setAddress(request.getParameter("address"));
		user.setPassword(request.getParameter("password"));

		UserDao dao=new UserDao();

		boolean status=dao.registerUser(user);

		if(status){
		response.sendRedirect("success.jsp");
		}else{
		response.sendRedirect("error.jsp");
		}
	}

}
