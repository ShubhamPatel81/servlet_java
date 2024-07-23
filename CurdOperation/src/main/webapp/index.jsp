<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBCONNECTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CURD OPERATION</title>

<%@ include file="CSS.jsp"%>
</head>
<body class="bg-light">
	<%@include file="navbar.jsp"%>
	
	
	<div class="container p-4">
		<div class="card">
			<div class="card-body">
				<h1 class="text-center">All Items Are</h1>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">name</th>
							<th scope="col">DOB</th>
							<th scope="col">address</th>
							<th scope="col">qualification</th>
							<th scope="col">email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>@mdo</td>
							<td><a class="btn btn-sm btn-primary" href="edit.jsp">Edit</a>
								<a class="btn btn-sm btn-danger ms-1" href="">Delete</a></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>