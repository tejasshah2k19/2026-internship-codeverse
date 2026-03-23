<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>New Hackathon Description</title>
<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="AdminHeader.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="AdminLeftSidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<h3 class="font-weight-bold mb-3">New Hackathon Description</h3>
					<div class="row">
						<div class="col-md-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Add Description</p>
										<a href="listHackathonDescription" class="text-info">View all</a>
									</div>
									<form action="saveHackathonDescription" method="post">
										<div class="form-group">
											<label>Hackathon</label>
											<select name="hackathonId" class="form-control" required>
												<option value="">-- Select Hackathon --</option>
												<c:forEach var="h" items="${allHackthon}">
													<option value="${h.hackathonId}" ${hackathonId == h.hackathonId ? 'selected' : ''}>${h.title}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label>Hackathon Details (HTML)</label>
											<textarea name="hackathonDetails" class="form-control" rows="10" required></textarea>
										</div>
										<button type="submit" class="btn btn-primary">Save Description</button>
										<a href="listHackathonDescription" class="btn btn-secondary">Cancel</a>
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
