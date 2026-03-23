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
									<h3 class="font-weight-bold">New Hackathon</h3>

								</div>

							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Add New Hackathon</p>
										<a href="listHackathon" class="text-info">View all</a>
									</div>

									<form action="saveHackathon" method="post">
										<input type="hidden" name="leaderboardPublished" value="false" />

										<!-- Title -->
										<div class="form-group">
											<label>Hackathon Title</label> <input type="text"
												class="form-control" name="title" required />
										</div>
										
										<div class="form-group">
											<label>Short Description</label>
											<textarea class="form-control" name="description" rows="3"
												placeholder="Short summary about hackathon"></textarea>
										</div>

										<div class="form-group">
											<label>Hackathon Details (HTML)</label>
											<textarea class="form-control" name="hackathonDetails" rows="6"
												placeholder="<p>Full hackathon details...</p>" required></textarea>
										</div>

										<!-- Status -->
										<div class="form-group">
											<label>Status</label> <select name="status" required
												class="form-control">
												<option value="">-- Select Status --</option>
												<option value="UPCOMING">Upcoming</option>
												<option value="ONGOING">Ongoing</option>
												<option value="COMPLETED">Completed</option>
											</select>
										</div>

										<!-- Event Type -->
										<div class="form-group">
											<label>Event Type</label> <select name="eventType"
												class="form-control" required>
												<option value="">-- Select Event Type --</option>
												<option value="ONLINE">Online</option>
												<option value="OFFLINE">Offline</option>
												<option value="HYBRID">Hybrid</option>
											</select>
										</div>

										<!-- Payment -->
										<div class="form-group">
											<label>Payment</label> <select name="payment"
												class="form-control" required>
												<option value="">-- Select Payment Type --</option>
												<option value="FREE">Free</option>
												<option value="PAID">Paid</option>
											</select>
										</div>

										<!-- Team Size -->
										<div class="row">
											<div class="form-group">
												<label>Minimum Team Size</label> <input class="form-control"
													type="number" name="minTeamSize" min="1" required />
											</div>

											<div class="form-group">
												<label>Maximum Team Size</label> <input class="form-control"
													type="number" name="maxTeamSize" min="1" required />
											</div>
										</div>

										<!-- Location -->
										<div class="form-group">
											<label>Location</label> <input type="text"
												class="form-control" name="location" />
										</div>

										<!-- User Type -->
										<div class="form-group">
											<label>User Type</label> <select class="form-control"
												name="userTypeId" required>
												<option value="">-- Select User Type --</option>
												<c:forEach var="u" items="${allUserType}">
													<option value="${u.userTypeId}">${u.userType}</option>
												</c:forEach>
											</select>
										</div>

										<!-- Registration Dates -->
										<div class="row">
											<div class="form-group">
												<label>Registration Start Date</label> <input
													class="form-control" type="date"
													name="registrationStartDate" required />
											</div>

											<div class="form-group">
												<label>Registration End Date</label> <input
													class="form-control" type="date" name="registrationEndDate"
													required />
											</div>
										</div>
										
										<hr />
										<h5>Prize Details</h5>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 1 Title</label>
												<input type="text" class="form-control" name="prizeTitle1"
													placeholder="First Prize" required />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 1 Description</label>
												<textarea class="form-control" name="prizeDescription1" rows="2"
													placeholder="Prize 1 details" required></textarea>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 2 Title (Optional)</label>
												<input type="text" class="form-control" name="prizeTitle2"
													placeholder="Second Prize" />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 2 Description (Optional)</label>
												<textarea class="form-control" name="prizeDescription2" rows="2"
													placeholder="Prize 2 details"></textarea>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 form-group">
												<label>Prize 3 Title (Optional)</label>
												<input type="text" class="form-control" name="prizeTitle3"
													placeholder="Third Prize" />
											</div>
											<div class="col-md-6 form-group">
												<label>Prize 3 Description (Optional)</label>
												<textarea class="form-control" name="prizeDescription3" rows="2"
													placeholder="Prize 3 details"></textarea>
											</div>
										</div>

										<!-- Submit -->
										<div style="text-align: center; margin-top: 20px;">
											<button type="submit" class="btn btn-primary">Save
												Hackathon</button>
										</div>

									</form>
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
