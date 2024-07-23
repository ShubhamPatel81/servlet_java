<%@page import="com.entity.User" %>
<%@page import="com.entity.*" %>
<%@ page import="com.DataAccess.CartDAO "%>
<%@ page import="java.util.List"%>
<%@ page import="com.DataAccess.*"%>
<%@ page import="com.DataBase.DatabaseConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
    body {
        background-color: #f0f0f0;
    }

    .card-body {
        padding: 1.25rem;
    }

    @media (max-width: 768px) {
        .card-body {
            padding: 1rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .btn {
            margin-bottom: 10px;
        }

        table {
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>
    <%@ include file="components/navbar.jsp"%>
    <c:if test="${empty sessionScope.userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <c:if test="${not empty success_msg}">
        <div class="alert alert-success text-center" role="alert">${success_msg}</div>
        <c:remove var="success_msg" scope="session"></c:remove>
    </c:if>

    <c:if test="${not empty failes_msg}">
        <div class="alert alert-danger text-center" role="alert">${failes_msg}</div>
        <c:remove var="failes_msg" scope="session"></c:remove>
    </c:if>

    <div class="container">
        <div class="row p-2">
            <div class="col-md-8">
                <div class="card bg-white mb-3">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Selected Items</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Item Name</th>
                                    <th scope="col">Auth</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User u = (User) session.getAttribute("userobj");
                                if (u != null) {
                                    CartDAOImpl dao = new CartDAOImpl(DatabaseConnect.getConn());
                                    List<Cart> cart = dao.getItemByUser(u.getId());
                                    Double totalPrice = 0.00;
                                    for (Cart c : cart) {
                                        totalPrice += c.getPrice();
                                %>
                                <tr>
                                    <th scope="row"><%=c.getItemName()%></th>
                                    <td><%=c.getAuth()%></td>
                                    <td><%=c.getPrice()%></td>
                                    <td><a href="remove_book?bid=<%=c.getBid() %>&userId=<%=c.getUserId() %>&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a></td>
                                </tr>
                                <%
                                    }
                                %>
                                <tr>
                                    <td>Total Price</td>
                                    <td></td>
                                    <td><%=totalPrice%></td>
                                </tr>
                                <%
                                } else {
                                    response.sendRedirect("login.jsp");
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-white">
                    <div class="card-body text-success">
                        <h3 class="text-center">Your Details for Order</h3>
                        <form action="order" method="post">
                            <input type="hidden" value="${userobj.id}" name="userId">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Name</label>
                                    <input type="text" name="username" class="form-control" id="inputEmail4" placeholder="" value="${userobj.name}" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Email</label>
                                    <input type="email" name="email" required="required" class="form-control" id="inputPassword4" value="${userobj.email}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Phone number</label>
                                    <input type="number" class="form-control" id="inputEmail4" value="${userobj.pnumber}" name="pnumber" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Address</label>
                                    <input type="text" name="address" class="form-control" id="inputPassword4" required="required">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Landmark</label>
                                    <input type="text" name="landmark" class="form-control" id="inputEmail4" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">City</label>
                                    <input type="text" name="city" class="form-control" id="inputPassword4" required="required">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">State</label>
                                    <input type="text" name="state" class="form-control" id="inputEmail4" required="required">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">PIN Code</label>
                                    <input type="text" name="pincode" class="form-control" id="inputPassword4" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="paymenttype">
                                    <option value="noselect">---Select---</option>
                                    <option value="COD">Cash on Delivery</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning">Order Now</button>
                                <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
