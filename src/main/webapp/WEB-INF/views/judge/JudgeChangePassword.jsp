<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Judge - Change Password</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#f2f7fb;--line:#dce8f4;--text:#11243b;--muted:#617892;
	--surface:#fff;--primary:#0f9d94;
}
body{font-family:'Space Grotesk',sans-serif;min-height:100vh;background:radial-gradient(circle at 12% 8%, #d9edf5 0%, transparent 35%),radial-gradient(circle at 90% 10%, #ffe8d8 0%, transparent 32%),var(--bg)}
.page{
	min-height:100vh;
	display:flex;
	flex-direction:column;
	align-items:center;
	padding:22px 12px;
}
.card{width:min(500px,92vw);background:var(--surface);border:1px solid var(--line);border-radius:18px;padding:22px;box-shadow:0 14px 34px rgba(17,36,59,.10)}
h2{font-family:'Sora',sans-serif}
p{margin-top:8px;color:var(--muted);line-height:1.6}
.group{margin-top:12px}
label{display:block;font-size:13px;margin-bottom:6px;color:#4d657f}
input{width:100%;height:44px;border:1px solid #d5e3f0;border-radius:10px;padding:0 12px}
input:focus{outline:none;border-color:#0f9d94;box-shadow:0 0 0 3px rgba(15,157,148,.16)}
button{margin-top:14px;width:100%;height:44px;border:0;border-radius:10px;background:#0f9d94;color:#fff;font-weight:700;cursor:pointer}
.err{margin-top:10px;padding:8px 10px;border-radius:8px;background:#fff2f2;border:1px solid #ffcaca;color:#cb2f2f;font-size:14px}
.links{margin-top:10px;text-align:center}
.links a{text-decoration:none;color:#1f4264;font-weight:700;font-size:13px}
.site-footer{
	margin-top:auto;
	padding-top:14px;
	width:100%;
	text-align:center;
	color:#6f849a;
	font-size:13px;
}
</style>
</head>
<body>
	<div class="page">
		<div class="card">
			<h2>Change Password</h2>
			<p>For security, set your own password before accessing judge dashboard.</p>
			<form action="/judge/update-password" method="post">
				<div class="group">
					<label>New Password</label>
					<input type="password" name="newPassword" required>
				</div>
				<div class="group">
					<label>Confirm Password</label>
					<input type="password" name="confirmPassword" required>
				</div>
				<button type="submit">Update Password</button>
				<c:if test="${not empty error}">
					<div class="err">${error}</div>
				</c:if>
			</form>
			<div class="links"><a href="/judge-dashboard">Back to Dashboard</a></div>
		</div>
		<footer class="site-footer">CodeVerse Judge Panel</footer>
	</div>
</body>
</html>
