<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<title>Register</title>

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card p-4 shadow">

<h3 class="text-center">User Registration</h3>

<form action="RegisterServlet" method="post">

<div class="mb-3">
<label>Name</label>
<input type="text" name="username"
class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email"
class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password"
class="form-control" required>
</div>

<button class="btn btn-primary w-100">
Register
</button>

</form>

</div>

</div>

</body>
</html>