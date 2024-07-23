<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordered successfully message page</title>
<%@include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f0f0f0">
	<%@ include file="components/navbar.jsp"%>

	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully</h2>
		<h5>Within 7 Days your Order will be Deliverd In Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="user_order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>

</body>
</html>