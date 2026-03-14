package com.servlet;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;

public class SendOtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mobile = request.getParameter("mobile");
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000);
        String generatedOtp = String.valueOf(otp);

        HttpSession session = request.getSession();
        session.setAttribute("otp", generatedOtp);
        
        Properties prop = new Properties();
        InputStream input = getServletContext()
                .getResourceAsStream("/WEB-INF/config.properties");
        prop.load(input);

        String apiKey = prop.getProperty("fast2sms.apikey");
        String apiUrl = prop.getProperty("fast2sms.apiurl");

       
        String message = URLEncoder.encode("Your OTP is " + generatedOtp, "UTF-8");

        String fullUrl = apiUrl + "?"
                + "authorization=" + apiKey
                + "&message=" + message
                + "&language=english"
                + "&route=q"
                + "&numbers=" + mobile;

        URL url = new URL(fullUrl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        System.out.println(responseCode);
        response.setContentType("text/plain");
        if (responseCode == 200) {
            response.getWriter().print("OK");
        } else {
            response.getWriter().print("FAIL");
        }
    }
}