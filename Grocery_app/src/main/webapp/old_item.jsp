<%@page import="com.entity.itemDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DataBase.DatabaseConnect"%>
<%@page import="com.DataAccess.itemDAOImpl"%>
<%@page import="com.entity.User"%>
<!-- Make sure to import the User class -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User old books</title>
<%@ include file="components/allcss.jsp"%>

<!-- Ensure proper scaling for mobile devices -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style>
    body {
        background-color: #f7f7f9;
    }
    .table-responsive {
        overflow-x: auto; /* Enable horizontal scroll on small screens */
    }
</style>
</head>
<body>
    <%@ include file="components/navbar.jsp"%>
    <div class="container-fluid p-5">
        <c:if test="${not empty success_msg}">
            <div class="alert alert-success text-center">${success_msg}</div>
            <c:remove var="success_msg" scope="session" />
        </c:if>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Item Name</th>
                        <th scope="col">Auth</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    User us = (User) session.getAttribute("userobj");
                    if (us != null) {
                        String email = us.getEmail();
                        itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
                        List<itemDetails> list = dao.getItemByOld(email, "Old");
                        for (itemDetails i : list) {
                    %>
                    <tr>
                        <td><%=i.getitemName()%></td>
                        <td><%=i.getAuth()%></td>
                        <td><%=i.getPrice()%></td>
                        <td><%=i.getitemCatogery()%></td>
                        <td><a href="delete_old_item? email=<%=email%>&&id=<%=i.getItemId()%>"
                                class="btn btn-sm btn-danger"> Delete </a></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">User not logged in. Please <a href="login.jsp">log in</a> first.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
