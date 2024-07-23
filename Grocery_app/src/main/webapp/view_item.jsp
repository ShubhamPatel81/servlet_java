<%@page import="com.entity.itemDetails"%>
<%@page import="com.DataBase.DatabaseConnect"%>
<%@page import="com.DataAccess.itemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

/* Toast notification styles */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	transform: translateX(-50%);
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 468;
	line-height: 0.5;
	color: #22262A;
	text-align: left;
	font-weight: 500;
	line-height: 0.5;
	padding-left: 7px;
}

}
#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View item</title>
<%@ include file="components/allcss.jsp"%>
</head>

<body style="background-color: #f0f1f2">
	<%@ include file="components/navbar.jsp"%>



	<%
	User u = (User) session.getAttribute("userobj");
	String addCartMessage = (String) session.getAttribute("add_cart");
	if (addCartMessage != null) {
	%>
	<div id="toast"><%=addCartMessage%></div>
	<script type="text/javascript">
        showToast();
        function showToast() {
            $('#toast').addClass("display");
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }
    </script>
	<%
	session.removeAttribute("add_cart"); // Remove the attribute to prevent it from showing on page refresh
	}
	%>


	<%
	int imgId = Integer.parseInt(request.getParameter("imgId"));
	itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
	itemDetails b = dao.getItemById(imgId);
	%>

	<div class="container p-2">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="img/<%=b.getPhotoName()%>"
					style="height: 150px; width: 150px">
				<h4 class="mt-3">
					Item Name: <span class="text-success"><%=b.getitemName()%></span>
				</h4>
				<h4>
					Auth: <span class="text-success"><%=b.getAuth()%></span>
				</h4>
				<h4>
					Catagory:<span class="text-success"><%=b.getitemCatogery()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2>
					Item Name: <span class="text-success"><%=b.getitemName()%></span>
				</h2>

				<%
				if ("Old".equals(b.getitemCatogery())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail()%></h5>
				<%
				}
				%>


				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bills fa-2x"></i>
						<p>Cash on delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free delivery</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getitemCatogery())) {
				%>

				<div class=" text-center ">
					<a href="index.jsp" class="btn btn-primary m-2"><i
						class="fa-solid fa-cart-shopping m-2"></i>Continue Shopping</a> <a
						href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign m-2"></i><%=b.getPrice()%></a>
				</div>


				<%
				} else {
				%>

				<div class=" text-center ">
					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-primary m-2">Add Cart</a>
					<%
					} else {
					%>
					<a href="card?bid=<%=b.getItemId()%>&userId=<%=u.getId()%>"
						class="btn btn-primary m-2">Add Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign "></i><%=b.getPrice()%></a>
				</div>

				<%
				}
				%>


			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>