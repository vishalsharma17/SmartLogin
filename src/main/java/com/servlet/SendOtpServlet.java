package com.servlet;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;

public class SendOtpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobile = request.getParameter("mobile");
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000);
        String generatedOtp = String.valueOf(otp);

        HttpSession session = request.getSession();
        session.setAttribute("otp", generatedOtp);

        String apiKey = "Qd7gw0D1kFXHpchBtA86jyVxY5Z2iInKuW9UMalrLb4mE3zRsCiOmFnlgK7VE3boGsD4pz8YZy2kjJuh";
        String message = URLEncoder.encode("Your OTP is " + generatedOtp, "UTF-8");

        String apiUrl = "https://www.fast2sms.com/dev/bulkV2?"
                + "authorization=" + apiKey
                + "&message=" + message
                + "&language=english"
                + "&route=q"
                + "&numbers=" + mobile;

        URL url = new URL(apiUrl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        System.out.println("Response Code: " + responseCode);

        System.out.println(message);
        response.setContentType("text/plain");
        if (responseCode == 200) {
            response.getWriter().print("OK");
        } else {
            response.getWriter().print("FAIL");
        }
    }
}