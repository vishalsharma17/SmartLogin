<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login | MyApp</title>

    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
    font-family: 'Inter', sans-serif;
    min-height: 100vh;
    
    background-image: url("images/logo.png");
    
    background-size:     250px auto;       
    background-position: center top 40px;  
    background-repeat:   no-repeat;
    
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    overflow: hidden;
}

 /* body {
            font-family: 'Inter', sans-serif;
           min-height:100vh;

    background-image: url("images/smartlogin-bg.png");
    background-size: cover;
   background-position: center -100px;
    background-repeat: no-repeat;

            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            overflow: hidden;
        } */


        body::before, body::after {
            content: '';
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.35;
            z-index: 0;
            animation: float 8s ease-in-out infinite;
        }

        body::before {
            width: 380px; height: 380px;
            background: #7c3aed;
            top: -80px; left: -80px;
        }

        body::after {
            width: 320px; height: 320px;
            background: #06b6d4;
            bottom: -60px; right: -60px;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(25px, -25px) scale(1.08); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(35px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-8px); }
            40% { transform: translateX(8px); }
            60% { transform: translateX(-5px); }
            80% { transform: translateX(5px); }
        }

        .login-container {
    position: relative;
    z-index: 1;

    width: 90%;
    max-width: 420px;
}

      
        .icon-section {
            text-align: center;
            margin-bottom: -44px;
            position: relative;
            z-index: 2;
        }

        .icon-circle {
            width: 88px; height: 88px;
            border-radius: 50%;
            background: linear-gradient(135deg, #7c3aed, #06b6d4);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: #fff;
            border: 4px solid rgba(255,255,255,0.15);
            box-shadow: 0 8px 32px rgba(124,58,237,0.4);
            animation: pulse-glow 3s ease-in-out infinite;
        }

        @keyframes pulse-glow {
            0%, 100% { box-shadow: 0 0 20px rgba(124,58,237,0.3); }
            50% { box-shadow: 0 0 40px rgba(124,58,237,0.6); }
        }

       
       .glass-card{
    background: rgba(0,0,0,0.55);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(24px);
    border: 1px solid rgba(255,255,255,0.15);
    border-radius: 24px;
    padding: 50px 30px 30px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.40);
}

        .card-title {
            text-align: center;
            font-size: 1.6rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 4px;
            letter-spacing: -0.02em;
        }

        .card-title span {
            background: linear-gradient(135deg, #a78bfa, #67e8f9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .card-subtitle {
            text-align: center;
            color: rgba(255,255,255,0.45);
            font-size: 0.85rem;
            margin-bottom: 28px;
            letter-spacing: 0.03em;
        }

       
        .alert-custom {
            background: rgba(239,68,68,0.12);
            border: 1px solid rgba(239,68,68,0.25);
            color: #fca5a5;
            border-radius: 12px;
            padding: 12px 16px;
            font-size: 0.85rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: shake 0.5s ease-in-out;
        }

        .alert-custom i { font-size: 1.1rem; color: #f87171; }

        
        .form-group {
            margin-bottom: 20px;
        }

        .form-label-custom {
            display: block;
            font-size: 0.75rem;
            font-weight: 500;
            color: rgba(255,255,255,0.5);
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 8px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255,255,255,0.3);
            font-size: 1rem;
            transition: color 0.3s;
        }

        .input-custom {
            width: 100%;
            padding: 14px 16px 14px 46px;
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 14px;
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-size: 0.92rem;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-custom::placeholder {
            color: rgba(255,255,255,0.25);
        }

        .input-custom:focus {
            border-color: rgba(124,58,237,0.5);
            background: rgba(255,255,255,0.07);
            box-shadow: 0 0 0 3px rgba(124,58,237,0.15);
        }

        .input-custom:focus + i,
        .input-wrapper:focus-within i {
            color: #a78bfa;
        }

        
        .toggle-pw {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: rgba(255,255,255,0.3);
            cursor: pointer;
            font-size: 1rem;
            transition: color 0.3s;
            padding: 0;
        }

        .toggle-pw:hover { color: rgba(255,255,255,0.7); }

       
        .btn-login {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #7c3aed, #6d28d9);
            color: #fff;
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(124,58,237,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 6px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(124,58,237,0.5);
        }

        .btn-login:active {
            transform: translateY(0);
        }

       
        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 24px 0;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(255,255,255,0.08);
        }

        .divider span {
            font-size: 0.75rem;
            color: rgba(255,255,255,0.3);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

       
        .bottom-links {
            text-align: center;
        }

        .bottom-links p {
            color: rgba(255,255,255,0.4);
            font-size: 0.85rem;
            margin-bottom: 8px;
        }

        .link-custom {
            color: #a78bfa;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem;
            transition: color 0.3s;
        }

        .link-custom:hover {
            color: #c4b5fd;
        }

        .forgot-link {
            display: inline-block;
            margin-top: 10px;
            color: rgba(255,255,255,0.35);
            text-decoration: none;
            font-size: 0.8rem;
            transition: color 0.3s;
        }

        .forgot-link:hover { color: #67e8f9; }

       
        @media (max-width: 576px) {
            body { padding: 1rem; }
            .glass-card { padding: 56px 20px 24px; }
            .card-title { font-size: 1.35rem; }
            .icon-circle { width: 76px; height: 76px; font-size: 1.7rem; }
            .icon-section { margin-bottom: -38px; }
        }
    </style>
</head>
<body>

    <div class="login-container">
       
        <div class="icon-section">
            <div class="icon-circle">
                <i class="bi bi-shield-lock-fill"></i>
            </div>
        </div>

       
        <div class="glass-card">
            <h1 class="card-title"><span>Welcome Back</span></h1>
            <p class="card-subtitle">Sign in to continue</p>

            <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
            %>
            <div class="alert-custom">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <%= msg %>
            </div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label class="form-label-custom">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" name="email" class="input-custom" placeholder="you@example.com" required autofocus>
                        <i class="bi bi-envelope-fill"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label-custom">Password</label>
                    <div class="input-wrapper">
                        <input type="password" name="password" id="pwInput" class="input-custom" placeholder="Enter your password" required>
                        <i class="bi bi-lock-fill"></i>
                        <button type="button" class="toggle-pw" onclick="togglePassword()">
                            <i class="bi bi-eye-fill" id="eyeIcon"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn-login">
                    <i class="bi bi-box-arrow-in-right"></i>
                    Login
                </button>
            </form>

            <div class="divider"><span>or</span></div>

            <div class="bottom-links">
                <p>Don't have an account?</p>
                <a href="register.jsp" class="link-custom">
                    <i class="bi bi-person-plus-fill"></i> Create New Account
                </a>
                <br>
                <a href="forgotPassword.jsp" class="forgot-link">Forgot Password?</a>
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const pw = document.getElementById('pwInput');
            const eye = document.getElementById('eyeIcon');
            if (pw.type === 'password') {
                pw.type = 'text';
                eye.classList.replace('bi-eye-fill', 'bi-eye-slash-fill');
            } else {
                pw.type = 'password';
                eye.classList.replace('bi-eye-slash-fill', 'bi-eye-fill');
            }
        }
    </script>
</body>
</html>
