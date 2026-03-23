<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Judge Submissions</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Sora:wght@500;700&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:'Space Grotesk',sans-serif;background:#f2f7fb;color:#11243b}
.wrap{max-width:1100px;margin:0 auto;padding:24px 18px}
.top{display:flex;justify-content:space-between;align-items:flex-end;gap:10px;flex-wrap:wrap}
.title{font-family:'Sora',sans-serif;font-size:30px}
.back{color:#1f4264;text-decoration:none;font-weight:700}
.card{margin-top:14px;background:#fff;border:1px solid #dce8f4;border-radius:14px;padding:16px}
.table-responsive{overflow-x:auto}
table{width:100%;border-collapse:collapse}
th,td{padding:10px 8px;border-bottom:1px solid #e6eef6;text-align:left;font-size:14px}
th{font-size:12px;color:#647c95;text-transform:uppercase}
.badge{padding:4px 8px;border-radius:999px;font-size:12px;font-weight:700}
.ok{background:#eaf9ef;color:#1f8a43}
.pending{background:#fff7e8;color:#a5670e}
.btn{display:inline-block;text-decoration:none;padding:7px 10px;border-radius:8px;background:#0f9d94;color:#fff;font-weight:700;font-size:12px}
.msg{margin-top:10px;padding:10px 12px;border-radius:10px;background:#eaf9ef;border:1px solid #beeac9;color:#1f8a43}
@media (max-width:700px){
	.title{font-size:24px}
	th,td{font-size:13px;padding:9px 6px}
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="top">
			<div>
				<a class="back" href="/judge-dashboard">&larr; Back to Dashboard</a>
				<h1 class="title">Hackathon Submissions</h1>
			</div>
		</div>
		<c:if test="${param.saved == 'true'}"><div class="msg">Review score saved successfully.</div></c:if>
		<div class="card">
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
						<c:if test="${empty submissions}">
							<tr><td colspan="6">No submissions assigned yet.</td></tr>
						</c:if>
						<c:forEach items="${submissions}" var="s" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${hackathonMap[s.hackathonId].title}</td>
								<td>${teamMap[s.teamId].teamName}</td>
								<td>${s.submitedDate}</td>
								<td>
									<c:choose>
										<c:when test="${reviewedMap[s.hackathonSubmissionId]}"><span class="badge ok">Reviewed</span></c:when>
										<c:otherwise><span class="badge pending">Pending</span></c:otherwise>
									</c:choose>
								</td>
								<td><a class="btn" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">Review</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
