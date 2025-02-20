<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Marg ERP Cloud</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 700px;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        /* Header Styling */
        .header {
            background-color: #0056b3;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }
        .header h1 {
            font-size: 20px;
            margin: 0;
        }
        .header .home-btn {
            background-color: #fff;
            color: #0056b3;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .header .home-btn:hover {
            background-color: #0056b3;
            color:white;
            border: 2px solid white;
        }
        /* Footer Styling */
        footer {
            background-color: #f5f9fa;
            color: #333;
            text-align: center;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
        footer p {
            margin: 0;
            font-size: 14px;
        }

        /* Form Section */
        .form-section {
            flex: 2;
            padding: 30px 20px;
        }
        .form-section h2 {
            font-size: 26px;
            color: #0056b3;
            margin-bottom: 10px;
        }
        .form-section p {
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn {
            width: 100%;
            background-color: #0056b3;
            color: #fff;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #003d80;
        }
        .form-section a {
            text-decoration: none;
            color: #0056b3;
            font-weight: bold;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            display: flex;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .info-section {
            flex: 1;
            background: linear-gradient(135deg, #e0f3ff, #f5f9fa);
            padding: 30px 15px;
            text-align: center;
        }
        .info-section img {
            width: 100px;
            margin-bottom: 20px;
        }

        /* Custom Styling for the Reset Password Form */
        .form-row {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo-container">
            <img src="logo.png" alt="medi-sales Logo" style="height: 40px;">
        </div>
        <div class="btn-group">
            <a href="index" class="home-btn">Home</a>
        </div>
    </div>

    <!-- Container -->
    <div class="container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Forgot Password</h2>
            <h3>${valid}<h3><h3>${Invalid}</h3>
            <p>Enter your registered email address to receive a password reset link.</p>
            <form action="forget" >

                <!-- Email Input for Password Reset -->
                <div class="form-group">
                    <label for="email">Registered Email *</label>
                    <input type="email" id="email" name="email" value="${email}"required>
                </div>

                <!-- New Password Input -->
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="newPassword">New Password:</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                    </div>
                </div>

                <!-- Confirm Password Input -->
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="confirmPassword">Confirm Password:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success btn-block">Reset Password</button>

                <!-- Back to Login Link -->
                <p>Remember your password? <a href="login.jsp">Login</a></p>
            </form>
        </div>

        <!-- Info Section -->
        <div class="info-section">
            <img src="img.png" alt="Marg ERP On Cloud">
            <h3>Secure Access</h3>
            <p>Log in to Marg Cloud to access all your business data, monitor transactions, expenses, and more from anywhere in the world with complete security and ease of use.</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
