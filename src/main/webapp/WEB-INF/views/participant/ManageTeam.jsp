<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Team | ${hackathon.title}</title>
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
}
body {
	font-family: 'Syne', sans-serif;
	background: var(--bg);
	color: var(--text);
}
.page {
	max-width: 1100px;
	margin: 0 auto;
	padding: 24px 20px 40px;
}
.top {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 12px;
	flex-wrap: wrap;
	margin-bottom: 16px;
}
.back {
	color: var(--muted);
	text-decoration: none;
	font-weight: 700;
}
.title {
	font-size: 26px;
}
.sub {
	color: var(--muted);
	margin-top: 4px;
	font-size: 14px;
}
.msg {
	margin-bottom: 10px;
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
.grid {
	display: grid;
	grid-template-columns: 1.15fr 0.85fr;
	gap: 16px;
}
.card {
	background: var(--surface);
	border: 1px solid var(--border);
	border-radius: 16px;
	padding: 16px;
}
.card h3 {
	font-size: 18px;
	margin-bottom: 8px;
}
.meta-chip {
	display: inline-block;
	padding: 6px 10px;
	border-radius: 999px;
	border: 1px solid var(--border);
	background: var(--surface2);
	font-family: 'Space Mono', monospace;
	font-size: 12px;
	color: var(--muted);
}
.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}
.table th, .table td {
	border-bottom: 1px solid var(--border);
	padding: 10px 8px;
	text-align: left;
	font-size: 14px;
}
.table th {
	color: #9fb3c9;
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: .4px;
}
.form-group {
	margin-top: 10px;
}
.form-group label {
	display: block;
	font-size: 13px;
	margin-bottom: 6px;
	color: #b8c7d8;
}
.form-group input, .form-group select {
	width: 100%;
	height: 42px;
	border-radius: 10px;
	border: 1px solid var(--border);
	background: var(--surface2);
	color: var(--text);
	padding: 0 12px;
	font-family: 'Syne', sans-serif;
}
.btn {
	margin-top: 12px;
	border: none;
	border-radius: 10px;
	height: 40px;
	padding: 0 14px;
	color: #fff;
	font-weight: 700;
	background: linear-gradient(135deg, var(--accent), #5b27bd);
	cursor: pointer;
}
.btn-row {
	display: flex;
	gap: 8px;
	flex-wrap: wrap;
}
.btn-danger {
	background: #7f1d1d;
}
.hint {
	font-size: 12px;
	color: var(--muted);
	margin-top: 6px;
}
@media ( max-width : 900px) {
	.grid { grid-template-columns: 1fr; }
}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="top">
			<div>
				<a href="/participant/hackathon/${hackathon.hackathonId}" class="back">&larr; Back to Details</a>
				<h1 class="title">Manage Team</h1>
				<p class="sub">${hackathon.title}</p>
			</div>
			<div class="meta-chip">Members: ${teamSizeCount}/${teamMaxSize}</div>
		</div>

		<c:if test="${success == 'memberInvited'}"><div class="msg success">Invitation sent to participant. They must accept to join.</div></c:if>
		<c:if test="${success == 'externalInvited'}"><div class="msg success">External invite saved successfully.</div></c:if>
		<c:if test="${success == 'memberRemoved'}"><div class="msg success">Member removed from team successfully.</div></c:if>
		<c:if test="${success == 'teamCreated'}"><div class="msg success">Team created successfully. You are now team leader.</div></c:if>
		<c:if test="${success == 'teamJoined'}"><div class="msg success">You joined team successfully.</div></c:if>
		<c:if test="${success == 'inviteAccepted'}"><div class="msg success">Invitation accepted. You are now part of that team.</div></c:if>
		<c:if test="${success == 'inviteRejected'}"><div class="msg success">Invitation rejected.</div></c:if>
		<c:if test="${error == 'teamFull'}"><div class="msg error">Your team is full. You cannot add more members.</div></c:if>
		<c:if test="${error == 'invalidUser'}"><div class="msg error">Selected user is invalid for team invite.</div></c:if>
		<c:if test="${error == 'alreadyInHackathon'}"><div class="msg error">This participant is already part of a team in this hackathon.</div></c:if>
		<c:if test="${error == 'invalidTeamName'}"><div class="msg error">Please enter valid team name.</div></c:if>
		<c:if test="${error == 'invalidTeam'}"><div class="msg error">Selected team is invalid for this hackathon.</div></c:if>
		<c:if test="${error == 'invalidEmail'}"><div class="msg error">Please enter a valid external email.</div></c:if>
		<c:if test="${error == 'inviteExists'}"><div class="msg error">Pending invite already exists for this email.</div></c:if>
		<c:if test="${error == 'inviteNotFound' || error == 'inviteInvalid'}"><div class="msg error">Invitation is invalid or no longer available.</div></c:if>
		<c:if test="${error == 'submissionLocked'}"><div class="msg error">Submission is locked until registration period ends.</div></c:if>
		<c:if test="${error == 'inviteClosed'}"><div class="msg error">Invitations are closed after registration end date.</div></c:if>
		<c:if test="${error == 'notLeader'}"><div class="msg error">Only team leader can remove participants.</div></c:if>
		<c:if test="${error == 'cannotRemoveLeader'}"><div class="msg error">Team leader cannot be removed from team.</div></c:if>
		<c:if test="${error == 'memberNotFound'}"><div class="msg error">Selected member was not found in this team.</div></c:if>

		<div class="grid">
			<c:if test="${not hasTeam}">
				<c:if test="${not empty pendingInvite}">
					<section class="card">
						<h3>Pending Team Invitation</h3>
						<p class="hint">
							You have been invited to join
							<strong><c:out value="${pendingInviteTeam != null ? pendingInviteTeam.teamName : 'a team'}"/></strong>.
						</p>
						<div class="btn-row">
							<form action="/participant/hackathon/${hackathon.hackathonId}/team/invite/${pendingInvite.hackathonTeamInviteId}/accept" method="post">
								<button type="submit" class="btn">Accept Invitation</button>
							</form>
							<form action="/participant/hackathon/${hackathon.hackathonId}/team/invite/${pendingInvite.hackathonTeamInviteId}/reject" method="post">
								<button type="submit" class="btn btn-danger">Reject Invitation</button>
							</form>
						</div>
					</section>
				</c:if>
				<section class="card">
					<h3>Create Your Team</h3>
					<form action="/participant/hackathon/${hackathon.hackathonId}/team/create" method="post">
						<div class="form-group">
							<label>Team Name</label>
							<input type="text" name="teamName" placeholder="Enter team name" required>
						</div>
						<button type="submit" class="btn">Create Team</button>
					</form>
					<p class="hint">You can create only one team in this hackathon.</p>
				</section>

				<section class="card">
					<h3>Join Existing Team</h3>
					<c:choose>
						<c:when test="${empty availableTeams}">
							<p class="hint">No open teams available to join right now.</p>
						</c:when>
						<c:otherwise>
							<form action="/participant/hackathon/${hackathon.hackathonId}/team/join-existing" method="post">
								<div class="form-group">
									<label>Select Team</label>
									<select name="joinTeamId" required>
										<option value="">Choose team</option>
										<c:forEach items="${availableTeams}" var="t">
											<option value="${t.hackathonTeamId}">${t.teamName}</option>
										</c:forEach>
									</select>
								</div>
								<button type="submit" class="btn">Join Team</button>
							</form>
						</c:otherwise>
					</c:choose>
					<p class="hint">After joining one team, you cannot create another team in this hackathon.</p>
				</section>
			</c:if>

			<c:if test="${hasTeam}">
			<section class="card">
				<h3>Team Members</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Email</th>
							<th>Role</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teamMembers}" var="m" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${memberMap[m.memberId].firstName} ${memberMap[m.memberId].lastName}</td>
								<td>${memberMap[m.memberId].email}</td>
								<td>${m.roleTitle}</td>
								<td>
									<c:choose>
										<c:when test="${isTeamLeader and m.memberId != team.teamLeaderId}">
											<form action="/participant/hackathon/${hackathon.hackathonId}/team/remove-member" method="post">
												<input type="hidden" name="memberId" value="${m.memberId}">
												<button type="submit" class="btn" style="height:32px;margin-top:0;padding:0 10px;"
													onclick="return confirm('Remove this member from your team?')">Remove</button>
											</form>
										</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			</c:if>

			<c:if test="${hasTeam and isTeamLeader and inviteAllowed}">
			<section class="card">
				<h3>Invite Registered Participant</h3>
				<form action="/participant/hackathon/${hackathon.hackathonId}/team/invite-member" method="post">
					<div class="form-group">
						<label>Select participant</label>
						<select name="invitedUserId" required>
							<option value="">Choose participant</option>
							<c:forEach items="${participantUsers}" var="u">
								<option value="${u.userId}">${u.firstName} ${u.lastName} - ${u.email}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn">Send Invite</button>
					<p class="hint">Invite goes to pending state until participant accepts it.</p>
				</form>
			</section>
			</c:if>

			<c:if test="${hasTeam and isTeamLeader and inviteAllowed}">
			<section class="card">
				<h3>Invite External User</h3>
				<form action="/participant/hackathon/${hackathon.hackathonId}/team/invite-external" method="post">
					<div class="form-group">
						<label>External email</label>
						<input type="email" name="externalEmail" placeholder="name@example.com" required>
					</div>
					<div class="form-group">
						<label>Role title</label>
						<input type="text" name="roleTitle" placeholder="MEMBER">
					</div>
					<button type="submit" class="btn">Send External Invite</button>
					<p class="hint">External invite is stored as pending until accepted manually.</p>
				</form>
			</section>
			</c:if>

			<c:if test="${hasTeam and isTeamLeader and not inviteAllowed}">
			<section class="card">
				<h3>Invite Members</h3>
				<p class="hint">Invitations are disabled because registration has ended.</p>
			</section>
			</c:if>

			<c:if test="${hasTeam and not isTeamLeader}">
			<section class="card">
				<h3>Invite Members</h3>
				<p class="hint">Only the team leader can send invitations.</p>
			</section>
			</c:if>

			<c:if test="${hasTeam}">
			<section class="card">
				<h3>Invite Activity</h3>
				<table class="table">
					<thead>
						<tr>
							<th>Type</th>
							<th>Invitee</th>
							<th>Status</th>
							<th>Sent On</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty inviteList}">
							<tr><td colspan="4">No invites yet.</td></tr>
						</c:if>
						<c:forEach items="${inviteList}" var="i">
							<tr>
								<td>${i.inviteType}</td>
								<td>
									<c:choose>
										<c:when test="${not empty i.invitedEmail}">${i.invitedEmail}</c:when>
										<c:otherwise>User #${i.invitedUserId}</c:otherwise>
									</c:choose>
								</td>
								<td>${i.inviteStatus}</td>
								<td>${i.createdAt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			</c:if>
		</div>
	</div>
</body>
</html>
