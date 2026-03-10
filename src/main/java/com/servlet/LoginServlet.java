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

		String email=request.getParameter("email");
		String password=request.getParameter("password");

		UserDao dao=new UserDao();

		User user=dao.loginUser(email,password);

		if(user!=null){

		HttpSession session=request.getSession();
		session.setAttribute("user",user);

		response.sendRedirect("loginsuccess.jsp");

		}else{

		response.sendRedirect("error.jsp");

		}

}
}
