package com.servlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class ValidateOtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");
        
        

        response.setContentType("text/plain");

        if (userOtp != null && userOtp.equals(sessionOtp)) {
            session.setAttribute("otpVerified", true);
            session.removeAttribute("otp");
            response.getWriter().print("OK");
        } else {
            response.getWriter().print("INVALID");
        }
    }
}