<%@ page import="java.util.List"%>
<%@ page import="com.entity.itemDetails"%>
<%@ page import="com.DataBase.DatabaseConnect"%>
<%@ page import="com.DataAccess.itemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.entity.User"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Items Page</title>
<%@ include file="allcss.jsp"%>
</head>
<body>

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
    <%@ include file="navbar.jsp"%>
    <h2 class="text-center">Hello Admin</h2>

    <div class="container">
        <c:if test="${not empty success_msg}">
            <p class="text-center text-success">${success_msg}</p>
            <c: remove var="success_msg" scope="session" />
        </c:if>
        <c:if test="${not empty failed_msg}">
            <p class="text-center text-danger">${failed_msg}</p>
            <c:remove var="failed_msg" scope="session" />
        </c:if>

        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Image</th>
                        <th scope="col">Item Name</th>
                        <th scope="col">Auth</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
                    List<itemDetails> list = dao.getAllItems();
                    for (itemDetails b : list) {
                    %>
                    <tr>
                        <td><%=b.getItemId()%></td>
                        <td><img src="../img/<%=b.getPhotoName()%>" width="50" height="50"></td>
                        <td><%=b.getitemName()%></td>
                        <td><%=b.getAuth()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getitemCatogery()%></td>
                        <td><%=b.getStatus()%></td>
                        <td>
                            <a href="edit_item.jsp?id=<%=b.getItemId()%>" class="btn btn-sm btn-primary">
                                <i class="fa-solid fa-pen-to-square"></i> Edit
                            </a> 
                            <a href="../delete?id=<%=b.getItemId()%>" class="btn btn-danger">
                                <i class="fa-solid fa-trash"></i> Remove
                            </a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <div><%@ include file="footer.jsp"%></div>
</body>
</html>
