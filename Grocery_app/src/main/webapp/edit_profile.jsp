<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.UserServlet.RegisterServlet" %>
<%@ page import="com.DataAccess.itemDAOImpl" %>
	<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile page</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f6;">
	<%@ include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						
						<c:if test="${not empty failed_msg}">
							<p class="text-center text-danger">${failed_msg}</p>
							<c:remove var="failed" scope="session" />
						</c:if>

						<c:if test="${not empty success_msg}">
							<p class="text-center text-success">${success_msg}</p>
							<c:remove var="success_msg" scope="session" />
						</c:if>
						
						
						<form action="update_profile" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="name">Enter Name</label> <input type="text"
									class="form-control" id="name" required="required" name="fname" value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" required="required"
									name="email" value="${userobj.email }">
							</div>
							<div class="form-group">
								<label for="phone">Phone Number</label> <input type="number"
									class="form-control" id="phone" required="required"
									name="phoneno" value="${userobj.pnumber }">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" required="required"
									name="password">
							</div>

							<button type="submit" class="btn btn-primary btn-block">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>