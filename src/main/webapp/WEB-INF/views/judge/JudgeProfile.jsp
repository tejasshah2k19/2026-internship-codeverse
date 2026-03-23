<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Judge Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#f2f7fb;--line:#dce8f4;--text:#11243b;--muted:#617892;
	--surface:#fff;--primary:#0f9d94;--shadow:0 14px 34px rgba(17,36,59,.10);
}
body{font-family:'Space Grotesk',sans-serif;background:radial-gradient(circle at 12% 8%, #d9edf5 0%, transparent 35%),radial-gradient(circle at 90% 10%, #ffe8d8 0%, transparent 32%),var(--bg);color:var(--text)}
.wrap{max-width:940px;margin:0 auto;padding:24px 18px 34px}
.top{display:flex;justify-content:space-between;align-items:flex-end;flex-wrap:wrap;gap:10px;margin-bottom:14px}
.title{font-family:'Sora',sans-serif;font-size:32px}
.sub{font-size:14px;color:var(--muted);margin-top:6px}
.btn{display:inline-block;text-decoration:none;padding:9px 14px;border-radius:10px;font-weight:700;border:1px solid #d6e3f0;background:#fff;color:#1f4164}
.card{background:var(--surface);border:1px solid var(--line);border-radius:16px;padding:18px;box-shadow:var(--shadow)}
.row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.group label{display:block;font-size:13px;margin-bottom:6px;color:#5e738b}
.group input{width:100%;height:42px;border:1px solid #d5e3f0;border-radius:10px;padding:0 12px}
.group input:focus{outline:none;border-color:#0f9d94;box-shadow:0 0 0 3px rgba(15,157,148,.16)}
.full{grid-column:1/-1}
.avatar{width:92px;height:92px;border-radius:50%;object-fit:cover;border:3px solid #dbe7f3}
.save{margin-top:14px;width:100%;height:44px;border:0;border-radius:10px;background:linear-gradient(130deg,#0f9d94,#127fcb);color:#fff;font-weight:700;cursor:pointer}
.msg{margin-bottom:10px;padding:10px 12px;border-radius:10px;font-size:14px}
.ok{background:#eefcf2;border:1px solid #beeac9;color:#1e8a42}
.err{background:#fff1f1;border:1px solid #ffc9c9;color:#cb2f2f}
.site-footer{
	margin-top:16px;
	padding:14px 10px 4px;
	text-align:center;
	color:#6f849a;
	font-size:13px;
}
.site-footer a{
	color:#476a8f;
	text-decoration:none;
	font-weight:700;
}
@media (max-width:700px){.row{grid-template-columns:1fr}}
</style>
</head>
<body>
	<div class="wrap">
		<div class="top">
			<div>
				<h1 class="title">Judge Profile</h1>
				<p class="sub">Manage your profile details visible in assigned hackathons.</p>
			</div>
			<div style="display:flex;gap:8px;flex-wrap:wrap;">
				<a class="btn" href="/judge/change-password">Change Password</a>
				<a class="btn" href="/judge-dashboard">Back to Dashboard</a>
			</div>
		</div>

		<c:if test="${param.updated == 'true'}"><div class="msg ok">Profile updated successfully.</div></c:if>
		<c:if test="${not empty error}"><div class="msg err">${error}</div></c:if>

		<div class="card">
			<form action="/judge/profile/update" method="post" enctype="multipart/form-data">
				<div class="group full" style="display:flex;align-items:center;gap:14px;margin-bottom:6px;">
					<c:choose>
						<c:when test="${not empty judge.profilePicURL}">
							<img src="${judge.profilePicURL}" class="avatar" alt="profile">
						</c:when>
						<c:otherwise>
							<img src="/assets/images/faces/dummy.jpg" class="avatar" alt="profile">
						</c:otherwise>
					</c:choose>
					<div style="flex:1">
						<label style="display:block;font-size:13px;color:#5e738b;margin-bottom:6px;">Profile Picture</label>
						<input type="file" name="profilePic">
					</div>
				</div>

				<div class="row">
					<div class="group">
						<label>First Name</label>
						<input type="text" name="firstName" value="${judge.firstName}" required>
					</div>
					<div class="group">
						<label>Last Name</label>
						<input type="text" name="lastName" value="${judge.lastName}" required>
					</div>
					<div class="group">
						<label>Email</label>
						<input type="email" value="${judge.email}" disabled>
					</div>
					<div class="group">
						<label>Contact Number</label>
						<input type="text" name="contactNum" value="${judge.contactNum}">
					</div>
					<div class="group">
						<label>Qualification</label>
						<input type="text" name="qualification" value="${judge.qualification}">
					</div>
					<div class="group">
						<label>Designation</label>
						<input type="text" name="designation" value="${judge.designation}">
					</div>
					<div class="group full">
						<label>Organization</label>
						<input type="text" name="organization" value="${judge.organization}">
					</div>
				</div>
				<button class="save" type="submit">Save Profile</button>
			</form>
		</div>
		<footer class="site-footer">
			<div>CodeVerse Judge Panel</div>
			<div style="margin-top:4px;">Need help? <a href="/judge-dashboard">Go to Dashboard</a></div>
		</footer>
	</div>
</body>
</html>
