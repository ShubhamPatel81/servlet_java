<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        .navbar {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            color: white;
            padding: 10px 20px;
            z-index: 1000;
        }
        .bg-custom {
            background-color: #34eb80;
        }
        body {
            background-color: #f0f0f0;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #ffffff;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #34eb80;
        }
        .navbar .nav-item:hover {
            background-color: #ada9a9;
            border-radius: 11px;
        }
        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 0.2rem rgba(52, 235, 128, .25);
        }
        .navbar .nav-item:hover .nav-link {
            background-color: #ada9a9;
            border-radius: 11px;
        }
        .btn-primary:hover {
            background-color: #28a745;
            border-color: #28a745;
        }
        .swapmart-heading {
            color: #007bff;
        }
        .swapmart-heading:hover {
            color: #0056b3;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Top bar -->
    <div class="container-fluid" style="height: .7rem; background-color: #343a40"></div>

    <!-- Main navigation -->
    <div class="container-fluid p-3">
        <div class="row align-items-center">
            <div class="col-6 col-md-3 text-success">
                <h3>
                    <a href="index.jsp" class="swapmart-heading">
                        <i class="fa-solid fa-cart-shopping"></i> SwapMart
                    </a>
                </h3>
            </div>
            <div class="col-6 col-md-9 text-right">
                <div class="form-inline my-2 my-lg-0 d-flex justify-content-end">
                    <!-- Your user links here -->
                </div>
            </div>
        </div>
    </div>

    <!-- Main navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_recent_item.jsp">Recent Items</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_new_item.jsp">New Items</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all_old_item.jsp">Old Items</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <div class="input-group">
                    <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </div>
            </form>
            <div class="form-inline my-2 my-lg-0 ml-2">
                <a href="setting.jsp" class="btn btn-light my-2 my-sm-0"><i class="fa-solid fa-gear"></i> Setting</a>
                <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1"><i class="fa-solid fa-gear"></i> Contact Us</a>
            </div>
        </div>
    </nav>
    <!-- end Navbar -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.navbar-nav .nav-link').on('click', function() {
                $('.navbar-collapse').collapse('hide');
            });
        });
    </script>
</body>
</html>
