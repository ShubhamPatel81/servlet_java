<%@ page import="com.UserServlet.RegisterServlet"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.DataBase.DatabaseConnect"%>
<%@ page import="com.entity.itemDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DataAccess.itemDAOImpl"%>
<%@ page import="com.DataAccess.itemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Page</title>
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
	.img-thumblin {
		width: 100px;
		height: 150px;
	}
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			User u = (User) session.getAttribute("userobj");
			itemDAOImpl dao2 = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list2 = dao2.getAllRecentItem();
			for (itemDetails b : list2) {
			%>
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="card crd-ho h-100 mt-2">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							class="img-fluid mb-2 img-thumblin">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							Categories:
							<%=b.getitemCatogery()%></p>
						<div class="d-flex align-items-center ">
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm mb-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm mb-1"><i
								class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							if (!b.getitemCatogery().equals("Old")) {
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mb-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="card?bid=<%=b.getItemId()%>&userId=<%=u.getId()%>"
								class="btn btn-danger btn-sm mb-1">Add Cart</a>
							<%
							}
							}
							%>
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
