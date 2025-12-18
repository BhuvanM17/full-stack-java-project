<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ page isELIgnored="false" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Registration Success - MediSales</title>
                        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                                rel="stylesheet">
                        <link rel="stylesheet"
                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                        <style>
                                :root {
                                        --primary: #6366f1;
                                        --bg-dark: #0f172a;
                                        --card-bg: rgba(30, 41, 59, 0.7);
                                        --border: rgba(255, 255, 255, 0.1);
                                }

                                body {
                                        background-color: var(--bg-dark);
                                        height: 100vh;
                                        display: flex;
                                        align-items: center;
                                        justify-content: center;
                                        margin: 0;
                                        font-family: 'Outfit', sans-serif;
                                        color: white;
                                        background-image: radial-gradient(circle at 50% 50%, rgba(99, 102, 241, 0.1) 0%, transparent 50%);
                                }

                                .success-card {
                                        background: var(--card-bg);
                                        padding: 4rem;
                                        border-radius: 2.5rem;
                                        text-align: center;
                                        border: 1px solid var(--border);
                                        max-width: 500px;
                                        backdrop-filter: blur(10px);
                                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                                }

                                .icon-box {
                                        width: 80px;
                                        height: 80px;
                                        background: rgba(16, 185, 129, 0.1);
                                        color: #10b981;
                                        border-radius: 50%;
                                        display: flex;
                                        align-items: center;
                                        justify-content: center;
                                        font-size: 2.5rem;
                                        margin: 0 auto 2rem;
                                }

                                h2 {
                                        font-size: 2rem;
                                        margin-bottom: 1rem;
                                }

                                p {
                                        color: #94a3b8;
                                        line-height: 1.6;
                                        margin-bottom: 2.5rem;
                                }

                                .btn-primary {
                                        display: inline-block;
                                        background: var(--primary);
                                        color: white;
                                        padding: 1rem 2.5rem;
                                        border-radius: 1rem;
                                        text-decoration: none;
                                        font-weight: 700;
                                        transition: all 0.3s;
                                }

                                .btn-primary:hover {
                                        transform: translateY(-3px);
                                        box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
                                }
                        </style>
                </head>

                <body>
                        <div class="success-card">
                                <div class="icon-box">
                                        <i class="fa-solid fa-circle-check"></i>
                                </div>
                                <h2>Welcome aboard, ${name}!</h2>
                                <p>Your enterprise account has been successfully initialized. You can now access the
                                        full dashboard and start managing your medical sales.</p>
                                <a href="signin" class="btn-primary">Launch Dashboard</a>
                        </div>
                </body>

                </html>