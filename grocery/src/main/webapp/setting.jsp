<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting page here</title>
<%@ include file="components/allcss.jsp"%>
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
<body style="background-color: #f7f7f9;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@ include file="components/navbar.jsp"%>
	<div class="container">
		<c:if test="${not empty userobj}">
			<h3 class="text-center bold">Hello, ${userobj.name}</h3>
		</c:if>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_item.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary fa-3x">
								<i class="fa-brands fa-sellcast"></i>
							</div>
							<h3>Sell old item</h3>
						</div>
					</div>

				</a>
			</div>
			<div class="col-md-4">
				<a href="old_item.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary fa-3x">
								<i class="fa-brands fa-sellcast"></i>
							</div>
							<h3> old item</h3>
						</div>
					</div>

				</a>
			</div>


			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary fa-3x">
								<i class="fa-solid fa-pen-to-square"></i>
							</div>
							<h4>Login & Security(Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>


		
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger  fa-3x">
								<i class="fa-solid fa-box-open"></i>
							</div>
							<h4>my order</h4>
							<p>Track your order</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary  fa-3x">
								<i class="fas fa-user-circle"></i>
							</div>
							<h4>Help center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>