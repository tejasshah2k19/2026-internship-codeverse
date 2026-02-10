<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Hackathon</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
body {
	background-color: #f8f9fa;
}

.card {
	margin-top: 80px;
	border-radius: 12px;
}
</style>
</head>

<body>
	<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


	<div class="content">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-5">
				<div class="card shadow">
					<div class="card-body p-4">
						<h4 class="text-center mb-4">Add New Hackathon</h4>


						<form action="saveHackathon"  method="post">

							<!-- Title -->
							<div class="form-group">
								<label>Hackathon Title</label> <input type="text" class="form-control" name="title"
									required />
							</div>

							<!-- Status -->
							<div class="form-group">
								<label>Status</label> <select name="status" required class="form-control">
									<option value="">-- Select Status --</option>
									<option value="UPCOMING">Upcoming</option>
									<option value="ONGOING">Ongoing</option>
									<option value="COMPLETED">Completed</option>
								</select>
							</div>

							<!-- Event Type -->
							<div class="form-group">
								<label>Event Type</label> <select name="eventType" class="form-control" required>
									<option value="">-- Select Event Type --</option>
									<option value="ONLINE">Online</option>
									<option value="OFFLINE">Offline</option>
									<option value="HYBRID">Hybrid</option>
								</select>
							</div>

							<!-- Payment -->
							<div class="form-group">
								<label>Payment</label> <select name="payment" class="form-control" required>
									<option value="">-- Select Payment Type --</option>
									<option value="FREE">Free</option>
									<option value="PAID">Paid</option>
								</select>
							</div>

							<!-- Team Size -->
							<div class="row">
								<div class="form-group">
									<label>Minimum Team Size</label> <input class="form-control"  type="number"
										name="minTeamSize" min="1" required />
								</div>

								<div class="form-group">
									<label>Maximum Team Size</label> <input  class="form-control" type="number"
										name="maxTeamSize" min="1" required />
								</div>
							</div>

							<!-- Location -->
							<div class="form-group">
								<label>Location</label> <input type="text" class="form-control"  name="location" />
							</div>

							<!-- User Type -->
							<div class="form-group">
								<label>User Type</label> <select class="form-control" name="userTypeId" required>
									<option value="">-- Select User Type --</option>
									<c:forEach var="u" items="${allUserType}">
										<option value="${u.userTypeId}">${u.userType}</option>
									</c:forEach>
								</select>
							</div>

							<!-- Registration Dates -->
							<div class="row">
								<div class="form-group">
									<label>Registration Start Date</label> <input class="form-control" type="date"
										name="registrationStartDate" required />
								</div>

								<div class="form-group">
									<label>Registration End Date</label> <input  class="form-control" type="date"
										name="registrationEndDate" required />
								</div>
							</div>

							<!-- Submit -->
							<div style="text-align: center; margin-top: 20px;">
								<button type="submit" class="btn btn-primary">Save Hackathon</button>
							</div>

						</form>


					</div>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="AdminFooter.jsp"></jsp:include>



</body>
</html>
