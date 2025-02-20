<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile - Marg ERP Cloud</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #0056b3;
        }
        .container {
           max-width: 700px;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
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

        .form-section {
            flex: 2;
            padding: 30px 20px;
        }
        .form-section h2 {
            font-size: 26px;
            color: #006b5d;
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
        <a href="index" class="home-btn" >Home</a>
</div>
    </div>
    <div class="container">
        <div class="form-section">
            <h1>Update Profile</h1>
            <h3>${Successful}</h3>
            <form action="updateProfile" method="post">
                <div class="row">
                <input type="text" name="id" value="${dto.getId()}" hidden/>
                    <div class="col-md-6 mb-3">
                        <label for="companyName" class="form-label">Company Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="companyName" name="companyName" value="${dto.getCompanyName()}" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${companyNameError}</span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="contactPerson" class="form-label">Contact Person *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input type="text" class="form-control" id="contactPerson" name="contactPerson" value="${dto.getContactPerson()}" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${contactPersonError}</span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="businessType" class="form-label">Business Type *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-diagram-2-fill"></i></span>
                            <select id="businessType" name="businessType"  class="form-select" required>
                                <option value="${dto.getBusinessType()}">${dto.getBusinessType()}</option>
                                <option value="Retail">Retail</option>
                                <option value="Wholesale">Wholesale</option>
                                <option value="Manufacturer">Manufacturer</option>
                            </select>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${businessTypeError}</span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mobile" class="form-label">Registered Mobile *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                            <input type="text" class="form-control" id="mobile" name="mobile" value="${dto.getMobile()}"required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${mobileError}</span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Registered Email *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" value="${dto.getEmail()}" readOnly>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${emailError}</span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="address" class="form-label">Address *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                            <input type="address" class="form-control" id="address" name="address" value="${dto.getAddress()}" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red">${addressError}</span></div>
                    </div>
                </div>
                <button type="submit" class="btn">Update Profile</button>
           </form>
        </div>
        <div class="info-section">
            <img src="img.png" alt="Marg ERP On Cloud">
            <h3>Access From Anywhere</h3>
            <p>Enjoy the convenience of 24/7 accessibility to Marg Cloud to monitor your business data, transactions, and expenses, keeping you up-to-date.</p>
        </div>
    </div>
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>
</body>
</html>
