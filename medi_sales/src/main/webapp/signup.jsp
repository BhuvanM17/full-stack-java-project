<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Sign Up - MediSales</title>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="css/auth.css">
                <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
                <style>
                    .auth-card {
                        max-width: 1000px;
                    }

                    .form-grid {
                        display: grid;
                        grid-template-columns: repeat(2, 1fr);
                        gap: 1.5rem;
                    }

                    @media (max-width: 600px) {
                        .form-grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    .error-msg {
                        font-size: 0.75rem;
                        color: #ef4444;
                        margin-top: 0.25rem;
                        display: block;
                        height: 1rem;
                    }
                </style>
            </head>

            <body>

                <div class="auth-card">
                    <div class="auth-form" style="flex: 1.5;">
                        <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 1.5rem;">
                            <img src="logo.png" alt="Logo" style="height: 32px;">
                            <h2 style="margin: 0;">MediSales</h2>
                        </div>

                        <h2 style="font-size: 1.75rem;">Create Enterprise Account</h2>
                        <p style="color: #94a3b8; margin-bottom: 2rem;">Fill in the details below to join our network.
                        </p>

                        <form action="registration" method="POST" id="signUpForm">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label for="companyName">Company Name</label>
                                    <input type="text" id="companyName" name="companyName"
                                        placeholder="e.g. LifeCare Meds" required>
                                    <span id="companyNameError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="contactPerson">Contact Person</label>
                                    <input type="text" id="contactPerson" name="contactPerson" placeholder="John Doe"
                                        required>
                                    <span id="contactPersonError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="businessType">Business Type</label>
                                    <select id="businessType" name="businessType"
                                        style="width: 100%; background: rgba(15, 23, 42, 0.5); border: 1px solid var(--border); border-radius: 0.75rem; padding: 0.75rem 1rem; color: white; outline: none;"
                                        required>
                                        <option value="" disabled selected>Select...</option>
                                        <option value="Retail">Retail</option>
                                        <option value="Wholesale">Wholesale</option>
                                        <option value="Manufacturer">Manufacturer</option>
                                    </select>
                                    <span id="businessTypeError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="mobile">Mobile Number</label>
                                    <input type="tel" id="mobile" name="mobile" placeholder="9876543210" required>
                                    <span id="mobileError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" id="email" name="email" placeholder="john@company.com" required>
                                    <span id="emailError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="address">Full Address</label>
                                    <input type="text" id="address" name="address" placeholder="123 Business Park, City"
                                        required>
                                    <span id="addressError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" placeholder="••••••••"
                                        required>
                                    <span id="passwordError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label for="confirmPassword">Confirm Password</label>
                                    <input type="password" id="confirmPassword" name="confirmPassword"
                                        placeholder="••••••••" required>
                                    <span id="confirmPasswordError" class="error-msg"></span>
                                </div>
                            </div>

                            <button type="submit" id="submit-btn" class="btn-auth" disabled>Initialize
                                Registration</button>
                        </form>

                        <div class="auth-links">
                            Already have an account? <a href="signin.jsp">Sign in here</a>
                        </div>
                    </div>

                    <div class="auth-info">
                        <div
                            style="background: rgba(255,255,255,0.05); padding: 2rem; border-radius: 1.5rem; border: 1px solid var(--border);">
                            <i class="fa-solid fa-rocket"
                                style="font-size: 2.5rem; color: var(--primary); margin-bottom: 1.5rem;"></i>
                            <h3 style="margin-bottom: 1rem;">Join 5,000+ Businesses</h3>
                            <p style="color: #94a3b8; font-size: 0.875rem;">Scale your medical sales with automated
                                invoicing, real-time inventory tracking, and smart analytics.</p>

                            <hr style="border: 0; border-top: 1px solid var(--border); margin: 2rem 0;">

                            <div style="text-align: left; display: flex; flex-direction: column; gap: 1rem;">
                                <div style="display: flex; gap: 1rem; align-items: start;">
                                    <i class="fa-solid fa-check" style="color: #10b981; margin-top: 0.25rem;"></i>
                                    <span style="font-size: 0.8rem;">Inventory Management</span>
                                </div>
                                <div style="display: flex; gap: 1rem; align-items: start;">
                                    <i class="fa-solid fa-check" style="color: #10b981; margin-top: 0.25rem;"></i>
                                    <span style="font-size: 0.8rem;">GST Compliant Billing</span>
                                </div>
                                <div style="display: flex; gap: 1rem; align-items: start;">
                                    <i class="fa-solid fa-check" style="color: #10b981; margin-top: 0.25rem;"></i>
                                    <span style="font-size: 0.8rem;">Real-time Stock Alerts</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    const API_BASE = window.location.origin + '/medi_sales/api';

                    const updateSubmitState = (isValid) => {
                        document.getElementById("submit-btn").disabled = !isValid;
                    };

                    const validateForm = async () => {
                        const formData = {
                            companyName: document.getElementById("companyName").value,
                            contactPerson: document.getElementById("contactPerson").value,
                            businessType: document.getElementById("businessType").value,
                            mobile: document.getElementById("mobile").value,
                            email: document.getElementById("email").value,
                            address: document.getElementById("address").value,
                            password: document.getElementById("password").value,
                            confirmPassword: document.getElementById("confirmPassword").value
                        };

                        let isValid = true;

                        // Valdiate all fields
                        if (formData.companyName.length < 2) {
                            document.getElementById("companyNameError").textContent = "Too short";
                            isValid = false;
                        } else document.getElementById("companyNameError").textContent = "";

                        if (formData.password.length < 8) {
                            document.getElementById("passwordError").textContent = "Min 8 chars";
                            isValid = false;
                        } else document.getElementById("passwordError").textContent = "";

                        if (formData.password !== formData.confirmPassword) {
                            document.getElementById("confirmPasswordError").textContent = "Mismatch";
                            isValid = false;
                        } else document.getElementById("confirmPasswordError").textContent = "";

                        // Check Email Availability
                        if (formData.email.includes('@')) {
                            try {
                                const res = await axios(`${API_BASE}/checkEmail/${formData.email}`);
                                if (res.data === "Email Already Exists") {
                                    document.getElementById("emailError").textContent = "Already registered";
                                    isValid = false;
                                } else document.getElementById("emailError").textContent = "";
                            } catch (e) { }
                        }

                        updateSubmitState(isValid && formData.companyName && formData.email && formData.password);
                    };

                    const inputs = document.querySelectorAll('input, select');
                    inputs.forEach(input => {
                        input.addEventListener('input', validateForm);
                    });
                </script>
            </body>

            </html>