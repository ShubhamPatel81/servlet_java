<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Items Page</title>
<%@ include file="../components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f6">

    <%@include file="navbar.jsp"%>
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
    <div class="container">
        <div class="row p-2">
            <div class="col-md-4 offset-md-4 col-sm-12">
                <div class="card">
                    <div class="card-body">

                        <h3 class="text-center">Add Items</h3>
                        <c:if test="${not empty success_msg}">
                            <p class="text-center text-success">${success_msg}</p>
                            <c:remove var="success_msg" scope="session" />
                        </c:if>
                        <c:if test="${not empty failed_msg}">
                            <p class="text-center text-danger">${failed_msg}</p>
                            <c:remove var="failed_msg" scope="session" />
                        </c:if>

                        <form action="../add_items" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="itemname">Item Name</label>
                                <input type="text" class="form-control" id="itemname" name="itemname">
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input type="text" class="form-control" id="description" name="description">
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" id="price" name="price">
                            </div>
                            <div class="form-group">
                                <label for="itemtype">Item Categories</label>
                                <select name="itemtype" id="itemtype" class="form-control">
                                    <option selected>----Select----</option>
                                    <option value="New">New Item</option>
                                    <option value="Old">Old Item</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="itemstatus">Item Status</label>
                                <select name="itemstatus" id="itemstatus" class="form-control">
                                    <option selected>----Select----</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="itemimage">Upload Photo</label>
                                <input type="file" name="itemimage" class="form-control-file" id="itemimage">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Add</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div><%@ include file="footer.jsp"%></div>
</body>
</html>
