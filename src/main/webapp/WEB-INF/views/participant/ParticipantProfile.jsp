<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#0a0a0f;--surface:#13131a;--surface2:#1c1c27;--border:#2a2a3d;
	--accent:#7c3aed;--text:#e2e8f0;--muted:#64748b;
}
body{font-family:'Syne',sans-serif;background:var(--bg);color:var(--text)}
.page{max-width:980px;margin:0 auto;padding:24px 20px 40px}
.top{display:flex;justify-content:space-between;align-items:flex-end;gap:12px;flex-wrap:wrap}
.back{color:var(--muted);text-decoration:none;font-weight:700}
.title{font-size:30px}
.sub{font-size:14px;color:var(--muted);margin-top:6px}
.msg{margin-top:12px;padding:10px 12px;border-radius:10px;font-size:14px}
.ok{background:rgba(34,197,94,.14);border:1px solid rgba(34,197,94,.4);color:#86efac}
.err{background:rgba(239,68,68,.12);border:1px solid rgba(239,68,68,.35);color:#fca5a5}
.card{margin-top:16px;background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:16px}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.group{margin-top:8px}
.group label{display:block;font-size:13px;color:#aabed0;margin-bottom:6px}
.group input,.group select{width:100%;height:42px;border-radius:10px;border:1px solid var(--border);background:var(--surface2);color:var(--text);padding:0 12px;font-family:'Syne',sans-serif}
.group input[readonly]{opacity:.75}
.full{grid-column:1/-1}
.btn{margin-top:14px;border:0;border-radius:10px;background:linear-gradient(135deg,var(--accent),#5b27bd);color:#fff;height:42px;padding:0 16px;font-weight:700;cursor:pointer}
@media(max-width:760px){.grid{grid-template-columns:1fr}.title{font-size:26px}}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="top">
			<div>
				<a class="back" href="/participant/home">&larr; Back to Home</a>
				<h1 class="title">My Profile</h1>
				<p class="sub">View and update your participant profile details.</p>
			</div>
		</div>

		<c:if test="${success == 'updated'}"><div class="msg ok">Profile updated successfully.</div></c:if>
		<c:if test="${error == 'invalidName'}"><div class="msg err">First name and last name are required.</div></c:if>

		<div class="card">
			<form action="/participant/profile/save" method="post">
				<div class="grid">
					<div class="group">
						<label>First Name</label>
						<input type="text" name="firstName" value="${user.firstName}" required>
					</div>
					<div class="group">
						<label>Last Name</label>
						<input type="text" name="lastName" value="${user.lastName}" required>
					</div>
					<div class="group">
						<label>Email</label>
						<input type="email" value="${user.email}" readonly>
					</div>
					<div class="group">
						<label>Contact Number</label>
						<input type="text" name="contactNum" value="${user.contactNum}">
					</div>
					<div class="group">
						<label>Gender</label>
						<select name="gender">
							<option value="">Select gender</option>
							<option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
							<option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
							<option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
						</select>
					</div>
					<div class="group">
						<label>Birth Year</label>
						<input type="number" name="birthYear" min="1950" max="2100" value="${user.birthYear}">
					</div>
					<div class="group">
						<label>Qualification</label>
						<input type="text" name="qualification" value="${user.qualification}">
					</div>
					<div class="group">
						<label>Designation</label>
						<input type="text" name="designation" value="${user.designation}">
					</div>
					<div class="group full">
						<label>Organization</label>
						<input type="text" name="organization" value="${user.organization}">
					</div>
					<div class="group">
						<label>City</label>
						<input type="text" name="city" value="${userDetail.city}">
					</div>
					<div class="group">
						<label>State</label>
						<input type="text" name="state" value="${userDetail.state}">
					</div>
					<div class="group full">
						<label>Country</label>
						<input type="text" name="country" value="${userDetail.country}">
					</div>
				</div>
				<button class="btn" type="submit">Save Profile</button>
			</form>
		</div>
	</div>
</body>
</html>
