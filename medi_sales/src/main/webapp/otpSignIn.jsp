<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Secure Access - MediSales</title>

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
                    background-image: url('https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=2070&auto=format&fit=crop');
                    background-size: cover;
                    background-position: center;
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0;
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
                    width: 500px;
                    max-width: 95%;
                    padding: 3.5rem;
                    border: 1px solid var(--border);
                    z-index: 2;
                    text-align: center;
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.6);
                }

                .form-group {
                    margin-bottom: 2rem;
                    text-align: left;
                }

                label {
                    display: block;
                    margin-bottom: 0.5rem;
                    color: #94a3b8;
                    font-size: 0.9rem;
                }

                input {
                    width: 100%;
                    background: rgba(15, 23, 42, 0.5);
                    border: 1px solid var(--border);
                    padding: 1rem 1.25rem;
                    border-radius: 0.75rem;
                    color: white;
                    outline: none;
                    font-size: 1.1rem;
                    text-align: center;
                    letter-spacing: 0.1em;
                    transition: all 0.3s;
                }

                input:focus {
                    border-color: var(--primary);
                    background: rgba(15, 23, 42, 0.8);
                }

                input:disabled {
                    opacity: 0.3;
                    cursor: not-allowed;
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
                    margin-top: 1rem;
                    transition: all 0.3s;
                }

                .btn-auth:disabled {
                    background: #334155;
                    cursor: not-allowed;
                }

                .btn-auth:hover:not(:disabled) {
                    transform: translateY(-2px);
                    box-shadow: 0 4px 15px rgba(99, 102, 241, 0.4);
                }

                .alert {
                    padding: 1rem;
                    border-radius: 0.75rem;
                    margin-bottom: 1.5rem;
                    font-size: 0.85rem;
                    display: none;
                }
            </style>
        </head>

        <body>
            <div class="overlay"></div>
            <div class="auth-card">
                <div style="cursor: pointer; margin-bottom: 2.5rem;" onclick="location.href='index'">
                    <i class="fa-solid fa-flask-vial" style="font-size: 2.5rem; color: var(--primary);"></i>
                    <h2 style="margin: 0.5rem 0 0; font-weight: 800;">MediSales</h2>
                </div>

                <h2 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Two-Factor Auth</h2>
                <p style="color: #94a3b8; margin-bottom: 2.5rem;">Safety first. Enter your registered email to receive
                    an OTP.</p>

                <div id="statusAlert" class="alert"></div>

                <form action="sendOtp" method="GET" id="otpSubmitForm">
                    <div class="form-group">
                        <label>Registered Email</label>
                        <input type="email" id="email" name="email" value="${email}" style="text-align: left;"
                            placeholder="admin@medisales.com" required>
                    </div>

                    <div class="form-group" id="otpGroup" style="display: none;">
                        <label>Enter 6-Digit OTP</label>
                        <input type="number" id="otp" name="otp" required maxlength="6" placeholder="••••••">
                    </div>

                    <button type="button" id="sendOtpBtn" class="btn-auth" onclick="sendOtp()">Generate OTP</button>
                    <button type="submit" id="submitOtpBtn" class="btn-auth" style="display: none;">Verify & Log
                        In</button>
                </form>

                <div style="margin-top: 2rem; color: #94a3b8; font-size: 0.85rem;">
                    Security check failed? <a href="signin"
                        style="color: var(--primary); text-decoration: none; font-weight: 600;">Return to Login</a>
                </div>
            </div>

            <script>
                const API_BASE = window.location.origin + '/medi_sales/api';

                const showAlert = (msg, type) => {
                    const alert = document.getElementById("statusAlert");
                    alert.textContent = msg;
                    alert.style.display = "block";
                    alert.style.background = type === 'success' ? 'rgba(16, 185, 129, 0.1)' : 'rgba(239, 68, 68, 0.1)';
                    alert.style.color = type === 'success' ? '#10b981' : '#ef4444';
                };

                const sendOtp = async () => {
                    const email = document.getElementById("email").value;
                    const btn = document.getElementById("sendOtpBtn");

                    if (!email) { showAlert("Please enter email first", "error"); return; }

                    btn.disabled = true;
                    btn.textContent = "Processing...";

                    try {
                        const res = await axios.get(`${API_BASE}/sendOtp/${email}`);
                        if (res.data === "OTP Sent Successfully") {
                            showAlert("OTP sent successfully to your email!", "success");
                            document.getElementById("otpGroup").style.display = "block";
                            document.getElementById("submitOtpBtn").style.display = "block";
                            btn.style.display = "none";
                        } else {
                            showAlert("Failed to send OTP. Account might not exist.", "error");
                            btn.disabled = false;
                            btn.textContent = "Generate OTP";
                        }
                    } catch (e) {
                        showAlert("System error. Please try again later.", "error");
                        btn.disabled = false;
                        btn.textContent = "Generate OTP";
                    }
                };
            </script>
        </body>

        </html>