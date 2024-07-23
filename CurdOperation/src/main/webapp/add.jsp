<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.servlet.RegisterServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add</title>
<%@ include file="CSS.jsp"%>
</head>

<body class="bg-light">
	<%@include file="navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">ADD</p>
						<form action="./register" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input type="text"
									name="name" class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									name="dob" type="date" class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label"> address</label> <input type="text"
									name="address" class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Qualification </label> <input
									name="qualification" type="text" class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" class="form-control">

							</div>


							<button type="submit" class="btn btn-primary col-md-12 ">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>