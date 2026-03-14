package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.model.User;
import com.util.PasswordUtil;

public class RegisterServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
        HttpSession session = request.getSession();
        Boolean otpVerified = (Boolean) session.getAttribute("otpVerified");

        if (otpVerified == null || !otpVerified) {
           
            request.setAttribute("error", 
                "Please verify your mobile number first");
            RequestDispatcher rd = request
                    .getRequestDispatcher("register.jsp");
            rd.forward(request, response);
            return;
        }
		
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
			 session.removeAttribute("otpVerified");
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}

	}
}