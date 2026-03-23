<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hackathon Details</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#f2f7fb;--surface:#fff;--line:#dce8f4;--text:#11243b;--muted:#617892;
	--primary:#0f9d94;--primary2:#127fcb;
}
body{font-family:'Space Grotesk',sans-serif;background:var(--bg);color:var(--text)}
.wrap{max-width:1050px;margin:0 auto;padding:24px 16px 34px}
.hero{background:linear-gradient(130deg,var(--primary) 0%,var(--primary2) 100%);border-radius:16px;padding:18px;color:#fff}
.hero h1{font-family:'Sora',sans-serif;font-size:30px;line-height:1.1}
.hero p{margin-top:8px;opacity:.92}
.back{display:inline-block;margin-top:12px;color:#fff;text-decoration:none;font-weight:700;border:1px solid rgba(255,255,255,.5);padding:8px 10px;border-radius:9px}
.panel{margin-top:14px;background:var(--surface);border:1px solid var(--line);border-radius:14px;padding:16px}
.panel h3{font-family:'Sora',sans-serif;font-size:19px}
.meta{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:10px;margin-top:12px}
.meta-box{border:1px solid #e4edf7;background:#f9fcff;border-radius:10px;padding:10px}
.meta-label{font-size:12px;text-transform:uppercase;letter-spacing:.45px;color:var(--muted)}
.meta-val{margin-top:5px;font-weight:700;color:#1a3553}
.html-box{margin-top:10px;background:#f8fbfe;border:1px solid #e2ebf6;border-radius:10px;padding:12px}
.judge-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:10px;margin-top:12px}
.judge-card{border:1px solid #e4edf7;border-radius:10px;padding:10px;display:flex;align-items:center;gap:10px;background:#fff}
.avatar{width:44px;height:44px;border-radius:50%;object-fit:cover;border:2px solid #e2e8f0}
.jname{font-weight:700}
.jmail{font-size:12px;color:var(--muted)}
.jmeta{font-size:12px;color:#5f7388}
table{width:100%;border-collapse:collapse;margin-top:12px}
th,td{padding:10px 8px;border-bottom:1px solid #e6eef6;text-align:left;font-size:14px}
th{font-size:12px;color:#647c95;text-transform:uppercase;letter-spacing:.45px}
.table-responsive{overflow-x:auto}
.pill{display:inline-block;padding:4px 8px;border-radius:999px;font-size:12px;font-weight:700}
.pill.pending{background:#fff7e8;color:#a5670e}
.pill.done{background:#eaf9ef;color:#1f8a43}
.action-btn{display:inline-block;text-decoration:none;padding:7px 10px;border-radius:8px;background:#0f9d94;color:#fff;font-weight:700;font-size:12px}
@media (max-width:650px){.hero h1{font-size:25px}}
</style>
</head>
<body>
	<div class="wrap">
		<div class="hero">
			<h1>${hackathon.title}</h1>
			<p>Judge view for assigned hackathon details.</p>
			<a class="back" href="/judge-dashboard">&larr; Back to Dashboard</a>
		</div>

		<div class="panel">
			<h3>Hackathon Information</h3>
			<div class="meta">
				<div class="meta-box"><div class="meta-label">Status</div><div class="meta-val">${hackathon.status}</div></div>
				<div class="meta-box"><div class="meta-label">Event Type</div><div class="meta-val">${hackathon.eventType}</div></div>
				<div class="meta-box"><div class="meta-label">Payment</div><div class="meta-val">${hackathon.payment}</div></div>
				<div class="meta-box"><div class="meta-label">Team Size</div><div class="meta-val">${hackathon.minTeamSize} - ${hackathon.maxTeamSize}</div></div>
				<div class="meta-box"><div class="meta-label">Location</div><div class="meta-val">${hackathon.location}</div></div>
				<div class="meta-box"><div class="meta-label">Registration</div><div class="meta-val">${hackathon.registrationStartDate} to ${hackathon.registrationEndDate}</div></div>
			</div>
		</div>

		<div class="panel">
			<h3>Overview</h3>
			<p style="margin-top:10px;color:#46607a;line-height:1.7;">${hackathon.description}</p>
			<div class="html-box">
				<c:choose>
					<c:when test="${not empty hackathonDescription}">
						<c:out value="${hackathonDescription.hackathonDetails}" escapeXml="false" />
					</c:when>
					<c:otherwise>
						<span style="color:#738aa1;">No detailed description provided.</span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="panel">
			<h3>Assigned Judges</h3>
			<c:choose>
				<c:when test="${empty judgeUsers}">
					<p style="margin-top:10px;color:#738aa1;">No judges assigned.</p>
				</c:when>
				<c:otherwise>
					<div class="judge-grid">
						<c:forEach items="${judgeUsers}" var="j">
							<div class="judge-card">
								<c:choose>
									<c:when test="${not empty j.profilePicURL}">
										<img src="${j.profilePicURL}" class="avatar" alt="judge">
									</c:when>
									<c:otherwise>
										<img src="/assets/images/faces/dummy.jpg" class="avatar" alt="judge">
									</c:otherwise>
								</c:choose>
								<div>
									<div class="jname">${j.firstName} ${j.lastName}</div>
									<div class="jmail">${j.email}</div>
									<c:if test="${not empty j.designation}"><div class="jmeta">${j.designation}</div></c:if>
									<c:if test="${not empty j.organization}"><div class="jmeta">${j.organization}</div></c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="panel">
			<h3>Prize Details</h3>
			<c:choose>
				<c:when test="${empty prizeList}">
					<p style="margin-top:10px;color:#738aa1;">No prize details available.</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Prize Title</th>
									<th>Prize Description</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${prizeList}" var="p" varStatus="i">
									<tr>
										<td>${i.count}</td>
										<td>${p.prizeTitle}</td>
										<td>${p.prizeDescription}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="panel">
			<h3>Pending Submissions</h3>
			<c:choose>
				<c:when test="${empty pendingSubmissionList}">
					<p style="margin-top:10px;color:#738aa1;">No pending submissions for this hackathon.</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Team</th>
									<th>Submitted Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pendingSubmissionList}" var="s" varStatus="i">
									<tr>
										<td>${i.count}</td>
										<td>${submissionTeamMap[s.teamId].teamName}</td>
										<td>${s.submitedDate}</td>
										<td><span class="pill pending">Pending</span></td>
										<td><a class="action-btn" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">Review</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="panel">
			<h3>Reviewed Submissions</h3>
			<c:choose>
				<c:when test="${empty reviewedSubmissionList}">
					<p style="margin-top:10px;color:#738aa1;">No reviewed submissions yet for this hackathon.</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Team</th>
									<th>Submitted Date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reviewedSubmissionList}" var="s" varStatus="i">
									<tr>
										<td>${i.count}</td>
										<td>${submissionTeamMap[s.teamId].teamName}</td>
										<td>${s.submitedDate}</td>
										<td><span class="pill done">Reviewed</span></td>
										<td><a class="action-btn" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">Update Review</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
