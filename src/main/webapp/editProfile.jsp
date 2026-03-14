<%@ page import="com.model.User"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
	return;
}

User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>

<title>Edit Profile | MyApp</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
	min-height: 100vh;
	background: linear-gradient(135deg, #0f0c29 0%, #302b63 50%, #24243e 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 2rem;
	overflow: hidden;
}

body::before, body::after {
	content: '';
	position: fixed;
	border-radius: 50%;
	filter: blur(80px);
	opacity: .35;
	z-index: 0;
	animation: float 8s ease-in-out infinite;
}

body::before {
	width: 380px;
	height: 380px;
	background: #7c3aed;
	top: -80px;
	left: -80px;
}

body::after {
	width: 320px;
	height: 320px;
	background: #06b6d4;
	bottom: -60px;
	right: -60px;
	animation-delay: 4s;
}

@
keyframes float { 0%,100%{
	transform: translate(0, 0);
}

50
%
{
transform
:
translate(
25px
,
-25px
);
}
}
.container-card {
	position: relative;
	z-index: 1;
	width: 100%;
	max-width: 460px;
}

.icon-section {
	text-align: center;
	margin-bottom: -44px;
	z-index: 2;
	position: relative;
}

.icon-circle {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	background: linear-gradient(135deg, #7c3aed, #06b6d4);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 2rem;
	color: #fff;
	border: 4px solid rgba(255, 255, 255, 0.15);
}

.glass-card {
	background: rgba(255, 255, 255, 0.05);
	backdrop-filter: blur(24px);
	border: 1px solid rgba(255, 255, 255, 0.1);
	border-radius: 24px;
	padding: 64px 36px 36px;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
}

.card-title {
	text-align: center;
	font-size: 1.6rem;
	font-weight: 700;
	color: #fff;
	margin-bottom: 4px;
}

.card-title span {
	background: linear-gradient(135deg, #a78bfa, #67e8f9);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.card-subtitle {
	text-align: center;
	color: rgba(255, 255, 255, 0.45);
	font-size: .85rem;
	margin-bottom: 28px;
}

.form-group {
	margin-bottom: 18px;
}

.form-label {
	font-size: .75rem;
	color: rgba(255, 255, 255, 0.5);
	margin-bottom: 6px;
	display: block;
}

.input-wrapper {
	position: relative;
}

.input-wrapper i {
	position: absolute;
	left: 16px;
	top: 50%;
	transform: translateY(-50%);
	color: rgba(255, 255, 255, 0.3);
}

.input-field {
	width: 100%;
	padding: 14px 16px 14px 46px;
	background: rgba(255, 255, 255, 0.04);
	border: 1px solid rgba(255, 255, 255, 0.08);
	border-radius: 14px;
	color: #fff;
	outline: none;
}

.input-field::placeholder {
	color: rgba(255, 255, 255, 0.25);
}

.input-field:focus {
	border-color: #7c3aed;
	box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
}

.btn-update {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #7c3aed, #6d28d9);
	color: #fff;
	font-weight: 600;
	cursor: pointer;
	transition: .3s;
	margin-top: 10px;
}

.btn-update:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 30px rgba(124, 58, 237, 0.5);
}

.back-link {
	display: block;
	text-align: center;
	margin-top: 18px;
	color: #a78bfa;
	text-decoration: none;
	font-size: .85rem;
}

.back-link:hover {
	color: #c4b5fd;
}
</style>

</head>

<body>

	<div class="container-card">

		<div class="icon-section">
			<div class="icon-circle">
				<i class="bi bi-pencil-square"></i>
			</div>
		</div>

		<div class="glass-card">

			<h1 class="card-title">
				<span>Edit Profile</span>
			</h1>
			<p class="card-subtitle">Update your personal information</p>

			<form action="UpdateProfileServlet" method="post">

				<input type="hidden" name="email" value="<%=user.getEmail()%>">

				<div class="form-group">

					<label class="form-label">Full Name</label>

					<div class="input-wrapper">

						<input type="text" name="name" class="input-field"
							placeholder="<%=user.getName()%>"> <i
							class="bi bi-person-fill"></i>

					</div>
				</div>

				<div class="form-group">

					<label class="form-label">Mobile Number</label>

					<div class="input-wrapper">

						<input type="text" name="mobile" class="input-field"
							placeholder="<%=user.getMobile()%>" maxlength="10"
							minlength="10" pattern="[0-9]{10}" inputmode="numeric"
							oninput="this.value=this.value.replace(/[^0-9]/g,'')"> <i
							class="bi bi-phone-fill"></i>

					</div>
				</div>

				<div class="form-group">

					<label class="form-label">Address</label>

					<div class="input-wrapper">

						<input type="text" name="address" class="input-field"
							placeholder="<%= user.getAddress() %>"> <i
							class="bi bi-geo-alt-fill"></i>

					</div>
				</div>

				<button type="submit" class="btn-update">

					<i class="bi bi-check-circle"></i> Update Profile

				</button>

			</form>

			<a href="dashboard.jsp" class="back-link"> <i
				class="bi bi-arrow-left"></i> Back to Dashboard

			</a>

		</div>

	</div>

</body>
</html>