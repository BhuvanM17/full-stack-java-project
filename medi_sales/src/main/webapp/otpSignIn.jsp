<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Sign In - Marg ERP Cloud</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
              /* General Styling */
              body {
                  font-family: 'Segoe UI Emoji', Arial, sans-serif;
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
              .form-section {
                  flex: 2;
                  padding: 40px 30px;
              }
              .form-section h2 {
                  font-size: 26px;
                  color: #0056b3;
                  margin-bottom: 20px;
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
              }
              .logo-container {
                          box-shadow:  0 8px 15px rgba(256, 308, 261, 5.6);
                       }
          </style>
    <script>
        let otpSentTime = null;

        const otpSent = async () => {
            const email = document.getElementById("email").value;
            const response = await axios.get("http://localhost:8080/medi_sales/api/sendOtp/" + email);

            if (response.data==="OTP Sent Successfully") {
                document.getElementById("message").innerHTML = "OTP sent successfully! Please check your email.";
                document.getElementById("otp").disabled = false;
                document.getElementById("submitOtpBtn").style.display = "block";
                otpSentTime = new Date();

                document.getElementById("sendOtpBtn").disabled = true;
                setTimeout(() => {
                    document.getElementById("sendOtpBtn").disabled = false;
                }, 60000);
            } else {
                document.getElementById("message").innerHTML = "Failed to send OTP. Please try again.";
            }
        };
    </script>
</head>
<body>
    <div class="header">
        <div>
            <img src="logo.png" alt="Medi-Sales Logo" style="height: 40px;">
        </div>
        <div>
            <a href="index" class="home-btn">Home</a>
        </div>
    </div>
    <div class="container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>OTP Sign In</h2>
            <p style="color:green">${valid}</p>
            <h3 style="color:red">${notFound}</h3>
            <h3 style="color:red">${msg}</h3>
            <p>Access Your Account on Marg ERP Cloud</p>

            <form action="sendOtp" method="get" id="otpForm">
                <div class="form-group">
                    <label for="email">Registered Email *</label>
                    <input type="email" id="email" name="email" value="${email}"  required>
                </div>
                <span class="text-center" id="message" style="color:green"></span>

                <div class="form-group">
                    <label for="otp">Enter OTP:</label>
                    <input type="number" id="otp" name="otp" disabled required>
                </div>
                <button type="submit" id="submitOtpBtn" class="btn" style="display:none;">Submit OTP</button>
            </form>

            <button id="sendOtpBtn" class="btn btn-primary btn-block" onclick="otpSent()">Send OTP</button>

        </div>

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
