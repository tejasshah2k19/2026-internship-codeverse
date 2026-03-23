<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Judge Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#f2f7fb;
	--surface:#ffffff;
	--text:#11243b;
	--muted:#617892;
	--line:#dce8f4;
	--primary:#0f9d94;
	--primary2:#127fcb;
	--shadow:0 16px 36px rgba(17,36,59,.10);
}
body{font-family:'Space Grotesk',sans-serif;background:radial-gradient(circle at 8% 8%, #d9edf5 0%, transparent 35%),radial-gradient(circle at 90% 8%, #ffe8d8 0%, transparent 32%),var(--bg);color:var(--text)}
.wrap{max-width:1120px;margin:0 auto;padding:26px 18px 38px}
.hero{background:linear-gradient(130deg,var(--primary) 0%,var(--primary2) 100%);border-radius:20px;padding:22px;box-shadow:var(--shadow);color:#fff}
.top{display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:12px}
.title{font-family:'Sora',sans-serif;font-size:34px;line-height:1.1}
.sub{margin-top:8px;color:rgba(255,255,255,.9)}
.btn{display:inline-block;text-decoration:none;padding:10px 14px;border-radius:10px;font-weight:700}
.btn-light{background:#fff;color:#1b3e62;border:1px solid rgba(255,255,255,.5)}
.cards{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:14px;margin-top:16px}
.card{background:var(--surface);border:1px solid var(--line);border-radius:15px;padding:17px;box-shadow:0 10px 25px rgba(17,36,59,.06)}
.label{font-size:12px;color:var(--muted);text-transform:uppercase;letter-spacing:.55px}
.num{font-size:34px;font-family:'Sora',sans-serif;margin-top:6px}
.panel{margin-top:16px;background:var(--surface);border:1px solid var(--line);border-radius:15px;padding:18px;box-shadow:0 10px 25px rgba(17,36,59,.05)}
.panel h3{font-family:'Sora',sans-serif}
.panel p{margin-top:8px;color:var(--muted);line-height:1.7}
.actions{display:flex;gap:8px;flex-wrap:wrap}
.site-footer{
	margin-top:18px;
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
.table-responsive{overflow-x:auto}
table{width:100%;border-collapse:collapse;margin-top:12px}
th,td{padding:10px 8px;border-bottom:1px solid #e6eef6;text-align:left;font-size:14px}
th{font-size:12px;color:#647c95;text-transform:uppercase;letter-spacing:.45px}
.pill{display:inline-block;padding:4px 8px;border-radius:999px;font-size:12px;font-weight:700}
.pill.pending{background:#fff7e8;color:#a5670e}
.pill.done{background:#eaf9ef;color:#1f8a43}
@media (max-width:700px){.title{font-size:28px}}
</style>
</head>
<body>
	<div class="wrap">
		<div class="hero">
			<div class="top">
				<div>
					<h1 class="title">Welcome Judge ${sessionScope.user.firstName}</h1>
					<p class="sub">Review hackathons and manage your judging tasks from one place.</p>
				</div>
				<div class="actions">
					<a class="btn btn-light" href="/judge/submissions">Review Submissions</a>
					<a class="btn btn-light" href="/judge/profile">My Profile</a>
					<a class="btn btn-light" href="/judge/change-password">Change Password</a>
					<a class="btn btn-light" href="/logout">Logout</a>
				</div>
			</div>
		</div>

		<div class="cards">
			<div class="card"><div class="label">Total Hackathons</div><div class="num">${totalHackathon}</div></div>
			<div class="card"><div class="label">Upcoming</div><div class="num">${upcomingHackathon}</div></div>
			<div class="card"><div class="label">Ongoing</div><div class="num">${ongoingHackathon}</div></div>
			<div class="card"><div class="label">Pending Submissions</div><div class="num">${pendingReviewSubmission}</div></div>
		</div>

		<div class="panel">
			<h3>Judge Workspace</h3>
			<p>Open your assigned submissions, review each team, and save round-wise scores from your judging panel.</p>
			<div class="actions" style="margin-top:12px;">
				<a class="btn btn-light" href="/judge/submissions">Go to Submission Review</a>
			</div>
		</div>

		<div class="panel">
			<h3>Ongoing Hackathons Assigned To You</h3>
			<c:choose>
				<c:when test="${empty ongoingHackathonList}">
					<p>No ongoing hackathons assigned right now.</p>
				</c:when>
				<c:otherwise>
					<div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:12px;margin-top:12px;">
						<c:forEach items="${ongoingHackathonList}" var="h">
							<div style="border:1px solid #dce8f4;border-radius:12px;padding:12px;background:#fff;">
								<div style="font-family:'Sora',sans-serif;font-size:18px;line-height:1.25;">${h.title}</div>
								<div style="color:#617892;font-size:13px;margin-top:6px;">${h.eventType} | ${h.payment}</div>
								<div style="color:#617892;font-size:13px;margin-top:4px;">${h.registrationStartDate} to ${h.registrationEndDate}</div>
								<div style="margin-top:10px;">
									<a href="/judge/viewHackathon?hackathonId=${h.hackathonId}" class="btn btn-light" style="padding:7px 10px;font-size:12px;">View</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="panel">
			<h3>Pending Submissions</h3>
			<c:choose>
				<c:when test="${empty pendingSubmissionList}">
					<p>No pending submissions for your review.</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Hackathon</th>
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
										<td>${submissionHackathonMap[s.hackathonId].title}</td>
										<td>${submissionTeamMap[s.teamId].teamName}</td>
										<td>${s.submitedDate}</td>
										<td><span class="pill pending">Pending</span></td>
										<td><a class="btn btn-light" style="padding:6px 10px;font-size:12px;" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">Review</a></td>
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
					<p>No reviewed submissions yet.</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Hackathon</th>
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
										<td>${submissionHackathonMap[s.hackathonId].title}</td>
										<td>${submissionTeamMap[s.teamId].teamName}</td>
										<td>${s.submitedDate}</td>
										<td><span class="pill done">Reviewed</span></td>
										<td><a class="btn btn-light" style="padding:6px 10px;font-size:12px;" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">Update Review</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<footer class="site-footer">
			<div>CodeVerse Judge Panel</div>
			<div style="margin-top:4px;">Need help? <a href="/logout">Contact Admin</a></div>
		</footer>
	</div>
</body>
</html>
