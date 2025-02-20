<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - XWORKZ Pharm Cloud</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

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
            padding:10px;
        }

        .header .home-btn {
                                       background-color: #fff;        /* White background */
                                       color: #0056b3;                  /* Blue border to match the text color */
                                       padding: 8px 15px;             /* Padding for button size */
                                       font-size: 14px;               /* Font size */
                                       font-weight: bold;             /* Bold text */
                                       border-radius: 5px;            /* Rounded corners */
                                       cursor: pointer;              /* Pointer cursor on hover */
                                    text-decoration: none;
                                   }

                            .header .home-btn:hover {
                                background-color: #0056b3;
                                color:white;
                                 border: 2px solid black;
                            }

        footer {
            background-color: rgba(245, 249, 250, 0.9);
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

        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 100px); /* Subtract header and footer height */
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Optional for better design */
        }

        h2 {
            font-size: 36px;
            color: #0056b3;
        }

        p {
            font-size: 18px;
            color: #0056b3;
            margin: 20px 0;
        }



        .btn {
            display: inline-block;
            background-color: #0056b3;
            color: #fff;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border:2px solid white;
        }

        .btn:hover {
            background-color: white;
            color:#0056b3;
             box-shadow: 0 4px 10px rgba(255, 255, 255, 0.6);
        }
        .logo-container {
            box-shadow:  0 8px 15px rgba(256, 308, 261, 5.6);
         }
    </style>
</head>
<body>

    <div class="header">
       <div class="logo-container">
           <img src="logo.png" alt="medi-sales Logo" style="height: 40px;">
       </div>
        <div class="btn-group">
            <a href="signin" class="btn">Sign In</a>
            <a href="signup" class="btn">Sign Up</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2>Welcome to Medi-sales Pharm Cloud</h2>
            <p>Manage your business with ease, anytime and anywhere.</p>

        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
