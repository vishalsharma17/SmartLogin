<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Successful</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
   

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

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
            top: -100px; right: -100px;
        }

        body::after {
            width: 320px; height: 320px;
            background: #06b6d4;
            bottom: -80px; left: -80px;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0,0) scale(1); }
            50% { transform: translate(25px,-25px) scale(1.08); }
        }

      
        .particles {
            position: fixed;
            inset: 0;
            z-index: 0;
            pointer-events: none;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            width: 6px; height: 6px;
            border-radius: 50%;
            background: rgba(167,139,250,0.5);
            animation: rise linear infinite;
        }

        .particle:nth-child(1) { left: 10%; animation-duration: 4s; animation-delay: 0s; width: 4px; height: 4px; }
        .particle:nth-child(2) { left: 25%; animation-duration: 5s; animation-delay: 0.5s; background: rgba(103,232,249,0.4); }
        .particle:nth-child(3) { left: 40%; animation-duration: 3.5s; animation-delay: 1s; width: 5px; height: 5px; }
        .particle:nth-child(4) { left: 55%; animation-duration: 4.5s; animation-delay: 0.3s; background: rgba(110,231,183,0.4); }
        .particle:nth-child(5) { left: 70%; animation-duration: 3.8s; animation-delay: 0.8s; width: 4px; height: 4px; }
        .particle:nth-child(6) { left: 85%; animation-duration: 5.2s; animation-delay: 0.2s; background: rgba(103,232,249,0.3); }
        .particle:nth-child(7) { left: 50%; animation-duration: 4.2s; animation-delay: 1.2s; width: 3px; height: 3px; }
        .particle:nth-child(8) { left: 15%; animation-duration: 3.2s; animation-delay: 0.7s; background: rgba(167,139,250,0.3); }

        @keyframes rise {
            0% { bottom: -10px; opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { bottom: 110vh; opacity: 0; }
        }

      
        .success-container {
            position: relative;
            z-index: 1;
            text-align: center;
            animation: scaleIn 0.6s cubic-bezier(0.34,1.56,0.64,1);
        }

        @keyframes scaleIn {
            from { opacity: 0; transform: scale(0.7); }
            to { opacity: 1; transform: scale(1); }
        }

       
        .check-wrapper {
            margin-bottom: 28px;
            position: relative;
            display: inline-block;
        }

        .check-circle {
            width: 110px; height: 110px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(16,185,129,0.2), rgba(6,182,212,0.15));
            border: 2px solid rgba(16,185,129,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            animation: pulse-ring 2s ease-in-out infinite;
        }

        .check-circle::before {
            content: '';
            position: absolute;
            inset: -12px;
            border-radius: 50%;
            border: 1px solid rgba(16,185,129,0.1);
            animation: pulse-ring 2s ease-in-out infinite 0.3s;
        }

        .check-circle::after {
            content: '';
            position: absolute;
            inset: -24px;
            border-radius: 50%;
            border: 1px solid rgba(16,185,129,0.05);
            animation: pulse-ring 2s ease-in-out infinite 0.6s;
        }

        @keyframes pulse-ring {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.05); opacity: 0.8; }
        }

       
        .checkmark-svg {
            width: 50px; height: 50px;
        }

        .checkmark-path {
            stroke: #10b981;
            stroke-width: 3;
            stroke-linecap: round;
            stroke-linejoin: round;
            fill: none;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: draw-check 0.6s ease-out 0.4s forwards;
        }

        @keyframes draw-check {
            to { stroke-dashoffset: 0; }
        }

       
        .success-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 6px;
            letter-spacing: -0.02em;
        }

        .success-title span {
            background: linear-gradient(135deg, #6ee7b7, #67e8f9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .redirect-text {
            color: rgba(255,255,255,0.45);
            font-size: 0.88rem;
            margin-bottom: 8px;
        }

       
        .countdown {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 56px; height: 56px;
            border-radius: 50%;
            background: rgba(255,255,255,0.05);
            border: 2px solid rgba(124,58,237,0.3);
            font-size: 1.5rem;
            font-weight: 700;
            color: #a78bfa;
            margin: 12px 0 24px;
            position: relative;
        }

        .countdown::before {
            content: '';
            position: absolute;
            inset: -2px;
            border-radius: 50%;
            border: 2px solid transparent;
            border-top-color: #7c3aed;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

       
        .progress-track {
            width: 200px;
            height: 4px;
            background: rgba(255,255,255,0.08);
            border-radius: 4px;
            margin: 0 auto;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            border-radius: 4px;
            background: linear-gradient(90deg, #7c3aed, #06b6d4);
            animation: fill-bar 3s linear forwards;
        }

        @keyframes fill-bar {
            from { width: 0%; }
            to { width: 100%; }
        }

        @media (max-width: 576px) {
            .success-title { font-size: 1.4rem; }
            .check-circle { width: 90px; height: 90px; }
            .checkmark-svg { width: 40px; height: 40px; }
        }
    </style>
</head>
<body>

   
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <div class="success-container">
     
        <div class="check-wrapper">
            <div class="check-circle">
                <svg class="checkmark-svg" viewBox="0 0 24 24">
                    <path class="checkmark-path" d="M4 12.5l5.5 5.5L20 6"/>
                </svg>
            </div>
        </div>

        <h1 class="success-title"><span>Login Successful!</span></h1>
        <p class="redirect-text">Redirecting to dashboard in</p>

        <div class="countdown" id="counter">3</div>

        <div class="progress-track">
            <div class="progress-fill"></div>
        </div>
    </div>

    <script>
        let count = 3;
        const counter = document.getElementById('counter');
        const interval = setInterval(() => {
            count--;
            counter.textContent = count;
            if (count <= 0) {
                clearInterval(interval);
                window.location.href = "dashboard.jsp";
            }
        }, 1000);
    </script>
</body>
</html>
