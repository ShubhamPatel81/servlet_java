<%@page import="com.DataBase.DatabaseConnect"%>
<%@page import="com.entity.itemDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DataAccess.itemDAOImpl"%>
<%@page import="com.DataAccess.itemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Items</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f7f7f6;
}

.crd-ho:hover {
	background-color: #f7f7f9;
}

.card-body {
	padding: 1.25rem; /* Adjust padding for better mobile view */
}

.card img {
	max-width: 100%;
	height: auto;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.card-body {
		padding: 1rem;
	}
	.btn {
		margin-bottom: 10px;
	}
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list = dao.getAllOldItem();
			for (itemDetails b : list) {
			%>
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="card crd-ho h-100">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>" class="img-fluid mb-2"
							style="width: 100px; height: 150px">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							Categories:
							<%=b.getitemCatogery()%></p>
						<div class="d-flex align-items-center ml-4">
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm mr-1">View Details</a>
							<p 	class="btn btn-danger btn-sm mb-1">
								<i class="fas fa-rupee-sign"></i>
								<%=b.getPrice()%></p>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
