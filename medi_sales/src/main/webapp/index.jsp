<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>MediSales - Premium Pharma ERP</title>

            <!-- Fonts & Icons -->
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <style>
                :root {
                    --primary: #6366f1;
                    --primary-dark: #4f46e5;
                    --secondary: #ec4899;
                    --bg-dark: #0f172a;
                    --card-glass: rgba(30, 41, 59, 0.7);
                    --border: rgba(255, 255, 255, 0.1);
                }

                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Outfit', sans-serif;
                }

                body {
                    background-color: var(--bg-dark);
                    color: #f8fafc;
                    overflow-x: hidden;
                    background-image:
                        radial-gradient(at 0% 0%, rgba(99, 102, 241, 0.15) 0px, transparent 50%),
                        radial-gradient(at 100% 100%, rgba(236, 72, 153, 0.1) 0px, transparent 50%);
                    min-height: 100vh;
                }

                /* Navbar */
                nav {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 1.5rem 5%;
                    backdrop-filter: blur(10px);
                    position: fixed;
                    width: 100%;
                    top: 0;
                    z-index: 1000;
                    border-bottom: 1px solid var(--border);
                }

                .logo {
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                    font-size: 1.5rem;
                    font-weight: 700;
                    background: linear-gradient(to right, #818cf8, #f472b6);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                }

                .nav-btns {
                    display: flex;
                    gap: 1.5rem;
                }

                .btn {
                    padding: 0.75rem 1.5rem;
                    border-radius: 0.75rem;
                    font-weight: 600;
                    text-decoration: none;
                    transition: all 0.3s ease;
                    font-size: 0.9rem;
                }

                .btn-outline {
                    border: 1px solid var(--border);
                    color: white;
                }

                .btn-outline:hover {
                    background: rgba(255, 255, 255, 0.05);
                    border-color: var(--primary);
                }

                .btn-primary {
                    background: var(--primary);
                    color: white;
                    box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
                }

                .btn-primary:hover {
                    background: var(--primary-dark);
                    transform: translateY(-2px);
                }

                /* Hero Section */
                .hero {
                    padding: 10rem 5% 5rem;
                    display: grid;
                    grid-template-columns: 1.2fr 1fr;
                    align-items: center;
                    gap: 4rem;
                    max-width: 1400px;
                    margin: 0 auto;
                }

                .hero-content h1 {
                    font-size: 4rem;
                    line-height: 1.1;
                    margin-bottom: 1.5rem;
                    font-weight: 800;
                }

                .gradient-text {
                    background: linear-gradient(to right, #818cf8, #f472b6);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                }

                .hero-content p {
                    font-size: 1.25rem;
                    color: #94a3b8;
                    margin-bottom: 2.5rem;
                    line-height: 1.6;
                }

                .hero-image {
                    position: relative;
                }

                .image-card {
                    width: 100%;
                    height: 500px;
                    background: url('https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop') center/cover;
                    border-radius: 2rem;
                    border: 1px solid var(--border);
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                }

                .floating-stats {
                    position: absolute;
                    background: var(--card-glass);
                    backdrop-filter: blur(12px);
                    padding: 1.5rem;
                    border-radius: 1.25rem;
                    border: 1px solid var(--border);
                    bottom: -2rem;
                    left: -2rem;
                    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                }

                /* Features Section */
                .features {
                    padding: 5rem 5%;
                    max-width: 1400px;
                    margin: 0 auto;
                }

                .feature-grid {
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);
                    gap: 2rem;
                }

                .feature-box {
                    background: var(--card-glass);
                    padding: 2.5rem;
                    border-radius: 1.5rem;
                    border: 1px solid var(--border);
                    transition: all 0.3s ease;
                }

                .feature-box:hover {
                    border-color: var(--primary);
                    transform: translateY(-5px);
                }

                .feature-box i {
                    font-size: 2rem;
                    color: var(--primary);
                    margin-bottom: 1.5rem;
                }

                footer {
                    padding: 4rem 5%;
                    text-align: center;
                    border-top: 1px solid var(--border);
                    color: #64748b;
                    font-size: 0.9rem;
                }

                @media (max-width: 968px) {
                    .hero {
                        grid-template-columns: 1fr;
                        text-align: center;
                    }

                    .hero-content h1 {
                        font-size: 3rem;
                    }

                    .feature-grid {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>

            <nav>
                <div class="logo">
                    <i class="fa-solid fa-flask-vial"></i>
                    MediSales
                </div>
                <div class="nav-btns">
                    <a href="signin" class="btn btn-outline">Sign In</a>
                    <a href="signup" class="btn btn-primary">Get Started</a>
                </div>
            </nav>

            <main>
                <section class="hero">
                    <div class="hero-content">
                        <h1>Next-Gen <span class="gradient-text">Pharma ERP</span> for Modern Business</h1>
                        <p>Streamline your medical sales, inventory, and billing with our enterprise-grade cloud
                            platform. Built for global pharmaceutical standards.</p>
                        <div style="display: flex; gap: 1rem;">
                            <a href="signup" class="btn btn-primary" style="padding: 1rem 2rem; font-size: 1rem;">Launch
                                Console</a>
                            <a href="#" class="btn btn-outline" style="padding: 1rem 2rem; font-size: 1rem;">Watch
                                Demo</a>
                        </div>
                    </div>
                    <div class="hero-image">
                        <div class="image-card"></div>
                        <div class="floating-stats">
                            <div style="display: flex; gap: 1rem; align-items: center;">
                                <i class="fa-solid fa-chart-line" style="color: #10b981; font-size: 1.5rem;"></i>
                                <div>
                                    <div style="font-weight: 700; font-size: 1.25rem;">+124%</div>
                                    <div style="font-size: 0.75rem; color: #94a3b8;">Sales Growth</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="features">
                    <div class="feature-grid">
                        <div class="feature-box">
                            <i class="fa-solid fa-boxes-stacked"></i>
                            <h3>Smart Inventory</h3>
                            <p style="color: #94a3b8; margin-top: 1rem;">Real-time stock tracking with automated
                                low-stock alerts and expiration monitoring.</p>
                        </div>
                        <div class="feature-box">
                            <i class="fa-solid fa-file-invoice-dollar"></i>
                            <h3>Compliance Billing</h3>
                            <p style="color: #94a3b8; margin-top: 1rem;">Generate GST-ready invoices with one click.
                                Digital signatures and secure PDF exports.</p>
                        </div>
                        <div class="feature-box">
                            <i class="fa-solid fa-shield-halved"></i>
                            <h3>Bank-Level Security</h3>
                            <p style="color: #94a3b8; margin-top: 1rem;">End-to-end encryption for your sensitive
                                business data. Secure access anywhere in the world.</p>
                        </div>
                    </div>
                </section>
            </main>

            <footer>
                <p>&copy; 2025 MediSales ERP. Modern Cloud Solutions for Pharma Professionals.</p>
            </footer>

        </body>

        </html>