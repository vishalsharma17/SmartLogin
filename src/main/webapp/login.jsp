<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Login</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow p-4">

<h3 class="text-center">Login Portal</h3>

<form action="LoginServlet" method="post">

<div class="mb-3">
<label>Username</label>
<input type="text" name="username"
class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password"
class="form-control" required>
</div>

<button class="btn btn-primary w-100">
Login
</button>

</form>

</div>

</div>
<div class="text-center mt-3">
<a href="register.jsp" class="btn btn-success">
Register
</a>
</div>
</body>
</html>