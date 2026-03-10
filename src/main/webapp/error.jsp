<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error | MyApp</title>

    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #ffebee 0%, #ffcdd2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .error-card {
            max-width: 480px;
            width: 90%;
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.15);
            background: white;
        }

        .error-header {
            background: linear-gradient(90deg, #ef5350, #d32f2f);
            color: white;
            padding: 3rem 2rem;
            text-align: center;
        }

        .error-icon {
            font-size: 5rem;
            margin-bottom: 1rem;
            opacity: 0.9;
        }

        .error-body {
            padding: 2.5rem 3rem;
            text-align: center;
        }

        .error-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: #d32f2f;
            margin-bottom: 1.2rem;
        }

        .error-message {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2.5rem;
        }

        .btn-back {
            background: linear-gradient(90deg, #ef5350, #d32f2f);
            border: none;
            padding: 0.8rem 2.5rem;
            font-size: 1.1rem;
            font-weight: 500;
            border-radius: 12px;
            transition: all 0.3s;
        }

        .btn-back:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(239, 83, 80, 0.4);
        }
    </style>
</head>
<body>

    <div class="error-card card">

        <div class="error-header">
            <i class="fas fa-exclamation-triangle error-icon"></i>
            <h3 class="mb-0">Oops! Something Went Wrong</h3>
        </div>

        <div class="error-body">
            <h2 class="error-title">Error Occurred</h2>
            
            <p class="error-message">
                We're sorry, but an unexpected error has occurred.<br>
                Please try again or contact support if the problem persists.
            </p>

            <a href="login.jsp" class="btn btn-back text-white">
                <i class="fas fa-arrow-left me-2"></i> Back to Login
            </a>
        </div>

    </div>

</body>
</html>