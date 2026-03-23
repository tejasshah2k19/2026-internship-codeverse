<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Hackathon Judges</title>
<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="AdminHeader.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<div>
											<p class="card-title">Manage Judges</p>
											<p class="text-muted mb-0">Hackathon: <b>${hackathon.title}</b></p>
										</div>
										<a href="listHackathon" class="text-info">Back to Hackathons</a>
									</div>

									<c:if test="${success == 'added'}"><div class="alert alert-success mt-2">Judge assigned successfully.</div></c:if>
									<c:if test="${success == 'removed'}"><div class="alert alert-success mt-2">Judge removed from hackathon.</div></c:if>
									<c:if test="${error == 'alreadyAssigned'}"><div class="alert alert-warning mt-2">Judge already assigned.</div></c:if>
									<c:if test="${error == 'invalidJudge'}"><div class="alert alert-danger mt-2">Invalid judge selection.</div></c:if>

									<form action="saveHackathonJudge" method="post" class="mt-3">
										<input type="hidden" name="hackathonId" value="${hackathon.hackathonId}">
										<div class="row">
											<div class="col-md-8">
												<select name="userId" class="form-control" required>
													<option value="">Select judge to assign</option>
													<c:forEach items="${availableJudges}" var="j">
														<option value="${j.userId}">${j.firstName} ${j.lastName} - ${j.email}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-4">
												<button type="submit" class="btn btn-primary">Assign Judge</button>
											</div>
										</div>
									</form>

									<div class="table-responsive mt-4">
										<table class="table table-bordered table-striped">
											<thead class="table-dark">
												<tr>
													<th>#</th>
													<th>Name</th>
													<th>Email</th>
													<th>Contact</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty assignedJudges}">
													<tr><td colspan="5">No judges assigned for this hackathon.</td></tr>
												</c:if>
												<c:forEach items="${assignedJudges}" var="a" varStatus="i">
													<tr>
														<td>${i.count}</td>
														<td>${judgeMap[a.userId].firstName} ${judgeMap[a.userId].lastName}</td>
														<td>${judgeMap[a.userId].email}</td>
														<td>${judgeMap[a.userId].contactNum}</td>
														<td>
															<a class="btn btn-danger btn-sm"
																href="deleteHackathonJudge?hackathonJudgeId=${a.hackathonJudgeId}&hackathonId=${hackathon.hackathonId}"
																onclick="return confirm('Remove this judge from hackathon?')">Remove</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="AdminFooter.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>
