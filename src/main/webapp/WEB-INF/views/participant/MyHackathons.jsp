<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Hackathons</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#0a0a0f;--surface:#13131a;--surface2:#1c1c27;--border:#2a2a3d;
	--accent:#7c3aed;--accent2:#06b6d4;--text:#e2e8f0;--muted:#64748b;
}
body{font-family:'Syne',sans-serif;background:var(--bg);color:var(--text)}
.page{max-width:1120px;margin:0 auto;padding:24px 20px 40px}
.top{display:flex;justify-content:space-between;align-items:flex-end;gap:14px;flex-wrap:wrap;margin-bottom:16px}
.back{color:var(--muted);text-decoration:none;font-weight:700}
.title{font-size:30px}
.subtitle{font-size:14px;color:var(--muted);margin-top:6px}
.count{padding:6px 10px;border-radius:999px;background:var(--surface2);border:1px solid var(--border);font-family:'Space Mono',monospace;font-size:12px;color:var(--muted)}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(320px,1fr));gap:14px}
.card{background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:16px;display:flex;flex-direction:column;gap:10px}
.card h3{font-size:20px;line-height:1.25}
.meta{display:flex;flex-wrap:wrap;gap:8px}
.chip{font-family:'Space Mono',monospace;font-size:11px;padding:4px 8px;border-radius:999px;background:var(--surface2);border:1px solid var(--border);color:var(--muted)}
.chip.leader{color:#67e8f9}
.chip.member{color:#c4b5fd}
.desc{color:#a6b6c8;font-size:14px;line-height:1.6;min-height:44px}
.actions{display:flex;gap:8px;margin-top:auto}
.btn{flex:1;text-align:center;text-decoration:none;padding:10px;border-radius:10px;font-weight:700;font-size:13px}
.btn-primary{background:linear-gradient(135deg,var(--accent),#5b27bd);color:#fff}
.btn-secondary{background:var(--surface2);color:#cbd5e1;border:1px solid var(--border)}
.btn-submission{background:#0f766e;color:#fff}
.btn-leaderboard{background:#1d4ed8;color:#fff}
.btn-disabled{background:#334155;color:#94a3b8;cursor:not-allowed;pointer-events:none;opacity:.85}
.empty{background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:30px;text-align:center;color:var(--muted)}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="top">
			<div>
				<a class="back" href="/participant/home">&larr; Back to Home</a>
				<h1 class="title">My Hackathons</h1>
				<p class="subtitle">Manage all hackathons where you are part of a team.</p>
			</div>
			<div class="count">Total: ${totalCount}</div>
		</div>

		<c:choose>
			<c:when test="${empty myHackathons}">
				<div class="empty">
					<h3>No joined hackathons yet</h3>
					<p style="margin-top:8px;">Join a hackathon from home page and it will appear here.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="grid">
					<c:forEach items="${myHackathons}" var="m">
						<article class="card">
							<h3>${m.hackathon.title}</h3>
							<div class="meta">
								<span class="chip">${m.hackathon.status}</span>
								<span class="chip">${m.hackathon.eventType}</span>
								<span class="chip">${m.teamSize} members</span>
								<span class="chip">${m.pendingInvites} pending invites</span>
								<span class="chip ${m.leader ? 'leader' : 'member'}">${m.leader ? 'Team Leader' : m.roleTitle}</span>
							</div>
							<p class="desc">${m.hackathon.description}</p>
							<div class="actions">
								<a class="btn btn-secondary" href="/participant/hackathon/${m.hackathon.hackathonId}">View Details</a>
								<a class="btn btn-primary" href="/participant/hackathon/${m.hackathon.hackathonId}/team">Manage Team</a>
								<c:if test="${not empty m.teamId}">
									<c:choose>
										<c:when test="${m.submissionEnabled}">
											<a class="btn btn-submission" href="/participant/hackathon/${m.hackathon.hackathonId}/submission">Submission</a>
										</c:when>
										<c:otherwise>
											<span class="btn btn-disabled" title="Submission opens after registration end date">Submission</span>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${m.hackathon.status == 'COMPLETE' || m.hackathon.status == 'COMPLETED'}">
									<a class="btn btn-leaderboard" href="/participant/hackathon/${m.hackathon.hackathonId}/leaderboard">Leaderboard</a>
								</c:if>
							</div>
						</article>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
