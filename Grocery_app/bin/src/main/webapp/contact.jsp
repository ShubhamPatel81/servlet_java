<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS for styling -->
    <style>
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
        .form-control {
            border-color: #34eb80; /* light green border */
        }
        .form-control:focus {
            border-color: #28a745; /* darker green on focus */
            box-shadow: 0 0 0 0.2rem rgba(52,235,128,.25); /* green shadow on focus */
        }
        .btn-primary {
            background-color: #34eb80; /* light green button */
            border-color: #34eb80; /* light green border */
        }
        .btn-primary:hover {
            background-color: #28a745; /* darker green on hover */
            border-color: #28a745; /* darker green border on hover */
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="index.jsp">
        <i class="fas fa-shopping-cart"></i> Grocery Store
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center"><i class="fas fa-envelope"></i> Contact Us</h2>
    <p class="text-center">We'd love to hear from you! Please fill out the form below to get in touch with us.</p>

    <form action="ContactServlet" method="post">
        <div class="form-group">
            <label for="name"><i class="fas fa-user"></i> Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email"><i class="fas fa-at"></i> Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="subject"><i class="fas fa-heading"></i> Subject:</label>
            <input type="text" class="form-control" id="subject" name="subject" required>
        </div>
        <div class="form-group">
            <label for="message"><i class="fas fa-comment-alt"></i> Message:</label>
            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Submit</button>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
