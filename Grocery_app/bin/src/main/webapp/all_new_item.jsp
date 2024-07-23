<%@ page import="com.UserServlet.RegisterServlet"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.DataBase.DatabaseConnect"%>
<%@ page import="com.entity.itemDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DataAccess.itemDAOImpl"%>
<%@ page import="com.DataAccess.itemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Items</title>
<%@ include file="components/allcss.jsp"%>
<style type="text/css">
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

}

/* General body and card styles */
body {
	background-color: #f7f7f6;
}

.crd-ho:hover {
	background-color: #f7f7f9;
}

.card-body {
	padding: 1.25rem;
}

.card img {
	max-width: 100%;
	height: auto;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.card {
		margin-bottom: 15px;
	}
	.card-body {
		padding: 1rem;
	}
	#toast {
		min-width: auto;
		width: 80%;
		font-size: 14px;
	}
}
</style>
</head>
<body>

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

	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			itemDAOImpl dao = new itemDAOImpl(DatabaseConnect.getConn());
			List<itemDetails> list = dao.getAllNewItem();
			for (itemDetails b : list) {
			%>
			<div class="col-lg-3 col-md-4 col-sm-6 mb-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100%; height: auto;" class="img-thumbnail mb-3">
						<p><%=b.getitemName()%></p>
						<p><%=b.getAuth()%></p>
						<p>
							Categories:
							<%=b.getitemCatogery()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="card?bid=<%=b.getItemId()%>&&userId=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_item.jsp?imgId=<%=b.getItemId()%>"
								class="btn btn-success btn-sm ml-1 mr-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm "><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
