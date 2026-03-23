<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${hackathon.title} | Hackathon Details</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
:root {
	--bg: #0a0a0f;
	--surface: #13131a;
	--surface2: #1c1c27;
	--border: #2a2a3d;
	--accent: #7c3aed;
	--accent2: #06b6d4;
	--text: #e2e8f0;
	--muted: #64748b;
	--success: #22c55e;
	--warning: #f59e0b;
}
body {
	font-family: 'Syne', sans-serif;
	background: var(--bg);
	color: var(--text);
	min-height: 100vh;
}
.page {
	max-width: 1100px;
	margin: 0 auto;
	padding: 24px 20px 40px;
}
.topbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
}
.back {
	color: var(--muted);
	text-decoration: none;
	font-weight: 700;
}
.back:hover { color: var(--text); }
.hero {
	background: linear-gradient(140deg, rgba(124, 58, 237, 0.22), rgba(6, 182, 212, 0.18));
	border: 1px solid var(--border);
	border-radius: 18px;
	padding: 24px;
}
.hero h1 {
	font-size: clamp(26px, 5vw, 42px);
	line-height: 1.1;
	margin-bottom: 10px;
}
.meta {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-top: 12px;
}
.chip {
	border: 1px solid var(--border);
	background: var(--surface2);
	padding: 6px 12px;
	border-radius: 999px;
	font-size: 12px;
	font-family: 'Space Mono', monospace;
	color: var(--muted);
}
.chip.status-UPCOMING { color: #fbbf24; }
.chip.status-ONGOING { color: #4ade80; }
.chip.status-COMPLETED { color: #94a3b8; }
.chip.status-open { color: #4ade80; }
.chip.status-closed { color: #fbbf24; }
.grid {
	display: grid;
	grid-template-columns: 1.35fr 0.85fr;
	gap: 18px;
	margin-top: 18px;
}
.card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 16px;
	padding: 18px;
}
.card h2 {
	font-size: 20px;
	margin-bottom: 10px;
}
.desc {
	color: #c2cfdd;
	line-height: 1.75;
}
.desc p, .desc ul, .desc ol { margin-bottom: 10px; }
.klist {
	display: grid;
	gap: 10px;
}
.kitem {
	padding: 12px;
	border: 1px solid var(--border);
	border-radius: 12px;
	background: var(--surface2);
}
.kitem .label {
	display: block;
	font-size: 11px;
	font-family: 'Space Mono', monospace;
	color: var(--muted);
	text-transform: uppercase;
	letter-spacing: 0.5px;
}
.kitem .value {
	font-size: 15px;
	font-weight: 700;
	color: var(--text);
	margin-top: 4px;
}
.prize-list {
	display: grid;
	gap: 10px;
	margin-top: 8px;
}
.prize {
	border: 1px solid var(--border);
	border-radius: 12px;
	padding: 12px;
	background: var(--surface2);
}
.prize h3 {
	font-size: 15px;
	margin-bottom: 6px;
}
.prize p {
	color: #b7c7d8;
	font-size: 14px;
	line-height: 1.6;
}
.empty {
	color: var(--muted);
	font-size: 14px;
}
.join-panel {
	margin-top: 14px;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
	gap: 12px;
	border-top: 1px solid var(--border);
	padding-top: 14px;
}
.join-info {
	font-size: 13px;
	color: var(--muted);
}
.join-btn {
	border: none;
	background: linear-gradient(135deg, var(--accent), #5b27bd);
	color: #fff;
	padding: 10px 16px;
	border-radius: 10px;
	font-family: 'Syne', sans-serif;
	font-weight: 700;
	font-size: 14px;
	cursor: pointer;
}
.btn-row {
	display: flex;
	gap: 8px;
	flex-wrap: wrap;
}
.danger-btn {
	background: #7f1d1d;
}
.ghost-btn {
	display: inline-block;
	text-decoration: none;
	padding: 10px 16px;
	border-radius: 10px;
	border: 1px solid var(--border);
	background: var(--surface2);
	color: var(--text);
	font-weight: 700;
	font-size: 14px;
}
.join-btn[disabled] {
	opacity: 0.6;
	cursor: not-allowed;
}
.msg {
	margin-top: 14px;
	padding: 10px 12px;
	border-radius: 10px;
	font-size: 14px;
}
.msg.success {
	background: rgba(34, 197, 94, 0.14);
	border: 1px solid rgba(34, 197, 94, 0.4);
	color: #86efac;
}
.msg.error {
	background: rgba(239, 68, 68, 0.12);
	border: 1px solid rgba(239, 68, 68, 0.35);
	color: #fca5a5;
}
@media ( max-width : 900px) {
	.grid { grid-template-columns: 1fr; }
}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="topbar">
			<a href="/participant/home" class="back">&larr; Back to Hackathons</a>
		</div>

		<section class="hero">
			<h1>${hackathon.title}</h1>
			<p>${hackathon.description}</p>
			<div class="meta">
				<span class="chip status-${hackathon.status}">${hackathon.status}</span>
				<span class="chip">${hackathon.eventType}</span>
				<span class="chip">${hackathon.payment}</span>
				<span class="chip">Team ${hackathon.minTeamSize} - ${hackathon.maxTeamSize}</span>
				<span class="chip ${registrationOpen ? 'status-open' : 'status-closed'}">
					${registrationOpen ? 'Registration Open' : 'Registration Closed'}
				</span>
				<span class="chip">${teamCount} Teams Joined</span>
			</div>

			<c:if test="${joined == 'true'}">
				<div class="msg success">You have successfully joined this hackathon.</div>
			</c:if>
			<c:if test="${success == 'inviteAccepted'}">
				<div class="msg success">Invitation accepted. You are now part of this team.</div>
			</c:if>
			<c:if test="${success == 'inviteRejected'}">
				<div class="msg success">Invitation rejected.</div>
			</c:if>
			<c:if test="${error == 'alreadyRegistered'}">
				<div class="msg error">You are already registered in this hackathon.</div>
			</c:if>
			<c:if test="${error == 'registrationClosed'}">
				<div class="msg error">Registration is currently closed for this hackathon.</div>
			</c:if>
			<c:if test="${error == 'inviteNotFound' || error == 'inviteInvalid'}">
				<div class="msg error">Invitation is invalid or no longer available.</div>
			</c:if>
			<c:if test="${error == 'teamFull'}">
				<div class="msg error">This team is full, so invite cannot be accepted.</div>
			</c:if>
			<c:if test="${error == 'alreadyInHackathon'}">
				<div class="msg error">You are already part of another team in this hackathon.</div>
			</c:if>
			<c:if test="${error == 'leaderboardNotReady'}">
				<div class="msg error">Leaderboard will be available only after hackathon is marked complete.</div>
			</c:if>

			<div class="join-panel">
				<div class="join-info">
					<c:choose>
						<c:when test="${alreadyRegistered}">
							You are already part of this hackathon.
						</c:when>
						<c:when test="${not empty pendingInvite}">
							You have a pending team invitation for this hackathon.
						</c:when>
						<c:when test="${registrationOpen}">
							Registration is open. Join now to participate.
						</c:when>
						<c:otherwise>
							You can join only during the registration period.
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${alreadyRegistered}">
						<a href="/participant/hackathon/${hackathon.hackathonId}/team" class="join-btn">Manage Team</a>
					</c:when>
					<c:when test="${not empty pendingInvite}">
						<div class="btn-row">
							<form action="/participant/hackathon/${hackathon.hackathonId}/invite/${pendingInvite.hackathonTeamInviteId}/accept" method="post">
								<button type="submit" class="join-btn">Accept Invitation</button>
							</form>
							<form action="/participant/hackathon/${hackathon.hackathonId}/invite/${pendingInvite.hackathonTeamInviteId}/reject" method="post">
								<button type="submit" class="join-btn danger-btn">Reject Invitation</button>
							</form>
						</div>
					</c:when>
					<c:when test="${canJoin}">
						<form action="/participant/hackathon/${hackathon.hackathonId}/join" method="post">
							<button type="submit" class="join-btn">Join Hackathon</button>
						</form>
					</c:when>
					<c:otherwise>
						<button type="button" class="join-btn" disabled>Join Hackathon</button>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${leaderboardAvailable}">
				<div style="margin-top:12px;">
					<a class="ghost-btn" href="/participant/hackathon/${hackathon.hackathonId}/leaderboard">View Leaderboard</a>
				</div>
			</c:if>
		</section>

		<div class="grid">
			<section class="card">
				<h2>About This Hackathon</h2>
				<div class="desc">
					<c:choose>
						<c:when test="${not empty hackathonDescription}">
							<c:out value="${hackathonDescription.hackathonDetails}" escapeXml="false" />
						</c:when>
						<c:otherwise>
							<p class="empty">Detailed description is not available yet.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</section>

			<section class="card">
				<h2>Quick Info</h2>
				<div class="klist">
					<div class="kitem">
						<span class="label">Registration Start</span>
						<span class="value">${hackathon.registrationStartDate}</span>
					</div>
					<div class="kitem">
						<span class="label">Registration End</span>
						<span class="value">${hackathon.registrationEndDate}</span>
					</div>
					<div class="kitem">
						<span class="label">Location</span>
						<span class="value">${hackathon.location}</span>
					</div>
				</div>
			</section>
		</div>

		<section class="card" style="margin-top: 18px;">
			<h2>Prizes</h2>
			<c:choose>
				<c:when test="${empty prizeList}">
					<p class="empty">Prize details are not published yet.</p>
				</c:when>
				<c:otherwise>
					<div class="prize-list">
						<c:forEach items="${prizeList}" var="p" varStatus="i">
							<article class="prize">
								<h3>${i.count}. ${p.prizeTitle}</h3>
								<p>${p.prizeDescription}</p>
							</article>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</div>
</body>
</html>
