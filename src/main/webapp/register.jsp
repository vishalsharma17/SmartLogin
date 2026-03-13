<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Account | MyApp</title>


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
	opacity: 0.35;
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
	transform: translate(0, 0) scale(1);
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
)
scale(
1.08
);
}
}
.login-container {
	position: relative;
	z-index: 1;
	width: 100%;
	max-width: 460px;
	animation: fadeInUp .7s ease-out;
}

@
keyframes fadeInUp {
	from {opacity: 0;
	transform: translateY(35px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

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
	background: linear-gradient(135deg, #7c3aed, #06b6d4);
	display: inline-flex;
	align-items: center;
	justify-content: center;
	font-size: 2rem;
	color: #fff;
	border: 4px solid rgba(255, 255, 255, 0.15);
	box-shadow: 0 8px 32px rgba(124, 58, 237, 0.4);
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
	font-size: 0.85rem;
	margin-bottom: 28px;
}

.form-group {
	margin-bottom: 18px;
}

.form-label-custom {
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

.input-custom {
	width: 100%;
	padding: 14px 16px 14px 46px;
	background: rgba(255, 255, 255, 0.04);
	border: 1px solid rgba(255, 255, 255, 0.08);
	border-radius: 14px;
	color: #fff;
	outline: none;
}

.input-custom::placeholder {
	color: rgba(255, 255, 255, 0.25);
}

.input-custom:focus {
	border-color: #7c3aed;
	box-shadow: 0 0 0 3px rgba(124, 58, 237, 0.15);
}

.btn-register {
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

.btn-register:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 30px rgba(124, 58, 237, 0.5);
}

.btn-send-otp {
	padding: 14px 18px;
	border: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #7c3aed, #6d28d9);
	color: #fff;
	font-weight: 600;
	font-size: 0.85rem;
	cursor: pointer;
	white-space: nowrap;
	transition: .3s;
}

.btn-send-otp:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(124, 58, 237, 0.45);
}

.bottom-links {
	text-align: center;
	margin-top: 20px;
}

.bottom-links p {
	color: rgba(255, 255, 255, 0.4);
	font-size: .85rem;
}

.link-custom {
	color: #a78bfa;
	text-decoration: none;
	font-weight: 500;
}

.link-custom:hover {
	color: #c4b5fd;
}
</style>
<script>

function sendOtp() {

    var mobile = document.getElementById("mobile").value;

    if (mobile.length != 10) {

        alert("Enter valid 10 digit mobile number");

        return;

    }
    fetch("SendOtpServlet?mobile=" + mobile)
    .then(res => res.text())
    .then(data => {
        if (data.trim() === "OK") {
            alert("OTP sent successfully");
        } else {
            alert("Failed to send OTP, please try again");
        }
    })

    .catch(() => {
        alert("Network error, please try again");
    });

}

function validateOtp() {

    var otp = document.getElementById("otp").value;

    if (otp.length !== 6) {

        alert("Please enter 6 digit OTP");

        return;

    }

    fetch("ValidateOtpServlet?otp=" + otp)

    .then(res => res.text())

    .then(data => {

        if (data.trim() === "OK") {

            alert("OTP matched successfully");

        } else {

            alert("Invalid OTP, please try again");

        }

    })

    .catch(() => {

        alert("Network error, please try again");

    });

}

</script>

</head>

<body>

	<div class="login-container">

		<div class="icon-section">
			<div class="icon-circle">
				<i class="bi bi-person-plus-fill"></i>
			</div>
		</div>

		<div class="glass-card">

			<h1 class="card-title">
				<span>Create Account</span>
			</h1>
			<p class="card-subtitle">Register to get started</p>

			<form action="RegisterServlet" method="post">

				<div class="form-group">
					<label class="form-label-custom">Full Name</label>
					<div class="input-wrapper">
						<input type="text" name="name" class="input-custom"
							placeholder="Enter your name" required> <i
							class="bi bi-person-fill"></i>
					</div>
				</div>

				<div class="form-group">
					<label class="form-label-custom">Email</label>
					<div class="input-wrapper">
						<input type="email" name="email" class="input-custom"
							placeholder="you@example.com" required> <i
							class="bi bi-envelope-fill"></i>
					</div>
				</div>

				
				<div class="form-group">
					<label class="form-label-custom">Mobile</label>
					<div class="input-wrapper" style="display: flex; gap: 10px;">
						<div style="position: relative; flex: 1;">
							<input type="text" name="mobile" id="mobile" class="input-custom"
								placeholder="10 digit mobile number" maxlength="10"
								pattern="[0-9]{10}" inputmode="numeric"
								oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
							<i class="bi bi-phone-fill"
								style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: rgba(255, 255, 255, 0.3);"></i>
						</div>
						<button type="button" onclick="sendOtp()" class="btn-send-otp">
							<i class="bi bi-send-fill"></i> Send OTP
						</button>
					</div>
				</div>

				<!-- OTP Field -->
				<div class="form-group">
					<label class="form-label-custom">Enter OTP</label>
					<div class="input-wrapper" style="display: flex; gap: 10px;">
						<div style="position: relative; flex: 1;">
							<input type="text" name="otp" id="otp" class="input-custom"
								placeholder="Enter 6 digit OTP" maxlength="6"
								inputmode="numeric"
								oninput="this.value=this.value.replace(/[^0-9]/g,'')"> <i
								class="bi bi-shield-lock-fill"
								style="position: absolute; left: 16px; top: 50%; transform: translateY(-50%); color: rgba(255, 255, 255, 0.3);"></i>
						</div>
						<button type="button" onclick="validateOtp()" class="btn-send-otp">
							<i class="bi bi-check-lg"></i> Validate OTP
						</button>
					</div>
				</div>

				<div class="form-group">
					<label class="form-label-custom">Address</label>
					<div class="input-wrapper">
						<input type="text" name="address" class="input-custom"
							placeholder="Enter address" required> <i
							class="bi bi-geo-alt-fill"></i>
					</div>
				</div>

				<div class="form-group">
					<label class="form-label-custom">Password</label>
					<div class="input-wrapper">
						<input type="password" name="password" class="input-custom"
							placeholder="Create password" required> <i
							class="bi bi-lock-fill"></i>
					</div>
				</div>

				<button type="submit" class="btn-register">
					<i class="bi bi-person-plus-fill"></i> Register
				</button>

			</form>

			<div class="bottom-links">
				<p>Already have an account?</p>
				<a href="login.jsp" class="link-custom"> <i
					class="bi bi-box-arrow-in-right"></i> Login Here
				</a>
			</div>

		</div>
	</div>

</body>
</html>