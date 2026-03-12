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

   
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            overflow: hidden;
        }

       
        body::before,
        body::after {
            content: '';
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.4;
            z-index: 0;
            animation: float 8s ease-in-out infinite;
        }

        body::before {
            width: 400px;
            height: 400px;
            background: #7c3aed;
            top: -100px;
            right: -100px;
        }

        body::after {
            width: 350px;
            height: 350px;
            background: #06b6d4;
            bottom: -80px;
            left: -80px;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(30px, -30px) scale(1.1); }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse-glow {
            0%, 100% { box-shadow: 0 0 20px rgba(124, 58, 237, 0.3); }
            50% { box-shadow: 0 0 40px rgba(124, 58, 237, 0.6); }
        }

        .dashboard-container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 520px;
            animation: fadeInUp 0.8s ease-out;
        }

      
        .avatar-section {
            text-align: center;
            margin-bottom: -50px;
            position: relative;
            z-index: 2;
        }

        .avatar-circle {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, #7c3aed, #06b6d4);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2rem;
            font-weight: 700;
            color: #fff;
            border: 4px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(124, 58, 237, 0.4);
            animation: pulse-glow 3s ease-in-out infinite;
            text-transform: uppercase;
        }

       
        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            padding: 70px 36px 36px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        .welcome-text {
            text-align: center;
            margin-bottom: 8px;
            font-size: 1.5rem;
            font-weight: 700;
            color: #ffffff;
            letter-spacing: -0.02em;
        }

        .welcome-text span {
            background: linear-gradient(135deg, #a78bfa, #67e8f9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.85rem;
            font-weight: 400;
            margin-bottom: 32px;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }

       
        .info-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 32px;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 14px 18px;
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.06);
            border-radius: 14px;
            transition: all 0.3s ease;
            animation: slideInLeft 0.6s ease-out both;
        }

        .info-item:nth-child(1) { animation-delay: 0.1s; }
        .info-item:nth-child(2) { animation-delay: 0.2s; }
        .info-item:nth-child(3) { animation-delay: 0.3s; }
        .info-item:nth-child(4) { animation-delay: 0.4s; }

        .info-item:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(124, 58, 237, 0.3);
            transform: translateX(6px);
        }

        .info-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            flex-shrink: 0;
        }

        .info-icon.name { background: rgba(124, 58, 237, 0.2); color: #a78bfa; }
        .info-icon.email { background: rgba(6, 182, 212, 0.2); color: #67e8f9; }
        .info-icon.mobile { background: rgba(16, 185, 129, 0.2); color: #6ee7b7; }
        .info-icon.address { background: rgba(251, 146, 60, 0.2); color: #fdba74; }

        .info-content {
            flex: 1;
            min-width: 0;
        }

        .info-label {
            font-size: 0.7rem;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.4);
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 2px;
        }

        .info-value {
            font-size: 0.95rem;
            font-weight: 500;
            color: #ffffff;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

       
        .btn-group {
            display: flex;
            gap: 12px;
        }

        .btn-custom {
            flex: 1;
            padding: 14px 20px;
            border-radius: 14px;
            font-family: 'Inter', sans-serif;
            font-size: 0.9rem;
            font-weight: 600;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
            text-decoration: none;
            letter-spacing: -0.01em;
        }

        .btn-edit {
            background: linear-gradient(135deg, #7c3aed, #6d28d9);
            color: #fff;
            box-shadow: 0 4px 20px rgba(124, 58, 237, 0.3);
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(124, 58, 237, 0.5);
            color: #fff;
        }

        .btn-logout {
            background: rgba(255, 255, 255, 0.06);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-logout:hover {
            background: rgba(239, 68, 68, 0.15);
            border-color: rgba(239, 68, 68, 0.3);
            color: #fca5a5;
            transform: translateY(-2px);
        }

      
        @media (max-width: 576px) {
            body { padding: 1rem; }
            .glass-card { padding: 60px 20px 24px; }
            .btn-group { flex-direction: column; }
            .welcome-text { font-size: 1.25rem; }
            .avatar-circle { width: 80px; height: 80px; font-size: 1.8rem; }
            .avatar-section { margin-bottom: -40px; }
            .glass-card { padding-top: 56px; }
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
       
        <div class="avatar-section">
            <div class="avatar-circle">
                <%= user.getName().substring(0, 1) %>
            </div>
        </div>

       
        <div class="glass-card">
            <h1 class="welcome-text">Welcome, <span><%= user.getName() %></span>!</h1>
            <p class="subtitle">Your Profile Dashboard</p>

           
            <div class="info-list">
                <div class="info-item">
                    <div class="info-icon name">
                        <i class="bi bi-person-fill"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Full Name</div>
                        <div class="info-value"><%= user.getName() %></div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon email">
                        <i class="bi bi-envelope-fill"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Email</div>
                        <div class="info-value"><%= user.getEmail() %></div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon mobile">
                        <i class="bi bi-phone-fill"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Mobile</div>
                        <div class="info-value"><%= user.getMobile() %></div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon address">
                        <i class="bi bi-geo-alt-fill"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Address</div>
                        <div class="info-value"><%= user.getAddress() %></div>
                    </div>
                </div>
            </div>

         
            <div class="btn-group">
                <a href="editProfile.jsp" class="btn-custom btn-edit">
                    <i class="bi bi-pencil-square"></i>
                    Edit Profile
                </a>
                <a href="LogoutServlet" class="btn-custom btn-logout">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>
            </div>
        </div>
    </div>

</body>
</html>
