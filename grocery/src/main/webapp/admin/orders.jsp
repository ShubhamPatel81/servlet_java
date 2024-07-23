<%@page import="com.DataBase.DatabaseConnect"%>
<%@page import="com.entity.ItemOrder"%>
<%@page import="com.DataAccess.ItemOrderImpl"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@ include file="../components/allcss.jsp"%>
<style>
.table-responsive {
    margin-top: 20px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
    // Retrieve the session
    HttpSession mySession = request.getSession(false);
    User userobj = (User) mySession.getAttribute("userobj");

    // Check if the user is not logged in, redirect to login page
    if (userobj == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
	<div class="container mt-5">
		<h2 class="text-center">Hello Admin</h2>
		<div class="table-responsive">
			<table class="table table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Order ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone No.</th>
						<th scope="col">Item Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>
					</tr>
				</thead>
				<tbody>
					<%
					ItemOrderImpl dao = new ItemOrderImpl(DatabaseConnect.getConn());
					List<ItemOrder> blist = dao.getAllItem();
					for(ItemOrder b:blist){%>
					<tr>
						<th scope="row"><%=b.getId() %></th>
						<td><%=b.getUserName() %></td>
						<td><%=b.getEmail() %></td>
						<td><%=b.getFullAddress() %></td>
						<td><%=b.getPnumber() %></td>
						<td><%=b.getItemName() %></td>
						<td><%=b.getAuth()%></td>
						<td><%=b.getPrice() %></td>
						<td><%=b.getPaymenttype() %></td>
					</tr>
					<%}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
