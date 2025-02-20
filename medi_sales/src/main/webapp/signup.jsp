<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - Marg ERP Cloud</title>
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
        <a href="index" class="home-btn" >Home</a>
        </div>
    </div>

    <div class="container">
        <div class="form-section">
            <h2>Sign Up</h2>
            <p>Create an Account on Marg ERP Cloud</p>
            <form action="registration" method="post" id="signUpForm">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="companyName" class="form-label">Company Name *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-building"></i></span>
                            <input type="text" class="form-control" id="companyName" name="companyName" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red" id="companyNameError"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="contactPerson" class="form-label">Contact Person *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person"></i></span>
                            <input type="text" class="form-control" id="contactPerson" name="contactPerson" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red" id="contactPersonError"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="businessType" class="form-label">Business Type *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-diagram-2-fill"></i></span>
                            <select id="businessType" name="businessType" class="form-select" required>
                                <option value="" disabled selected>Select...</option>
                                <option value="Retail">Retail</option>
                                <option value="Wholesale">Wholesale</option>
                                <option value="Manufacturer">Manufacturer</option>
                            </select>
                        </div>
                        <div><span style="font-size:0.7rem;color:red" id="businessTypeError"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="mobile" class="form-label">Registered Mobile *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                            <input type="text" class="form-control" id="mobile" name="mobile" onblur="checkPhone()" required>
                        </div>
                        <div><span id="mobileError" style="font-size:0.7rem;color:red"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Registered Email *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" onblur="checkEmail()" required>
                        </div>
                        <div><span id="emailError" style="font-size:0.7rem;color:red"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="address" class="form-label">Address *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>
                        <div><span style="font-size:0.7rem;color:red" id="addressError"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="password" class="form-label">Password *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password" required>
                            <span class="input-group-text">
                                <i class="bi " id="togglePassword" onclick="togglePassword('password', 'togglePassword')">👁</i>
                            </span>
                        </div>
                        <div><span style="font-size:0.7rem;color:red" id="passwordError"></span></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password *</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" oninput="validatePasswords()" required>
                            <span class="input-group-text">
                                <i class="bi " id="toggleConfirmPassword" onclick="togglePassword('confirmPassword', 'toggleConfirmPassword')">👁</i>
                            </span>
                        </div>
                        <div><span id="confirmPasswordError" style="font-size:0.7rem;color:red"></span></div>
                    </div>
                </div>
                <button type="submit" id="submit-btn" class="btn" disabled>Sign Up</button>
                <p class="mt-3">Already have an account? <a href="signin" style="color:#0056b3">Sign In</a></p>
            </form>
        </div>
        <div class="info-section">
                    <img src="img.png" alt="Marg ERP On Cloud">
                    <h3>Secure Access</h3>
                    <p>Log in to Marg Cloud to access all your business data, monitor transactions, expenses, and more from anywhere in the world with complete security and ease of use.</p>
                </div>
    </div>

    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>

    <script>
        // Toggle password visibility
        function togglePassword(id, toggleId) {
            const input = document.getElementById(id);
            const toggleBtn = document.getElementById(toggleId);
            if (input.type === "password") {
                input.type = "text";
                toggleBtn.textContent = "🙈"; // Hide icon
            } else {
                input.type = "password";
                toggleBtn.textContent = "👁️"; // Show icon
            }
        }

        const checkEmail = async () => {
            const email = document.getElementById("email").value;
            const response = await axios("http://localhost:8080/medi_sales/api/checkEmail/"+email);
            const emailError = document.getElementById("emailError");
            if (response.data === "Email Already Exists") {
                emailError.innerHTML = response.data;
            } else {
                emailError.innerHTML = "";
                validateForm();
            }
        };

        const checkPhone = async () => {
            const phone = document.getElementById("mobile").value;
            const response = await axios("http://localhost:8080/medi_sales/api/checkPhone/"+phone);
            const mobileError = document.getElementById("mobileError");
            if (response.data === "PhoneNumber Already Exists") {
                mobileError.textContent = response.data;
            } else {
                mobileError.textContent = "";
                validateForm();
            }
        };

        // Password matching validation
        const validatePasswords = () => {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const confirmPasswordError = document.getElementById("confirmPasswordError");
            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match";
            } else {
                confirmPasswordError.textContent = "";
            }
        };

        // Form validation
        const validateForm = () => {
            const companyName = document.getElementById("companyName").value;
            const contactPerson = document.getElementById("contactPerson").value;
            const businessType = document.getElementById("businessType").value;
            const mobile = document.getElementById("mobile").value;
            const email = document.getElementById("email").value;
            const address = document.getElementById("address").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            let valid = true;

            if (companyName.length < 2 || companyName.length > 25) {
                document.getElementById("companyNameError").textContent = "Company name should be between 2 to 25 characters.";
                valid = false;
            } else {
                document.getElementById("companyNameError").textContent = "";
            }

            if (contactPerson.length < 2 || contactPerson.length > 25) {
                document.getElementById("contactPersonError").textContent = "Contact person should be between 2 to 25 characters.";
                valid = false;
            } else {
                document.getElementById("contactPersonError").textContent = "";
            }

            if (businessType === "") {
                document.getElementById("businessTypeError").textContent = "Business type is required.";
                valid = false;
            } else {
                document.getElementById("businessTypeError").textContent = "";
            }

            const phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(mobile)) {
                document.getElementById("mobileError").textContent = "Please enter a valid 10-digit mobile number.";
                valid = false;
            } else {
                document.getElementById("mobileError").textContent = "";
            }

            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                document.getElementById("emailError").textContent = "Please enter a valid email address.";
                valid = false;
            } else {
                document.getElementById("emailError").textContent = "";
            }

            if (address.length < 3 || address.length > 50) {
                document.getElementById("addressError").textContent = "Address should be between 3 to 50 characters.";
                valid = false;
            } else {
                document.getElementById("addressError").textContent = "";
            }

            if (password.length < 8 || password.length > 20) {
                document.getElementById("passwordError").textContent = "Password should be between 8 to 20 characters.";
                valid = false;
            } else {
                document.getElementById("passwordError").textContent = "";
            }

            if (confirmPassword !== password) {
                document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
                valid = false;
            } else {
                document.getElementById("confirmPasswordError").textContent = "";
            }

            document.getElementById("submit-btn").disabled = !valid;
        };

        document.getElementById("companyName").addEventListener("input", validateForm);
        document.getElementById("contactPerson").addEventListener("input", validateForm);
        document.getElementById("businessType").addEventListener("change", validateForm);
        document.getElementById("mobile").addEventListener("input", checkPhone);
        document.getElementById("email").addEventListener("blur", checkEmail);
        document.getElementById("address").addEventListener("input", validateForm);
        document.getElementById("password").addEventListener("input", validateForm);
        document.getElementById("confirmPassword").addEventListener("input", validateForm);

      window.onload = () => {
          document.getElementById("companyNameError").textContent = "";
          document.getElementById("contactPersonError").textContent = "";
          document.getElementById("businessTypeError").textContent = "";
          document.getElementById("mobileError").textContent = "";
          document.getElementById("emailError").textContent = "";
          document.getElementById("addressError").textContent = "";
          document.getElementById("passwordError").textContent = "";
          document.getElementById("confirmPasswordError").textContent = "";
      }
    </script>
</body>
</html>
