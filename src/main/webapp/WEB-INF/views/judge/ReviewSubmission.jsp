<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Review Submission</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#f2f7fb;
	--surface:#ffffff;
	--line:#dce8f4;
	--text:#11243b;
	--muted:#617892;
	--primary:#0f9d94;
	--primary-dark:#0d837b;
}
body{font-family:'Space Grotesk',sans-serif;background:var(--bg);color:var(--text)}
.wrap{max-width:940px;margin:0 auto;padding:22px 16px 32px}
.head{display:flex;justify-content:space-between;align-items:flex-end;gap:10px;flex-wrap:wrap}
.head h1{font-family:'Sora',sans-serif;font-size:31px;line-height:1.15}
.back{color:#1f4264;text-decoration:none;font-weight:700}
.card{margin-top:14px;background:var(--surface);border:1px solid var(--line);border-radius:14px;padding:16px}
.meta{display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:10px}
.meta-box{border:1px solid #e4edf7;background:#f9fcff;border-radius:10px;padding:10px}
.meta-label{font-size:12px;text-transform:uppercase;color:var(--muted);letter-spacing:.4px}
.meta-val{margin-top:5px;font-weight:700;color:#1a3553}
.links{margin-top:10px;display:flex;gap:8px;flex-wrap:wrap}
.link-btn{display:inline-block;text-decoration:none;padding:8px 11px;border-radius:8px;border:1px solid #bdd4e9;background:#f0f8ff;color:#184972;font-weight:700;font-size:13px}
.form-grid{margin-top:12px;display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:12px}
.group label{display:block;font-size:13px;color:#365471;font-weight:700;margin-bottom:6px}
.group input,.group select{width:100%;height:42px;border-radius:9px;border:1px solid #c9dced;background:#fff;padding:0 10px;font-size:14px;color:#17334f}
.helper{font-size:12px;color:var(--muted);margin-top:5px}
.actions{display:flex;gap:8px;flex-wrap:wrap;margin-top:14px}
.btn{display:inline-block;border:0;border-radius:9px;padding:10px 14px;font-weight:700;text-decoration:none;cursor:pointer}
.btn-primary{background:var(--primary);color:#fff}
.btn-primary:hover{background:var(--primary-dark)}
.btn-muted{background:#eef4fb;border:1px solid #d3e1ee;color:#2a4f71}
@media (max-width:600px){.head h1{font-size:26px}}
</style>
</head>
<body>
	<div class="wrap">
		<div class="head">
			<div>
				<a class="back" href="/judge/submissions">&larr; Back to Submissions</a>
				<h1>Review Team Submission</h1>
			</div>
		</div>

		<div class="card">
			<div class="meta">
				<div class="meta-box">
					<div class="meta-label">Hackathon</div>
					<div class="meta-val">${hackathon.title}</div>
				</div>
				<div class="meta-box">
					<div class="meta-label">Team</div>
					<div class="meta-val">${team.teamName}</div>
				</div>
				<div class="meta-box">
					<div class="meta-label">Submitted Date</div>
					<div class="meta-val">${submission.submitedDate}</div>
				</div>
			</div>

			<div class="links">
				<a class="link-btn" href="${submission.codeBaseUrl}" target="_blank">Open Code Base</a>
				<a class="link-btn" href="${submission.documentationUrl}" target="_blank">Open Documentation</a>
			</div>
		</div>

		<div class="card">
			<form action="/judge/submissions/review/save" method="post">
				<input type="hidden" name="hackathonResultId" value="${result.hackathonResultId}">
				<input type="hidden" name="hackathonId" value="${submission.hackathonId}">
				<input type="hidden" name="teamId" value="${submission.teamId}">

				<div class="form-grid">
					<div class="group">
						<label>Innovation (1-10)</label>
						<input type="number" name="innovation" min="1" max="10" value="${result.innovation}" required>
						<div class="helper">How unique and creative is the solution?</div>
					</div>
					<div class="group">
						<label>Implementation (1-10)</label>
						<input type="number" name="implementation" min="1" max="10" value="${result.implementation}" required>
						<div class="helper">How complete and functional is the build?</div>
					</div>
					<div class="group">
						<label>Coding Standard (1-10)</label>
						<input type="number" name="codingStandard" min="1" max="10" value="${result.codingStandard}" required>
						<div class="helper">Code quality, readability, and maintainability.</div>
					</div>
					<div class="group">
						<label>Round</label>
						<select name="round" required>
							<option value="">Select Round</option>
							<option value="ROUND_1" ${result.round == 'ROUND_1' ? 'selected' : ''}>Round 1</option>
							<option value="ROUND_2" ${result.round == 'ROUND_2' ? 'selected' : ''}>Round 2</option>
							<option value="FINAL" ${result.round == 'FINAL' ? 'selected' : ''}>Final</option>
						</select>
					</div>
				</div>

				<div class="actions">
					<button type="submit" class="btn btn-primary">Save Review</button>
					<a href="/judge/submissions" class="btn btn-muted">Cancel</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
