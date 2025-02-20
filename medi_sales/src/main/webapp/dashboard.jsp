<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="logo.png" type="image/png">
    <title>Dashboard - Marg ERP Cloud</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* General Styling */
         body {
                   font-family: Arial, sans-serif;
                   margin: 0;
                   padding: 0;
                   background: url('background.jpg') no-repeat center center fixed;
                   background-size: cover;
                   color: #333;
               }

        /* Header */
        .header {
            background-color: #0056b3;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1050;
        }

        /* Left section: Logo and Menu */
        .left-header {
            display: flex;
            align-items: center;
        }

        .menu-icon {
            font-size: 28px;
            cursor: pointer;
            color: white;
            margin-right: 15px;
            background: none;
            border: none;
        }

        .logo-container img {
            height: 40px;
        }

        /* Main Content */
        .main-content {
            flex: 1; /* Makes content fill available space */
            margin-top: 70px; /* Space below the fixed header */
            padding: 20px;
        }

        /* Sidebar Styling */
        .offcanvas {
            background-color: #003d80;
            color: white;
        }

        .offcanvas-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .offcanvas-body a {
            display: block;
            padding: 12px;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
        }

        .offcanvas-body a:hover {
            background-color: #0056b3;
        }

        /* Footer - Fixed at Bottom */
        footer {
            background-color: #f5f9fa;
            color: #333;
            text-align: center;
            padding: 10px 20px;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <!-- Left Section: Sidebar Button + Logo -->
        <div class="left-header">
            <button class="menu-icon" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar">
                &#9776;
            </button>
            <div class="logo-container">
                <img src="logo.png" alt="Marg ERP Logo">
            </div>
        </div>

        <!-- Right Section: Home & Logout Buttons -->
        <div>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>

    <!-- Sidebar -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="sidebar">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title">Menu</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <a href="createstock" class="btn btn-outline-light w-100 mb-2">Create Stock</a>
            <a href="getallstocks" class="btn btn-outline-light w-100">View Stock</a>
            <a href="generatebill" class="btn btn-outline-light w-100">Generate Bill</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2 class="text-primary">Hello, ${dto.getContactPerson()}! Welcome back to your dashboard.</h2>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>