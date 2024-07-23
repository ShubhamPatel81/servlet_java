<%@ page import="com.UserServlet.RegisterServlet"%>
<%@ page import="javax.xml.crypto.Data"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.itemDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DataAccess.itemDAOImpl"%>
<%@ page import="com.DataAccess.*" %>
<%@ page import="com.DataBase.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SwapMart</title>
<%@ include file="components/allcss.jsp"%>

<style type="text/css">
body {
	background-color: #f7f7f6;
}

.back-img {
	background: url("img/heroimg.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	width: 100%;
	height: 60vh;
	box-shadow: 0px 4px 8px rgba(111, 0, 0, 0.1); /* Add shadow effect */
}

.crd-ho {
	height: 100%; /* Ensure all cards have the same height */
}

.card-body {
	height: 320px; /* Fixed height for each card body */
	overflow-y: auto;
	/* Enable vertical scrolling for overflowed content */
	padding: 1.25rem; /* Adjust padding for better mobile view */
}

.card img {
	max-width: 100%;
	height: auto;
}
</style>

<!-- Ensure the viewport is set correctly for responsive design -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>


	<%@ include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div
			class="container-fluid back-img d-flex align-items-center justify-content-center text-white">
			<h3></h3>
		</div>
	</div>

	<!-- Start Recent elements -->
	<div class="container">
		<h3 class="text-center mt-3">Recent Item</h3>
		<div class="row mt-2">

			<%
			User u = (User) session.getAttribute("userobj");
			itemDAOImpl dao2 = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list2 = dao2.getRecentItems();
			for (itemDetails b : list2) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100%; height: auto;" class="img-thumbnail mb-3">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							<%
							if (b.getitemCatogery().equals("Old")) {
							%>
						
						<div class="row">
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm ml-1 mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<p>
							Categories:
							<%=b.getitemCatogery()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="card?bid=<%=b.getItemId()%>&&userId=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm ml-1 mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_recent_item.jsp"
				class="btn btn-danger btn-sm text-white">View More</a>
		</div>
	</div>
	<!-- End -->

	<!-- Start new elements -->
	<div class="container">
		<h3 class="text-center my-4">New Item</h3>
		<div class="row">
			<%
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list = dao.getNewItem();
			for (itemDetails b : list) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100%; height: auto;" class="img-thumbnail mb-3">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							Categories:
							<%=b.getitemCatogery()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="card?bid=<%=b.getItemId()%>&&userId=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm ml-1 mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_new_item.jsp" class="btn btn-danger btn-sm text-white">View
				More</a>
		</div>
	</div>
	<!-- End -->

	<!-- Start old elements -->
	<div class="container">
		<h3 class="text-center my-4">Old Items</h3>
		<div class="row">
			<%
			itemDAOImpl dao3 = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list3 = dao3.getOldItem();
			for (itemDetails b : list3) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100%; height: auto;" class="img-thumbnail mb-3">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p><%=b.getitemCatogery()%></p>
						<div class="row">
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm ml mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<a href="all_old_item.jsp" class="btn btn-danger btn-sm text-white">View
				More</a>
		</div>
	</div>
	<!-- End -->

	<%@ include file="components/footer.jsp"%>
</body>
</html>
