<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Successful</title>
    
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts - optional but looks premium -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            margin: 0;
        }
        
        .success-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 3rem 2.5rem;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
            text-align: center;
            max-width: 480px;
            width: 90%;
            color: #2c3e50;
            border: 1px solid rgba(255,255,255,0.3);
        }
        
        .icon-circle {
            width: 90px;
            height: 90px;
            background: #28a745;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2.8rem;
            box-shadow: 0 8px 20px rgba(40, 167, 69, 0.35);
        }
        
        h2 {
            font-weight: 600;
            margin-bottom: 1rem;
            color: #1e3a8a;
        }
        
        .redirect-text {
            color: #555;
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
        }
        
        .countdown {
            font-size: 2.8rem;
            font-weight: 700;
            color: #28a745;
        }
        
        .spinner-border {
            width: 3rem;
            height: 3rem;
            margin-top: 1rem;
        }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="icon-circle">✓</div>
        
        <h2>Login Successful!</h2>
        
        <p class="redirect-text">Redirecting to dashboard in</p>
        
        <div class="countdown" id="countdown">3</div>
        
        <div class="spinner-border text-success" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <script>
        let seconds = 3;
        const countdownElement = document.getElementById('countdown');

        const timer = setInterval(() => {
            seconds--;
            countdownElement.textContent = seconds;

            if (seconds <= 0) {
                clearInterval(timer);
                window.location.href = "dashboard.jsp";
            }
        }, 1000);

        // Also fallback redirect after 3.5 seconds (safety)
        setTimeout(() => {
            window.location.href = "dashboard.jsp";
        }, 3500);
    </script>

</body>
</html>