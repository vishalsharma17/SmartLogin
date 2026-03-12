package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.model.User;
import com.util.PasswordUtil;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		
		String encryptedPassword = PasswordUtil.hashPassword(password);

		HttpSession session = request.getSession();


		Integer attempts = (Integer) session.getAttribute("attempts");
		Long lockTime = (Long) session.getAttribute("lockTime");

		if (attempts == null) {
			attempts = 0;
		}


		if (lockTime != null) {

			long diff = System.currentTimeMillis() - lockTime;

			if (diff < 60000) {

				request.setAttribute("msg", "Account locked. Try again after 60 seconds");

				request.getRequestDispatcher("login.jsp").forward(request, response);

				return;

			} else {

				session.setAttribute("attempts", 0);
				session.removeAttribute("lockTime");

			}

		}

		UserDao dao = new UserDao();

		
		User user = dao.loginUser(email, encryptedPassword);

		if (user != null) {

			session.setAttribute("user", user);

			
			session.setAttribute("attempts", 0);

			response.sendRedirect("loginsuccess.jsp");

		} else {

			attempts++;

			session.setAttribute("attempts", attempts);

			if (attempts >= 3) {

				session.setAttribute("lockTime", System.currentTimeMillis());

				request.setAttribute("msg", "Account locked for 60 seconds");

			} else {

				request.setAttribute("msg", "Wrong email or password (" + attempts + "/3)");

			}

			request.getRequestDispatcher("login.jsp").forward(request, response);

		}

	}
}