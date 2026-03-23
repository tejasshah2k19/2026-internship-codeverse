<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Invite Judge</title>
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
						<div class="col-md-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Invite New Judge</p>
										<a href="listJudge" class="text-info">View all</a>
									</div>
									<form action="saveJudge" method="post">
										<div class="form-group">
											<label>First Name</label>
											<input type="text" name="firstName" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Last Name</label>
											<input type="text" name="lastName" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Email</label>
											<input type="email" name="email" class="form-control" required>
										</div>
										<div class="form-group">
											<label>Contact Number</label>
											<input type="text" name="contactNum" class="form-control">
										</div>
										<div class="form-group">
											<label>Qualification</label>
											<input type="text" name="qualification" class="form-control" placeholder="e.g. M.Tech, PhD">
										</div>
										<div class="form-group">
											<label>Designation</label>
											<input type="text" name="designation" class="form-control" placeholder="e.g. Senior Engineer, Professor">
										</div>
										<div class="form-group">
											<label>Organization</label>
											<input type="text" name="organization" class="form-control" placeholder="Company or Institute">
										</div>
										<button type="submit" class="btn btn-primary">Send Invite</button>
										<c:if test="${not empty error}">
											<div class="text-danger mt-2">${error}</div>
										</c:if>
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
