<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Hackthon</title>

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


 <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
        }
        .container {
            width: 95%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background: #f9f9f9;
        }
        .badge {
            padding: 5px 10px;
            border-radius: 12px;
            color: white;
            font-size: 12px;
        }
        .UPCOMING { background: #17a2b8; }
        .ONGOING { background: #28a745; }
        .COMPLETED { background: #6c757d; }

        .FREE { background: #28a745; }
        .PAID { background: #dc3545; }

        .btn {
            padding: 6px 10px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 13px;
            color: white;
        }
        .btn-add { background: #28a745; }
        .btn-edit { background: #ffc107; color: black; }
        .btn-delete { background: #dc3545; }
        .btn-view { background: #007bff; }
    </style>
    
    
</head>

<body>
	<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


	<div class="content">
		<div class="row justify-content-center">
			<div class="col-md-12 col-lg-10">
				<div class="card shadow">
					<div class="card-body p-4">
						<h4 class="text-center mb-4">All Hackthons</h4>


						<table>
							<thead>
								<tr>
									<th>#</th>
									<th>Title</th>
									<th>Status</th>
									<th>Event Type</th>
									<th>Payment</th>
									<th>Team Size</th>
									<th>Location</th>
									<th>Registration Period</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>
								<c:choose>
									<c:when test="${empty allHackthon}">
										<tr>
											<td colspan="9">No hackathons found</td>
										</tr>
									</c:when>

									<c:otherwise>
										<c:forEach var="h" items="${allHackthon}" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td>${h.title}</td>

												<td><span class="badge ${h.status}"> ${h.status}
												</span></td>

												<td>${h.eventType}</td>

												<td><span class="badge ${h.payment}">
														${h.payment} </span></td>

												<td>${h.minTeamSize} - ${h.maxTeamSize}</td>

												<td>${h.location}</td>

												<td>${h.registrationStartDate} to
													${h.registrationEndDate}</td>

												<td><a
													href="viewHackathon"
													class="btn btn-view">View</a> <a
													href="editHackathon"
													class="btn btn-edit">Edit</a> 
													
													
													<a
													href="deleteHackathon?hackathonId=${h.hackathonId}"
													class="btn btn-delete"
													onclick="return confirm('Are you sure you want to delete this hackathon?')">
														Delete </a></td>
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
	<jsp:include page="AdminFooter.jsp"></jsp:include>



</body>
</html>
