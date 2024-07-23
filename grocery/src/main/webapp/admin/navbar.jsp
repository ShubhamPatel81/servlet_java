<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.UserServlet.LoginServlet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.navbar {
	position: -webkit-sticky; /* For Safari */
	position: sticky;
	top: 0;
	color: white;
	padding: 10px 20px;
	z-index: 1000;
}

.bg-custom {
	background-color: #34eb80; /* Your custom background color */
}

body {
	background-color: #f0f0f0;
}

.navbar {
	background-color: #343a40; /* dark background */
}

.navbar-brand, .navbar-nav .nav-link {
	color: #ffffff; /* white text */
}

.navbar-brand:hover, .navbar-nav .nav-link:hover {
	color: #34eb80; /* light green on hover */
}

.navbar .nav-item:hover {
	background-color: #ada9a9;
	border-radius: 11px;
}

.form-control:focus {
	border-color: #28a745; /* darker green on focus */
	box-shadow: 0 0 0 0.2rem rgba(52, 235, 128, .25);
	/* green shadow on focus */
}

.navbar .nav-item:hover .nav-link {
	background-color: #ada9a9;
	border-radius: 11px; /* light green button */
	border-color: #34eb80; /* light green border */
}

.btn-primary:hover {
	background-color: #28a745; /* darker green on hover */
	border-color: #28a745; /* darker green border on hover */
}

.swapmart-heading {
	color: #007bff; /* blue color */
}

.swapmart-heading:hover {
	color: #0056b3; /* darker blue on hover */
	text-decoration: none;
}
</style>
</head>
<body>

	<!-- Top bar -->
	<div class="container-fluid"
		style="height: .7rem; background-color: #343a40"></div>

	<!-- Main navigation -->
	<div class="container-fluid p-3">
		<div class="row align-items-center">
			<div class="col-6 col-md-3 text-success">
				<h3>
					<a href="../index.jsp" class="swapmart-heading"> <i
						class="fa-solid fa-cart-shopping"></i> SwapMart
					</a>
				</h3>
			</div>
		</div>
	</div>

	<!-- Main navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="adminhome.jsp">Home <span class="sr-only">(current)</span></a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="../setting.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
					type="button"><i class="fa-solid fa-gear"></i> Setting</a> <a
					href="../contact.jsp" class="btn btn-light my-2 my-sm-1 ml-1"
					type="button"><i class="fa-solid fa-gear"></i> Contact us</a>
			</form>
		</div>
	</nav>
	<!-- end Navbar -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
