<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration | MyApp</title>

    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #fff3e0 0%, #ffe0b2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-card {
            max-width: 480px;
            margin: auto;
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.14);
        }

        .card-header {
            background: linear-gradient(90deg, #ff9800, #f57c00);
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
            margin: 0 auto 1.2rem;
            font-size: 2.8rem;
            border: 3px solid white;
        }

        .card-body {
            padding: 2.5rem 2.5rem;
            background: white;
        }

        .form-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 0.5rem;
        }

        .input-group-text {
            background-color: #fff8e1;
            border-right: none;
            color: #f57c00;
        }

        .form-control {
            border-radius: 10px;
            padding: 0.75rem 1rem;
            border: 1px solid #ffd180;
        }

        .form-control:focus {
            border-color: #f57c00;
            box-shadow: 0 0 0 0.25rem rgba(245, 124, 0, 0.15);
        }

        .btn-register {
            background: linear-gradient(90deg, #ff9800, #f57c00);
            border: none;
            padding: 0.8rem;
            font-size: 1.1rem;
            font-weight: 500;
            border-radius: 12px;
            transition: all 0.3s;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(245, 124, 0, 0.35);
        }

        .login-link {
            color: #f57c00;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link:hover {
            color: #ef6c00;
            text-decoration: underline;
        }

        .text-muted-small {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="register-card card">

            <div class="card-header">
                <div class="avatar-circle">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h3 class="mb-1">Create Your Account</h3>
                <p class="mb-0 text-white-75">Join us and get started</p>
            </div>

            <div class="card-body">
                <form action="RegisterServlet" method="post">

                    <!-- Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="Enter your full name" required autofocus>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email"
                                   placeholder="yourname@example.com" required>
                        </div>
                    </div>

                    <!-- Mobile -->
                    <div class="mb-3">
                        <label for="mobile" class="form-label">Mobile Number</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <input type="text" class="form-control" id="mobile" name="mobile"
                                   placeholder="10-digit mobile number" pattern="[0-9]{10}" maxlength="10" required>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            <input type="text" class="form-control" id="address" name="address"
                                   placeholder="Enter your address" required>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Create a strong password" required>
                        </div>
                    </div>

                    <!-- Register Button -->
                    <button type="submit" class="btn btn-register text-white w-100 mb-4">
                        <i class="fas fa-user-plus me-2"></i> Register Now
                    </button>

                    <!-- Login Link -->
                    <div class="text-center">
                        <p class="text-muted-small mb-2">Already have an account?</p>
                        <a href="login.jsp" class="login-link">
                            <i class="fas fa-sign-in-alt me-1"></i> Login Here
                        </a>
                    </div>

                </form>
            </div>
        </div>
    </div>

</body>
</html>