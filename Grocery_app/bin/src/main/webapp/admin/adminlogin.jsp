<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page isELIgnored="false"%>
<%@ include file="navbar.jsp"%>


<%
HttpSession session = request.getSession(false);
if (session == null || session.getAttribute("isAdmin") == null) {
	response.sendRedirect("login.jsp");
	return;
}
String userEmail = (String) session.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f0f0">
	<div class="container p-4">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Welcome, Admin</h3>
						<p>Your email: ${userEmail}</p>
						<!-- Display admin-specific content here -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
