<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - MediSales</title>
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="stylesheet" href="css/auth.css">
        </head>

        <body>

            <div class="auth-card">
                <div class="auth-form">
                    <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 2rem;">
                        <img src="logo.png" alt="Logo" style="height: 32px;">
                        <h2 style="margin: 0;">MediSales</h2>
                    </div>

                    <h2>Welcome Back</h2>
                    <p style="color: #94a3b8; margin-bottom: 2rem;">Please enter your details to sign in.</p>

                    <c:if test="${not empty valid}">
                        <div
                            style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 1rem; border-radius: 0.75rem; margin-bottom: 1.5rem; font-size: 0.875rem;">
                            <i class="fa-solid fa-circle-check"></i> ${valid}
                        </div>
                    </c:if>

                    <c:if test="${not empty notFound}">
                        <div
                            style="background: rgba(239, 68, 68, 0.1); color: #ef4444; padding: 1rem; border-radius: 0.75rem; margin-bottom: 1.5rem; font-size: 0.875rem;">
                            <i class="fa-solid fa-circle-exclamation"></i> ${notFound}
                        </div>
                    </c:if>

                    <form action="login" method="GET">
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" value="${email}" placeholder="name@company.com"
                                required>
                        </div>

                        <div class="form-group">
                            <div
                                style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                <label style="margin-bottom: 0;">Password</label>
                                <a href="forgot-password"
                                    style="font-size: 0.75rem; color: var(--primary); text-decoration: none;">Forgot
                                    password?</a>
                            </div>
                            <div style="position: relative;">
                                <input type="password" id="password" name="password" placeholder="••••••••" required>
                                <i class="fa-regular fa-eye" id="togglePassword"
                                    style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); cursor: pointer; color: #94a3b8;"
                                    onclick="togglePass()"></i>
                            </div>
                        </div>

                        <button type="submit" class="btn-auth">Sign In</button>
                    </form>

                    <div class="auth-links">
                        Don't have an account? <a href="signup.jsp">Create one now</a>
                    </div>
                </div>

                <div class="auth-info">
                    <img src="img.png" alt="Auth Image"
                        style="width: 200px; margin-bottom: 2rem; filter: drop-shadow(0 0 20px rgba(99,102,241,0.3));">
                    <h3>Enterprise Grade Security</h3>
                    <p style="color: #94a3b8; font-size: 0.875rem;">Your business data is encrypted and secure with
                        256-bit SSL protection. Access your dashboard from anywhere, anytime.</p>
                </div>
            </div>

            <script>
                function togglePass() {
                    const passInput = document.getElementById('password');
                    const icon = document.getElementById('togglePassword');
                    if (passInput.type === 'password') {
                        passInput.type = 'text';
                        icon.classList.remove('fa-eye');
                        icon.classList.add('fa-eye-slash');
                    } else {
                        passInput.type = 'password';
                        icon.classList.remove('fa-eye-slash');
                        icon.classList.add('fa-eye');
                    }
                }
            </script>
        </body>

        </html>