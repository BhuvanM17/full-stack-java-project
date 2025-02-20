<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Stock- MEDI-SALES</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        /* General Styling */
        body {
             font-family: 'Segoe UI Emoji', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #0056b3;
        }
        .container {
           max-width: 500px;
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
                                 border: 2px solid white;
                            }


        /* Footer Styling */
        footer {
            background-color: #0056b3;
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
            color: #1d1ef2;
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
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            gap: 10px;
        }
        .radio-group input {
            margin-top: 4px;
        }
        .radio-group label {
            font-size: 14px;
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
            background-color: #004f43;
        }
        .form-section a {
            text-decoration: none;
            color: #006b5d;
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
                .form-section {
                    flex: 2;
                    padding: 40px 30px;
                }
                .form-section h2 {
                    font-size: 26px;
                    color: #006b5d;
                    margin-bottom: 20px;
                }
                .btn {
                    width: 100%;
                    background-color:#0056b3;
                    color: #fff;
                    border: none;
                    padding: 12px;
                    font-size: 16px;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                .btn:hover {
                    background-color: #0056b2;
                }
                .info-section {
                    flex: 1;
                    background: linear-gradient(135deg, #0056b3 , #f5f9fa);
                     padding: 30px 15px;
                    text-align: center;
                }
                .info-section img {
                    width: 100px;
                    margin-bottom: 20px;
                }

        /* Toggle Password Visibility */
        .password-toggle {
            position: relative;
        }
        .password-toggle input {
            padding-right: 40px;
        }
        .password-toggle .toggle-btn {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
            color: #aaa;
        }
        .password-toggle .toggle-btn:hover {
            color: #333;
             cursor: pointer;
        }
.logo-container {
            box-shadow:  0 8px 15px rgba(256, 308, 261, 5.6);
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
          <button class="home-btn" onclick="window.history.back();">Back</button>
        </div>
    </div>

    <div class="container">
        <div class="form-section">
            <h2>Create Stock</h2>
            <p>Register Your Product on MEDI-SALES Cloud</p>
            <form action="stock" method="post" >
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="productCompany" class="form-label">Product Company *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="productCompany" name="productCompany" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="productName" class="form-label">Product Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-box"></i></span>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mrp" class="form-label">MRP *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="text" class="form-control" id="mrp" name="mrp" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="pack" class="form-label">Pack *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="text" class="form-control" id="pack" name="pack" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mfgDate" class="form-label">Manufacturing Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                            <input type="date" class="form-control" id="mfgDate" name="mfgDate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="expDate" class="form-label">Expiration Date *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-calendar-x"></i></span>
                            <input type="date" class="form-control" id="expDate" name="expDate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="quantity" class="form-label">Quantity *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="rate" class="form-label">Rate *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="text" class="form-control" id="rate" name="rate" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                         <label for="gst" class="form-label">Gst *</label>
                         <div class="input-group">
                             <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                              <input type="text" class="form-control" id="rate" name="gst" required>
                         </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="discount" class="form-label">Discount *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-percent"></i></span>
                            <input type="text" class="form-control" id="discount" name="discount" required>
                             </div>
                    </div>
                </div>
                <button type="submit" id="submit-btn" class="btn">Register Product</button>
            </form>
        </div>
        <div class="info-section">
                    <img src="img.png" alt="Marg ERP On Cloud">
                    <h3>Secure Access</h3>
                   <p>Effortlessly manage and create stock items on Marg Cloud, track inventory levels, monitor stock movements, and streamline your business operations with real-time updates and complete control over your stock data.</p>   </div>
    </div>
<p>${success}</p>
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>

</body>
</html>
