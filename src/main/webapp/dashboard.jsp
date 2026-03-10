<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | <%= user.getName() %></title>

    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #e0f2f1 0%, #b2dfdb 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        .dashboard-card {
            max-width: 540px;
            margin: 60px auto;
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
            background: white;
        }

        .card-header {
            background: linear-gradient(90deg, #26a69a, #00897b);
            color: white;
            padding: 2.5rem 2rem;
            text-align: center;
        }

        .avatar-circle {
            width: 90px;
            height: 90px;
            background: rgba(255,255,255,0.25);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 2.8rem;
            border: 3px solid white;
        }

        .card-body {
            padding: 2.5rem 3rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 1.4rem;
            font-size: 1.05rem;
        }

        .info-icon {
            width: 40px;
            height: 40px;
            background: #e0f2f1;
            color: #00897b;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 1.3rem;
        }

        .info-label {
            font-weight: 600;
            color: #555;
            min-width: 100px;
        }

        .btn-logout {
            background: linear-gradient(90deg, #ef5350, #d32f2f);
            border: none;
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            font-weight: 500;
            border-radius: 12px;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(239, 83, 80, 0.35);
        }

        h2.welcome {
            font-weight: 700;
            letter-spacing: -0.5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="dashboard-card card">

            <div class="card-header">
                <div class="avatar-circle">
                    <i class="fas fa-user"></i>
                </div>
                <h2 class="welcome mb-1">Welcome, <%= user.getName() %>!</h2>
                <p class="mb-0 opacity-75">Your Profile Dashboard</p>
            </div>

            <div class="card-body">

                <div class="info-item">
                    <div class="info-icon"><i class="fas fa-user"></i></div>
                    <span class="info-label">Full Name:</span>
                    <strong><%= user.getName() %></strong>
                </div>

                <div class="info-item">
                    <div class="info-icon"><i class="fas fa-envelope"></i></div>
                    <span class="info-label">Email:</span>
                    <strong><%= user.getEmail() %></strong>
                </div>

                <div class="info-item">
                    <div class="info-icon"><i class="fas fa-phone"></i></div>
                    <span class="info-label">Mobile:</span>
                    <strong><%= user.getMobile() %></strong>
                </div>

                <div class="info-item">
                    <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                    <span class="info-label">Address:</span>
                    <strong><%= user.getAddress() %></strong>
                </div>

                <hr class="my-4">

                <div class="text-center">
                    <a href="LogoutServlet" class="btn btn-logout text-white">
                        <i class="fas fa-sign-out-alt me-2"></i> Logout
                    </a>
                </div>

            </div>
        </div>
    </div>

</body>
</html>