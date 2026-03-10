<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - Account Created</title>
    
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Font - Inter (clean & modern) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 1rem;
        }
        
        .success-card {
            max-width: 480px;
            width: 100%;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
            overflow: hidden;
            border: 1px solid rgba(0, 123, 255, 0.12);
        }
        
        .success-header {
            background: linear-gradient(90deg, #198754, #2ecc71);
            color: white;
            padding: 2.5rem 1.5rem;
            text-align: center;
        }
        
        .success-icon {
            font-size: 3.8rem;
            margin-bottom: 1rem;
            animation: pop 0.6s ease-out;
        }
        
        .success-body {
            padding: 2rem 2.5rem;
            text-align: center;
        }
        
        .countdown {
            font-size: 1.1rem;
            color: #6c757d;
            margin-top: 1.5rem;
        }
        
        @keyframes pop {
            0% { transform: scale(0.6); opacity: 0; }
            60% { transform: scale(1.15); }
            100% { transform: scale(1); opacity: 1; }
        }
        
        @media (max-width: 576px) {
            .success-body { padding: 1.8rem 1.5rem; }
        }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="success-header">
            <div class="success-icon">🎉</div>
            <h2 class="mb-1 fw-semibold">Account Created Successfully!</h2>
            <p class="mb-0 opacity-90">Welcome aboard — you're all set</p>
        </div>
        
        <div class="success-body">
            <p class="lead text-muted mb-4">
                Your registration was successful.<br>
                Redirecting you to the login page...
            </p>
            
            <div class="progress mb-3" style="height: 8px;">
                <div class="progress-bar bg-success" id="progressBar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            
            <div class="countdown">
                Redirecting in <span id="count">3</span> seconds...
            </div>
        </div>
    </div>

    <script>
        // Countdown + smooth progress bar
        let timeLeft = 3;
        const countdownEl = document.getElementById('count');
        const progressBar = document.getElementById('progressBar');

        const timer = setInterval(() => {
            timeLeft--;
            countdownEl.textContent = timeLeft;
            
            // Progress bar fills smoothly
            const progress = ((3 - timeLeft) / 3) * 100;
            progressBar.style.width = progress + '%';
            
            if (timeLeft <= 0) {
                clearInterval(timer);
                window.location.href = "login.jsp";
            }
        }, 1000);

        // Start progress immediately
        progressBar.style.width = '0%';
    </script>

</body>
</html>