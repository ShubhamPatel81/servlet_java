<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.entity.User" %>

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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home Page</title>
<%@ include file="../components/allcss.jsp"%>
<style type="text/css">
a {
    text-decoration: none;
    color: black;
}

a:hover {
    text-decoration: none;
    color: black;
}
</style>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <div class="container mt-3">
        <div class="row p-2">
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-3">
                <a href="add_items.jsp">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
                            <h4>Add Items</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-3">
                <a href="all_items.jsp">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-sort fa-3x text-danger"></i><br>
                            <h4>ALL Items</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-3">
                <a href="orders.jsp">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-box-tissue fa-3x text-warning"></i><br>
                            <h4>Orders</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-3">
                <a data-toggle="modal" data-target="#exampleModal">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h3>Do you want to logout</h3>
                    <div class="text-center">
                        <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close</button>
                        <a href="../logout" type="button" class="btn btn-primary">Logout</a>
                    </div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
