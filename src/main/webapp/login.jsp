<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login | MyApp</title>
    
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            max-width: 420px;
            margin: auto;
        }
        
        .card-header {
            background: linear-gradient(90deg, #0288d1, #0277bd);
            color: white;
            padding: 2rem 1.5rem;
            text-align: center;
        }
        
        .card-body {
            padding: 2.5rem 2rem;
            background: white;
        }
        
        .form-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 0.5rem;
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #ced4da;
        }
        
        .form-control:focus {
            border-color: #0288d1;
            box-shadow: 0 0 0 0.25rem rgba(2, 136, 209, 0.15);
        }
        
        .btn-login {
            background: linear-gradient(90deg, #0288d1, #0277bd);
            border: none;
            padding: 0.75rem;
            font-size: 1.1rem;
            font-weight: 500;
            border-radius: 10px;
            transition: all 0.3s;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(2, 136, 209, 0.3);
        }
        
        .register-link {
            color: #0277bd;
            text-decoration: none;
            font-weight: 500;
        }
        
        .register-link:hover {
            color: #01579b;
            text-decoration: underline;
        }
        
        .text-muted-small {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="login-card card">
            <div class="card-header">
                <h3 class="mb-0">Welcome Back</h3>
                <p class="mb-0 text-white-75">Sign in to continue</p>
            </div>
            
            <div class="card-body">
                <form action="LoginServlet" method="post">
                    
                    <!-- Email -->
                    <div class="mb-4">
                        <label for="email" class="form-label">Email address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" 
                                   class="form-control" 
                                   id="email" 
                                   name="email" 
                                   placeholder="yourname@example.com" 
                                   required 
                                   autofocus>
                        </div>
                    </div>
                    
                    <!-- Password -->
                    <div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" 
                                   class="form-control" 
                                   id="password" 
                                   name="password" 
                                   placeholder="••••••••" 
                                   required>
                        </div>
                    </div>
                    
                    <!-- Login Button -->
                    <button type="submit" class="btn btn-login text-white w-100 mb-4">
                        <i class="fas fa-sign-in-alt me-2"></i> Login
                    </button>
                    
                    <!-- Register Link -->
                    <div class="text-center">
                        <p class="text-muted-small mb-2">Don't have an account yet?</p>
                        <a href="register.jsp" class="register-link">
                            <i class="fas fa-user-plus me-1"></i> Create New Account
                        </a>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional - only if you need dropdowns/tooltips etc.) -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->

</body>
</html>