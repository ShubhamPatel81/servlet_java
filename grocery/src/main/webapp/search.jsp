
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
<title>search page</title>
<%@ include file="components/allcss.jsp"%>
</head>
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
</style>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			String ch=request.getParameter("ch");
			itemDAOImpl dao2 = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list2 = dao2.getItemBySeach(ch);
			for (itemDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							<%
							if (b.getitemCatogery().equals("Old")) {
							%>
							Catagories:<%=b.getitemCatogery()%></p>
						<div class="row">

							<a href="view_item.jsp?imgId=<%=b.getItemId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Catagories:<%=b.getitemCatogery()%>
						</p>
						<div class="row">

							<a href="" class="btn btn-danger btn-sm ml-1">Add Cart</a> <a
								href="view_item.jsp?imgId=<%=b.getItemId()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
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
	</div>


</body>
</html>