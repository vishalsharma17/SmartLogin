<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%

response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("user")==null){
response.sendRedirect("login.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

</head>

<body>

<div class="container mt-5">

<div class="card shadow p-4">

<h2>Welcome <%=session.getAttribute("user")%></h2>

<p>You have successfully logged in.</p>

<a href="LogoutServlet" class="btn btn-danger">
Logout
</a>

</div>

</div>

</body>
</html>