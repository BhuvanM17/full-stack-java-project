<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Enterprise Registration - MediSales</title>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

                <style>
                    :root {
                        --primary: #6366f1;
                        --bg-dark: #0f172a;
                        --card-bg: rgba(30, 41, 59, 0.7);
                        --border: rgba(255, 255, 255, 0.1);
                    }

                    body {
                        background-color: var(--bg-dark);
                        background-image: url('https://images.unsplash.com/photo-1579389083046-e3df9c2b3325?q=80&w=2070&auto=format&fit=crop');
                        background-size: cover;
                        background-position: center;
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0;
                        padding: 2rem;
                        font-family: 'Outfit', sans-serif;
                        color: white;
                    }

                    .overlay {
                        position: fixed;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background: rgba(15, 23, 42, 0.9);
                        backdrop-filter: blur(10px);
                        z-index: 1;
                    }

                    .auth-card {
                        background: var(--card-bg);
                        border-radius: 2rem;
                        width: 1100px;
                        max-width: 100%;
                        display: flex;
                        overflow: hidden;
                        border: 1px solid var(--border);
                        z-index: 2;
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.6);
                    }

                    .auth-form {
                        flex: 1.5;
                        padding: 3.5rem;
                    }

                    .auth-info {
                        flex: 1;
                        background: rgba(15, 23, 42, 0.3);
                        padding: 3.5rem;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        border-left: 1px solid var(--border);
                    }

                    .form-grid {
                        display: grid;
                        grid-template-columns: repeat(2, 1fr);
                        gap: 1.5rem;
                    }

                    .form-group {
                        margin-bottom: 1.25rem;
                    }

                    label {
                        display: block;
                        margin-bottom: 0.5rem;
                        color: #94a3b8;
                        font-size: 0.85rem;
                        font-weight: 500;
                    }

                    input,
                    select {
                        width: 100%;
                        background: rgba(15, 23, 42, 0.5);
                        border: 1px solid var(--border);
                        padding: 0.75rem 1rem;
                        border-radius: 0.75rem;
                        color: white;
                        outline: none;
                        font-size: 0.9rem;
                        transition: all 0.3s;
                    }

                    input:focus,
                    select:focus {
                        border-color: var(--primary);
                        background: rgba(15, 23, 42, 0.8);
                    }

                    .btn-auth {
                        width: 100%;
                        background: var(--primary);
                        color: white;
                        border: none;
                        padding: 1rem;
                        border-radius: 0.75rem;
                        font-weight: 700;
                        cursor: pointer;
                        margin-top: 1.5rem;
                        transition: all 0.3s;
                    }

                    .btn-auth:disabled {
                        background: #334155;
                        cursor: not-allowed;
                        opacity: 0.7;
                    }

                    .btn-auth:not(:disabled):hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 15px rgba(99, 102, 241, 0.4);
                    }

                    .error-msg {
                        font-size: 0.7rem;
                        color: #ef4444;
                        margin-top: 0.25rem;
                        display: block;
                        height: 1rem;
                    }

                    @media (max-width: 900px) {
                        .auth-info {
                            display: none;
                        }

                        .form-grid {
                            grid-template-columns: 1fr;
                        }

                        .auth-form {
                            padding: 2rem;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="overlay"></div>
                <div class="auth-card">
                    <div class="auth-form">
                        <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 2rem; cursor: pointer;"
                            onclick="location.href='index'">
                            <i class="fa-solid fa-flask-vial" style="font-size: 1.75rem; color: var(--primary);"></i>
                            <h2 style="margin: 0; font-weight: 800; font-size: 1.5rem;">MediSales</h2>
                        </div>

                        <h2 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Create Account</h2>
                        <p style="color: #94a3b8; margin-bottom: 2rem; font-size: 0.9rem;">Join 5,000+ businesses
                            managing pharma with ease.</p>

                        <form action="registration" method="POST" id="signUpForm">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Company Name</label>
                                    <input type="text" id="companyName" name="companyName"
                                        placeholder="LifeCare Medicals" required>
                                    <span id="companyNameError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label>Contact Person</label>
                                    <input type="text" id="contactPerson" name="contactPerson" placeholder="John Doe"
                                        required>
                                </div>

                                <div class="form-group">
                                    <label>Business Type</label>
                                    <select id="businessType" name="businessType" required>
                                        <option value="" disabled selected>Select type...</option>
                                        <option value="Retail">Retail</option>
                                        <option value="Wholesale">Wholesale</option>
                                        <option value="Manufacturer">Manufacturer</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <input type="tel" id="mobile" name="mobile" placeholder="9876543210" required>
                                </div>

                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input type="email" id="email" name="email" placeholder="john@company.com" required>
                                    <span id="emailError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label>Full Address</label>
                                    <input type="text" id="address" name="address"
                                        placeholder="123 Business Park, Bangalore" required>
                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" id="password" name="password" placeholder="••••••••"
                                        required>
                                    <span id="passwordError" class="error-msg"></span>
                                </div>

                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input type="password" id="confirmPassword" name="confirmPassword"
                                        placeholder="••••••••" required>
                                    <span id="confirmPasswordError" class="error-msg"></span>
                                </div>
                            </div>

                            <button type="submit" id="submit-btn" class="btn-auth" disabled>Initialize
                                Registration</button>
                        </form>

                        <div style="margin-top: 1.5rem; text-align: center; color: #94a3b8; font-size: 0.85rem;">
                            Already registered? <a href="signin"
                                style="color: var(--primary); text-decoration: none; font-weight: 600;">Sign in here</a>
                        </div>
                    </div>
                    <div class="auth-info">
                        <div
                            style="background: rgba(255,255,255,0.03); padding: 2rem; border-radius: 1.5rem; border: 1px solid var(--border);">
                            <i class="fa-solid fa-rocket"
                                style="font-size: 2.5rem; color: var(--primary); margin-bottom: 1.5rem;"></i>
                            <h3 style="margin-bottom: 1rem;">Scale Faster</h3>
                            <p style="color: #94a3b8; font-size: 0.85rem; line-height: 1.6;">Access advanced inventory
                                tracking, GST billing, and real-time business analytics from one dashboard.</p>

                            <div style="margin-top: 2rem; display: flex; flex-direction: column; gap: 0.75rem;">
                                <div style="display: flex; gap: 0.75rem; align-items: center; font-size: 0.8rem;">
                                    <i class="fa-solid fa-check" style="color: #10b981;"></i> Cloud-based Inventory
                                </div>
                                <div style="display: flex; gap: 0.75rem; align-items: center; font-size: 0.8rem;">
                                    <i class="fa-solid fa-check" style="color: #10b981;"></i> Automatic Invoicing
                                </div>
                                <div style="display: flex; gap: 0.75rem; align-items: center; font-size: 0.8rem;">
                                    <i class="fa-solid fa-check" style="color: #10b981;"></i> Multi-user Access
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    const API_BASE = window.location.origin + '/api';

                    const updateSubmitState = (isValid) => {
                        document.getElementById("submit-btn").disabled = !isValid;
                    };

                    const validateForm = async () => {
                        const formData = {
                            companyName: document.getElementById("companyName").value,
                            email: document.getElementById("email").value,
                            password: document.getElementById("password").value,
                            confirmPassword: document.getElementById("confirmPassword").value
                        };

                        let isValid = true;

                        if (formData.companyName && formData.companyName.length < 2) {
                            document.getElementById("companyNameError").textContent = "Too short";
                            isValid = false;
                        } else document.getElementById("companyNameError").textContent = "";

                        if (formData.password && formData.password.length < 8) {
                            document.getElementById("passwordError").textContent = "Min 8 chars";
                            isValid = false;
                        } else document.getElementById("passwordError").textContent = "";

                        if (formData.password !== formData.confirmPassword) {
                            document.getElementById("confirmPasswordError").textContent = "Mismatch";
                            isValid = false;
                        } else document.getElementById("confirmPasswordError").textContent = "";

                        if (formData.email && formData.email.includes('@')) {
                            try {
                                const res = await axios(`${API_BASE}/checkEmail/${formData.email}`);
                                if (res.data === "Email Already Exists") {
                                    document.getElementById("emailError").textContent = "Already exists";
                                    isValid = false;
                                } else document.getElementById("emailError").textContent = "";
                            } catch (e) { }
                        }

                        updateSubmitState(isValid && formData.companyName && formData.email && formData.password);
                    };

                    document.querySelectorAll('input, select').forEach(el => el.addEventListener('input', validateForm));
                </script>
            </body>

            </html>