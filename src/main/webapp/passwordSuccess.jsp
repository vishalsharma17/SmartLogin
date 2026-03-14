<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Password Updated | MyApp</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">

<script>
	setTimeout(function() {
		window.location.href = "login.jsp";
	}, 3000);
</script>

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
	max-width: 420px;
}

.icon-section {
	text-align: center;
	margin-bottom: -44px;
	position: relative;
	z-index: 2;
}

.icon-circle {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	background: linear-gradient(135deg, #22c55e, #4ade80);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 2.2rem;
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
	text-align: center;
}

.success-title {
	font-size: 1.6rem;
	font-weight: 700;
	color: #fff;
	margin-bottom: 10px;
}

.success-title span {
	background: linear-gradient(135deg, #4ade80, #86efac);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.success-text {
	color: rgba(255, 255, 255, 0.5);
	font-size: .9rem;
	margin-top: 6px;
}

.btn-login {
	display: inline-block;
	margin-top: 20px;
	padding: 12px 22px;
	border-radius: 12px;
	background: linear-gradient(135deg, #7c3aed, #6d28d9);
	color: #fff;
	text-decoration: none;
	font-weight: 600;
	transition: .3s;
}

.btn-login:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 30px rgba(124, 58, 237, 0.5);
}
</style>

</head>

<body>

	<div class="container-card">

		<div class="icon-section">
			<div class="icon-circle">
				<i class="bi bi-check-circle-fill"></i>
			</div>
		</div>

		<div class="glass-card">

			<h2 class="success-title">
				<span>Password Updated Successfully</span>
			</h2>

			<p class="success-text">Redirecting to login page in 3 seconds...
			</p>

			<a href="login.jsp" class="btn-login"> <i
				class="bi bi-box-arrow-in-right"></i> Go to Login
			</a>

		</div>

	</div>

</body>
</html>