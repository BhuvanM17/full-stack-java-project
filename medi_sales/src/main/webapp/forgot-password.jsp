<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Reset Password - MediSales</title>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <style>
                    :root {
                        --primary: #6366f1;
                        --bg-dark: #0f172a;
                        --card-bg: rgba(30, 41, 59, 0.7);
                        --border: rgba(255, 255, 255, 0.1);
                    }

                    body {
                        background-color: var(--bg-dark);
                        background-image: url('https://images.unsplash.com/photo-1579444230661-ca316dd25d2c?q=80&w=2070&auto=format&fit=crop');
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
                        background: rgba(15, 23, 42, 0.85);
                        backdrop-filter: blur(8px);
                        z-index: 1;
                    }

                    .auth-card {
                        background: var(--card-bg);
                        border-radius: 2rem;
                        width: 500px;
                        max-width: 95%;
                        padding: 3rem;
                        border: 1px solid var(--border);
                        z-index: 2;
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                    }

                    .form-group {
                        margin-bottom: 1.5rem;
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
                        padding: 0.85rem 1.25rem;
                        border-radius: 0.75rem;
                        color: white;
                        outline: none;
                        transition: border-color 0.3s;
                    }

                    input:focus {
                        border-color: var(--primary);
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

                    .btn-auth:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
                    }

                    .alert-error {
                        background: rgba(239, 68, 68, 0.1);
                        color: #ef4444;
                        padding: 1rem;
                        border-radius: 0.75rem;
                        margin-bottom: 1.5rem;
                        font-size: 0.85rem;
                    }
                </style>
            </head>

            <body>
                <div class="overlay"></div>
                <div class="auth-card">
                    <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 2rem; cursor: pointer;"
                        onclick="location.href='index'">
                        <i class="fa-solid fa-flask-vial" style="font-size: 2rem; color: var(--primary);"></i>
                        <h2 style="margin: 0; font-weight: 800;">MediSales</h2>
                    </div>

                    <h2 style="font-size: 1.5rem; margin-bottom: 1.5rem;">Reset Password</h2>

                    <c:if test="${not empty Invalid}">
                        <div class="alert-error"><i class="fa-solid fa-triangle-exclamation"></i> ${Invalid}</div>
                    </c:if>

                    <form action="forget">
                        <div class="form-group">
                            <label>Registered Email</label>
                            <input type="email" name="email" value="${email}" placeholder="john@company.com" required>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="password" name="newPassword" placeholder="••••••••" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" name="confirmPassword" placeholder="••••••••" required>
                        </div>
                        <button type="submit" class="btn-auth">Update Password</button>
                    </form>

                    <div style="margin-top: 2rem; text-align: center; color: #94a3b8; font-size: 0.9rem;">
                        Remember your credentials? <a href="signin"
                            style="color: var(--primary); text-decoration: none; font-weight: 600;">Back to Sign In</a>
                    </div>
                </div>
            </body>

            </html>