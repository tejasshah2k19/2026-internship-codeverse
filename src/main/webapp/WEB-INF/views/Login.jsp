<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeVerse | Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=Sora:wght@500;600;700&display=swap"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

:root {
	--bg: #f3f7fb;
	--surface: #ffffff;
	--surface-soft: #f7fbff;
	--text: #10233a;
	--muted: #5f748d;
	--border: #d9e5f1;
	--primary: #0f9d94;
	--primary-dark: #0a7f78;
	--accent: #ff8a3d;
	--ring: rgba(15, 157, 148, 0.2);
	--danger: #d53939;
	--danger-bg: #fff1f1;
	--shadow: 0 20px 45px rgba(16, 35, 58, 0.12);
}

body {
	margin: 0;
	font-family: 'Space Grotesk', sans-serif;
	background: radial-gradient(circle at 14% 6%, #d7eef5 0%, transparent 38%),
		radial-gradient(circle at 86% 16%, #ffe8d7 0%, transparent 36%), var(--bg);
	color: var(--text);
	min-height: 100vh;
}

.page {
	max-width: 1120px;
	margin: 0 auto;
	padding: 28px 18px 40px;
}

.topbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
}

.brand {
	display: inline-flex;
	align-items: center;
	gap: 10px;
	text-decoration: none;
	color: var(--text);
	font-family: 'Sora', sans-serif;
	font-weight: 700;
	font-size: 20px;
}

.brand-bolt {
	width: 34px;
	height: 34px;
	border-radius: 10px;
	background: linear-gradient(135deg, var(--primary), #11b7ab);
	display: grid;
	place-items: center;
	color: #fff;
	box-shadow: 0 10px 22px rgba(15, 157, 148, 0.35);
}

.topbar a {
	color: var(--primary-dark);
	font-weight: 600;
	text-decoration: none;
}

.shell {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 24px;
	align-items: start;
}

.hero {
	background: linear-gradient(165deg, #0f9d94 0%, #127fcb 100%);
	color: #fff;
	border-radius: 24px;
	padding: 30px;
	min-height: 380px;
	position: sticky;
	top: 20px;
	box-shadow: var(--shadow);
	overflow: hidden;
}

.hero:before, .hero:after {
	content: "";
	position: absolute;
	border-radius: 999px;
	opacity: 0.3;
}

.hero:before {
	width: 220px;
	height: 220px;
	background: #45d4ca;
	right: -80px;
	top: -90px;
}

.hero:after {
	width: 180px;
	height: 180px;
	background: #ffd38a;
	left: -70px;
	bottom: -80px;
}

.hero h1 {
	margin: 0 0 12px;
	font-family: 'Sora', sans-serif;
	font-size: clamp(28px, 4vw, 38px);
	line-height: 1.15;
	position: relative;
	z-index: 1;
}

.hero p {
	margin: 0;
	color: rgba(255, 255, 255, 0.9);
	line-height: 1.7;
	position: relative;
	z-index: 1;
}

.hero-points {
	margin-top: 24px;
	display: grid;
	gap: 12px;
	position: relative;
	z-index: 1;
}

.point {
	background: rgba(255, 255, 255, 0.17);
	border: 1px solid rgba(255, 255, 255, 0.34);
	border-radius: 12px;
	padding: 10px 12px;
	font-size: 14px;
}

.form-card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 24px;
	box-shadow: var(--shadow);
	padding: 24px;
	animation: cardIn 0.45s ease;
}

@keyframes cardIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.form-head h2 {
	margin: 0;
	font-family: 'Sora', sans-serif;
	font-size: 28px;
}

.form-head p {
	margin: 8px 0 0;
	color: var(--muted);
}

form {
	margin-top: 18px;
}

.group {
	margin-bottom: 14px;
}

.group label {
	display: block;
	font-weight: 600;
	font-size: 13px;
	margin-bottom: 7px;
}

.group input {
	width: 100%;
	height: 44px;
	padding: 10px 12px;
	border: 1px solid var(--border);
	border-radius: 12px;
	background: var(--surface-soft);
	font-family: 'Space Grotesk', sans-serif;
	font-size: 14px;
	color: var(--text);
	transition: border-color .2s, box-shadow .2s, background-color .2s;
}

.group input:focus {
	outline: none;
	border-color: var(--primary);
	box-shadow: 0 0 0 4px var(--ring);
	background: #fff;
}

.btn {
	width: 100%;
	height: 46px;
	border: 0;
	border-radius: 12px;
	background: linear-gradient(135deg, var(--primary), var(--primary-dark));
	color: #fff;
	font-family: 'Sora', sans-serif;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: transform .15s ease;
	box-shadow: 0 12px 24px rgba(15, 157, 148, 0.28);
}

.btn:hover {
	transform: translateY(-1px);
}

.error {
	margin: 14px 0 0;
	background: var(--danger-bg);
	border: 1px solid #ffc9c9;
	color: var(--danger);
	padding: 10px 12px;
	border-radius: 10px;
	font-size: 14px;
}

.foot {
	margin-top: 14px;
	text-align: center;
	font-size: 14px;
	color: var(--muted);
}

.foot a {
	color: var(--primary-dark);
	font-weight: 700;
	text-decoration: none;
}

@media ( max-width : 992px) {
	.shell {
		grid-template-columns: 1fr;
	}
	.hero {
		position: relative;
		top: 0;
		min-height: auto;
	}
}
</style>
</head>
<body>
	<div class="page">
		<div class="topbar">
			<a class="brand" href="home">
				<span class="brand-bolt">⚡</span>CodeVerse
			</a>
			<a href="signup">Need an account? Sign up</a>
		</div>

		<div class="shell">
			<section class="hero">
				<h1>Welcome Back to CodeVerse</h1>
				<p>Log in to manage hackathons, collaborate with teams, and keep your innovation streak alive.</p>
				<div class="hero-points">
					<div class="point">Track event registrations and status</div>
					<div class="point">Manage hackathon descriptions and prizes</div>
					<div class="point">Monitor your community activity</div>
				</div>
			</section>

			<section class="form-card">
				<div class="form-head">
					<h2>Sign In</h2>
					<p>Enter your credentials to continue.</p>
				</div>

				<form action="authenticate" method="post">
					<div class="group">
						<label>Email</label>
						<input type="email" name="email" required>
					</div>
					<div class="group">
						<label>Password</label>
						<input type="password" name="password" required>
					</div>
					<button type="submit" class="btn">Login to Dashboard</button>

					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
				</form>
				<div class="foot">Don't have an account? <a href="signup">Create one</a></div>
			</section>
		</div>
	</div>
</body>
</html>
