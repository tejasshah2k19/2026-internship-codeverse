
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>CodeVerse : Edit Category</title>
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
									<h3 class="font-weight-bold">Edit Category</h3>

								</div>

							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<p class="card-title">Edit Category</p>
										<a href="listCategory" class="text-info">View all</a>
									</div>
									<form action="updateCategory" method="post">

										<!-- Category Name -->
										<div class="mb-3">
											<label class="form-label">Category Name</label> <input
												type="text" name="categoryName" value="${category.categoryName}" class="form-control"
												placeholder="Enter category name" required>
										</div>
										
										<input type="hidden" name="categoryId" value="${category.categoryId}"/>

										<!-- Buttons -->
										 
											<button type="submit" class="btn btn-primary">Update
												Category</button>
											<a href="listCategory" class="btn btn-secondary">
												Cancel </a>
									 

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