<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell item page</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f6;">

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>
	<%@ include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary p-1">Sell Item</h4>
						
						<c:if test="${not empty success_msg}">
							<p class="text-center text-success">${success_msg}</p>
							<c:remove var="success_msg" scope="session" />
						</c:if>
						<c:if test="${not empty failed_msg}">
							<p class="text-center text-danger">${failed_msg}</p>
							<c:remove var="failed_msg" scope="session" />
						</c:if>
						
						
						<form action="${pageContext.request.contextPath}/add_old_items" method="post" >
    <!-- form fields -->

							<input type="hidden" value="${userobj.email } " name="usersell">
							<div class="form-group">
								<label for="exampleInputEmail1">Item Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="itemname">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Auth</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="description">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price">
							</div>



							<div class="form-group">
								<label for="exampleFormConterolFile1">Upload Photo</label> <input
									type="file" name="itemimage" class="form-control-file"
									id="exampleFormConterolFile1" />
							</div>

							<button type="submit" class="btn btn-primary">Sell item</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>