<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
.UPCOMING {
	background: #17a2b8;
}

.ONGOING {
	background: #28a745;
}

.COMPLETED {
	background: #6c757d;
}

.FREE {
	background: #28a745;
}

.PAID {
	background: #dc3545;
}

.btn-add {
	background: #28a745;
}

.btn-edit {
	background: #ffc107;
	color: black;
}

.btn-delete {
	background: #dc3545;
}

.btn-view {
	background: #007bff;
}
.btn-publish {
	background: #20c997;
}
.btn-unpublish {
	background: #6c757d;
}

.hackathon-table th, .hackathon-table td {
	vertical-align: middle;
}

.hackathon-actions {
	display: flex;
	flex-wrap: wrap;
	gap: 6px;
	min-width: 270px;
}

.hackathon-actions .btn {
	padding: 0.375rem 0.6rem;
	font-size: 12px;
}

@media ( max-width : 991.98px) {
	.hide-md {
		display: none;
	}
}

@media ( max-width : 767.98px) {
	.hide-sm {
		display: none;
	}
	.hackathon-actions {
		min-width: 220px;
	}
}
</style>

</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<jsp:include page="AdminHeader.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<h3 class="font-weight-bold">List Hackathon</h3>

								</div>

							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">All Hackathon</p>
										<a href="newHackathon" class="text-info">New</a>
									</div>
									<c:if test="${success == 'leaderboardPublished'}">
										<div class="alert alert-success">Leaderboard published successfully.</div>
									</c:if>
									<c:if test="${success == 'leaderboardUnpublished'}">
										<div class="alert alert-info">Leaderboard unpublished successfully.</div>
									</c:if>
									<c:if test="${error == 'leaderboardNeedsComplete'}">
										<div class="alert alert-danger">Complete the hackathon first, then publish leaderboard.</div>
									</c:if>
									<div class="table-responsive">
										<table class="table table-bordered table-hover hackathon-table">
											<thead>
												<tr>
													<th>#</th>
													<th>Title</th>
													<th>Status</th>
													<th class="hide-md">Event Type</th>
													<th class="hide-sm">Payment</th>
													<th>Team Size</th>
													<th class="hide-md">Location</th>
													<th class="hide-sm">Registration Period</th>
													<th>Leaderboard</th>
													<th>Actions</th>
												</tr>
											</thead>

											<tbody>
												<c:choose>
													<c:when test="${empty allHackthon}">
														<tr>
															<td colspan="10">No hackathons found</td>
														</tr>
													</c:when>

													<c:otherwise>
														<c:forEach var="h" items="${allHackthon}" varStatus="i">
															<tr>
																<td>${i.count}</td>
																<td>${h.title}</td>

																<td><span class="badge ${h.status}">
																		${h.status} </span></td>

																<td class="hide-md">${h.eventType}</td>

																<td class="hide-sm"><span class="badge ${h.payment}">
																		${h.payment} </span></td>

																<td>${h.minTeamSize}-${h.maxTeamSize}</td>

																<td class="hide-md">${h.location}</td>

																<td class="hide-sm">${h.registrationStartDate} to
																	${h.registrationEndDate}</td>

																<td>
																	<c:choose>
																		<c:when test="${h.leaderboardPublished}">
																			<span class="badge badge-success">Published</span>
																		</c:when>
																		<c:otherwise>
																			<span class="badge badge-secondary">Draft</span>
																		</c:otherwise>
																	</c:choose>
																</td>

																<td>
																	<div class="hackathon-actions">
																		<a href="listHackathonDescription?hackathonId=${h.hackathonId}" class="btn btn-info">Description</a>
																		<a href="listHackathonPrize?hackathonId=${h.hackathonId}" class="btn btn-primary">Prizes</a>
																		<a href="manageHackathonJudge?hackathonId=${h.hackathonId}" class="btn btn-secondary">Judges</a>
																		<c:if test="${h.status == 'COMPLETED' || h.status == 'COMPLETE'}">
																			<c:choose>
																				<c:when test="${h.leaderboardPublished}">
																					<a href="toggleLeaderboardPublish?hackathonId=${h.hackathonId}" class="btn btn-unpublish">Unpublish Board</a>
																				</c:when>
																				<c:otherwise>
																					<a href="toggleLeaderboardPublish?hackathonId=${h.hackathonId}" class="btn btn-publish">Publish Board</a>
																				</c:otherwise>
																			</c:choose>
																		</c:if>
																		<a href="viewHackathon?hackathonId=${h.hackathonId}" class="btn btn-view">View</a>
																		<a href="editHackathon?hackathonId=${h.hackathonId}" class="btn btn-edit">Edit</a>
																		<a href="deleteHackathon?hackathonId=${h.hackathonId}" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this hackathon?')">Delete</a>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>



								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->

				<jsp:include page="AdminFooter.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->




	<!-- End custom js for this page-->
</body>
</html>
