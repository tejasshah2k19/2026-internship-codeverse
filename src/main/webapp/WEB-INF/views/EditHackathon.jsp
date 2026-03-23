<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Hackathon</title>
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
						<div class="col-md-12 grid-margin">
							<h3 class="font-weight-bold">Edit Hackathon</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Update Hackathon</p>
										<a href="listHackathon" class="text-info">View all</a>
									</div>
									<form action="updateHackathon" method="post">
										<input type="hidden" name="hackathonId" value="${hackathon.hackathonId}" />
										<input type="hidden" name="userId" value="${hackathon.userId}" />
										<input type="hidden" name="leaderboardPublished" value="${hackathon.leaderboardPublished}" />

										<div class="form-group">
											<label>Hackathon Title</label>
											<input type="text" class="form-control" name="title" value="${hackathon.title}" required />
										</div>

										<div class="form-group">
											<label>Description</label>
											<textarea class="form-control" name="description" rows="4">${hackathon.description}</textarea>
										</div>
										
										<div class="form-group">
											<label>Hackathon Details (HTML)</label>
											<textarea class="form-control" name="hackathonDetails" rows="6" required>${hackathonDescription.hackathonDetails}</textarea>
										</div>

										<div class="form-group">
											<label>Status</label>
											<select name="status" required class="form-control">
												<option value="UPCOMING" ${hackathon.status == 'UPCOMING' ? 'selected' : ''}>Upcoming</option>
												<option value="ONGOING" ${hackathon.status == 'ONGOING' ? 'selected' : ''}>Ongoing</option>
												<option value="COMPLETED" ${hackathon.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
											</select>
										</div>

										<div class="form-group">
											<label>Event Type</label>
											<select name="eventType" class="form-control" required>
												<option value="ONLINE" ${hackathon.eventType == 'ONLINE' ? 'selected' : ''}>Online</option>
												<option value="OFFLINE" ${hackathon.eventType == 'OFFLINE' ? 'selected' : ''}>Offline</option>
												<option value="HYBRID" ${hackathon.eventType == 'HYBRID' ? 'selected' : ''}>Hybrid</option>
											</select>
										</div>

										<div class="form-group">
											<label>Payment</label>
											<select name="payment" class="form-control" required>
												<option value="FREE" ${hackathon.payment == 'FREE' ? 'selected' : ''}>Free</option>
												<option value="PAID" ${hackathon.payment == 'PAID' ? 'selected' : ''}>Paid</option>
											</select>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Minimum Team Size</label>
												<input class="form-control" type="number" name="minTeamSize" min="1" value="${hackathon.minTeamSize}" required />
											</div>
											<div class="col-md-6 form-group">
												<label>Maximum Team Size</label>
												<input class="form-control" type="number" name="maxTeamSize" min="1" value="${hackathon.maxTeamSize}" required />
											</div>
										</div>

										<div class="form-group">
											<label>Location</label>
											<input type="text" class="form-control" name="location" value="${hackathon.location}" />
										</div>

										<div class="form-group">
											<label>User Type</label>
											<select class="form-control" name="userTypeId" required>
												<c:forEach var="u" items="${allUserType}">
													<option value="${u.userTypeId}" ${hackathon.userTypeId == u.userTypeId ? 'selected' : ''}>${u.userType}</option>
												</c:forEach>
											</select>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Registration Start Date</label>
												<input class="form-control" type="date" name="registrationStartDate" value="${hackathon.registrationStartDate}" required />
											</div>
											<div class="col-md-6 form-group">
												<label>Registration End Date</label>
												<input class="form-control" type="date" name="registrationEndDate" value="${hackathon.registrationEndDate}" required />
											</div>
										</div>
										
										<hr />
										<h5>Prize Details</h5>
										<input type="hidden" name="prizeId1" value="${prize1.hackathonPrizeId}" />
										<input type="hidden" name="prizeId2" value="${prize2.hackathonPrizeId}" />
										<input type="hidden" name="prizeId3" value="${prize3.hackathonPrizeId}" />

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 1 Title</label>
												<input type="text" class="form-control" name="prizeTitle1" value="${prize1.prizeTitle}" required />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 1 Description</label>
												<textarea class="form-control" name="prizeDescription1" rows="2" required>${prize1.prizeDescription}</textarea>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 2 Title (Optional)</label>
												<input type="text" class="form-control" name="prizeTitle2" value="${prize2.prizeTitle}" />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 2 Description (Optional)</label>
												<textarea class="form-control" name="prizeDescription2" rows="2">${prize2.prizeDescription}</textarea>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 3 Title (Optional)</label>
												<input type="text" class="form-control" name="prizeTitle3" value="${prize3.prizeTitle}" />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 3 Description (Optional)</label>
												<textarea class="form-control" name="prizeDescription3" rows="2">${prize3.prizeDescription}</textarea>
											</div>
										</div>

										<button type="submit" class="btn btn-primary">Update Hackathon</button>
										<a href="listHackathon" class="btn btn-secondary">Cancel</a>
									</form>
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
