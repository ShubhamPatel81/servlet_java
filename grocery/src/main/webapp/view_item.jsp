<%@page import="com.entity.itemDetails"%>
<%@page import="com.DataBase.DatabaseConnect"%>
<%@page import="com.DataAccess.itemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View item</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="components/navbar.jsp"%>
	<%
	int imgId = Integer.parseInt(request.getParameter("imgId"));
	itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
	itemDetails b = dao.getItemById(imgId);
	%>

	<div class="container p-2">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="img/<%=b.getPhotoName()%>"
					style="height: 150px; width: 150px">
				<h4 class="mt-3">
					Item Name: <span class="text-success"><%=b.getitemName()%></span>
				</h4>
				<h4>
					Auth: <span class="text-success"><%=b.getAuth()%></span>
				</h4>
				<h4>
					Catagory:<span class="text-success"><%=b.getitemCatogery()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2>
					Item Name: <span class="text-success"><%=b.getitemName()%></span>
				</h2>

				<%
				if ("Old".equals(b.getitemCatogery())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail()%></h5>
				<%
				}
				%>


				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bills fa-2x"></i>
						<p>Cash on delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free delivery</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getitemCatogery())) {
				%>

				<div class=" text-center ">
					<a href="index.jsp" class="btn btn-primary m-2"><i
						class="fa-solid fa-cart-shopping m-2"></i>Continue Shopping</a> <a
						href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign m-2"></i>200</a>
				</div>


				<%
				} else {
				%>

				<div class=" text-center ">
					<a href="" class="btn btn-primary m-2"><i
						class="fa-solid fa-cart-shopping m-2"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign m-2"></i>200</a>
				</div>

				<%
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>