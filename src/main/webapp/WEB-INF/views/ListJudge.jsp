<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Judge List</title>
<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="AdminHeader.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<p class="card-title">All Judges</p>
								<a href="newJudge" class="text-info">Invite New Judge</a>
							</div>
							<c:if test="${param.invited == 'true'}">
								<div class="alert alert-success mt-2">Judge invited successfully. Email with temporary password sent.</div>
							</c:if>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<thead class="table-dark">
										<tr>
											<th>#</th>
											<th>Name</th>
											<th>Email</th>
											<th>Contact</th>
											<th>Qualification</th>
											<th>Designation</th>
											<th>Organization</th>
											<th>Status</th>
											<th>Password Reset</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty judgeList}">
											<tr><td colspan="9">No judges found.</td></tr>
										</c:if>
										<c:forEach items="${judgeList}" var="j" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td>${j.firstName} ${j.lastName}</td>
												<td>${j.email}</td>
												<td>${j.contactNum}</td>
												<td>${j.qualification}</td>
												<td>${j.designation}</td>
												<td>${j.organization}</td>
												<td>
													<c:choose>
														<c:when test="${j.active}"><span class="badge bg-success">Active</span></c:when>
														<c:otherwise><span class="badge bg-danger">Inactive</span></c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${j.passwordResetRequired}"><span class="badge bg-warning text-dark">Pending</span></c:when>
														<c:otherwise><span class="badge bg-primary">Completed</span></c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
