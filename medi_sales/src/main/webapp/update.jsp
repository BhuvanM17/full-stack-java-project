<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Enterprise Settings - MediSales</title>

            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <style>
                :root {
                    --primary: #6366f1;
                    --bg-dark: #0f172a;
                    --card-glass: rgba(30, 41, 59, 0.7);
                    --border: rgba(255, 255, 255, 0.1);
                }

                body {
                    background-color: var(--bg-dark);
                    background-image: radial-gradient(circle at 100% 100%, rgba(99, 102, 241, 0.1) 0%, transparent 50%);
                    min-height: 100vh;
                    margin: 0;
                    font-family: 'Outfit', sans-serif;
                    color: white;
                    display: flex;
                    flex-direction: column;
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

                header {
                    position: relative;
                    z-index: 2;
                    padding: 1.5rem 3rem;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    border-bottom: 1px solid var(--border);
                }

                .logo {
                    font-size: 1.5rem;
                    font-weight: 800;
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                    cursor: pointer;
                }

                .main-container {
                    position: relative;
                    z-index: 2;
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 3rem;
                }

                .settings-card {
                    background: var(--card-glass);
                    border: 1px solid var(--border);
                    border-radius: 2rem;
                    width: 900px;
                    max-width: 100%;
                    display: flex;
                    overflow: hidden;
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                }

                .form-area {
                    flex: 1.5;
                    padding: 3.5rem;
                }

                .info-area {
                    flex: 1;
                    background: rgba(15, 23, 42, 0.3);
                    padding: 3.5rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    border-left: 1px solid var(--border);
                }

                .settings-grid {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 1.5rem;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 0.5rem;
                    color: #94a3b8;
                    font-size: 0.85rem;
                }

                input,
                select {
                    width: 100%;
                    background: rgba(15, 23, 42, 0.5);
                    border: 1px solid var(--border);
                    padding: 0.85rem 1.25rem;
                    border-radius: 0.8rem;
                    color: white;
                    outline: none;
                    transition: all 0.3s;
                }

                input:focus,
                select:focus {
                    border-color: var(--primary);
                }

                input[readOnly] {
                    background: rgba(15, 23, 42, 0.2);
                    color: #64748b;
                    border-style: dashed;
                }

                .btn-save {
                    grid-column: span 2;
                    background: var(--primary);
                    color: white;
                    border: none;
                    padding: 1rem;
                    border-radius: 0.8rem;
                    font-weight: 700;
                    cursor: pointer;
                    margin-top: 1rem;
                    transition: all 0.3s;
                }

                .btn-save:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
                }

                .btn-back {
                    color: white;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                    font-size: 0.9rem;
                }

                @media (max-width: 900px) {
                    .info-area {
                        display: none;
                    }

                    .settings-grid {
                        grid-template-columns: 1fr;
                    }

                    .btn-save {
                        grid-column: auto;
                    }
                }
            </style>
        </head>

        <body>
            <div class="overlay"></div>

            <header>
                <div class="logo" onclick="location.href='index'">
                    <i class="fa-solid fa-flask-vial" style="color: var(--primary);"></i>
                    MediSales
                </div>
                <a href="javascript:history.back()" class="btn-back">
                    <i class="fa-solid fa-arrow-left"></i> Discard & Return
                </a>
            </header>

            <main class="main-container">
                <div class="settings-card">
                    <div class="form-area">
                        <h2 style="font-size: 1.75rem; margin-bottom: 0.5rem;">Enterprise Identity</h2>
                        <p style="color: #94a3b8; margin-bottom: 2.5rem;">Update your business profile and contact
                            information.</p>

                        <c:if test="${not empty Successful}">
                            <div
                                style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 1rem; border-radius: 0.8rem; margin-bottom: 2rem; display: flex; align-items: center; gap: 0.75rem;">
                                <i class="fa-solid fa-circle-check"></i> ${Successful}
                            </div>
                        </c:if>

                        <form action="updateProfile" method="POST" class="settings-grid">
                            <input type="hidden" name="id" value="${dto.id}">

                            <div class="form-group">
                                <label>Company Name</label>
                                <input type="text" name="companyName" value="${dto.companyName}" required>
                            </div>

                            <div class="form-group">
                                <label>Business Category</label>
                                <select name="businessType" required>
                                    <option value="${dto.businessType}">${dto.businessType}</option>
                                    <option value="Retail">Retail</option>
                                    <option value="Wholesale">Wholesale</option>
                                    <option value="Manufacturer">Manufacturer</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Lead Contact</label>
                                <input type="text" name="contactPerson" value="${dto.contactPerson}" required>
                            </div>

                            <div class="form-group">
                                <label>Mobile Number</label>
                                <input type="text" name="mobile" value="${dto.mobile}" required>
                            </div>

                            <div class="form-group" style="grid-column: span 2;">
                                <label>Registered Email (Identity)</label>
                                <input type="email" name="email" value="${dto.email}" readOnly>
                            </div>

                            <div class="form-group" style="grid-column: span 2;">
                                <label>HQ Address</label>
                                <input type="text" name="address" value="${dto.address}" required>
                            </div>

                            <button type="submit" class="btn-save">Synchronize Profile</button>
                        </form>
                    </div>

                    <div class="info-area">
                        <div
                            style="background: rgba(255,255,255,0.03); padding: 2rem; border-radius: 1.5rem; border: 1px solid var(--border);">
                            <i class="fa-solid fa-fingerprint"
                                style="font-size: 2.5rem; color: var(--primary); margin-bottom: 1.5rem;"></i>
                            <h3 style="margin-bottom: 1rem;">Profile Identity</h3>
                            <p style="color: #94a3b8; font-size: 0.85rem; line-height: 1.6;">Your company profile is
                                used for all auto-generated invoices and compliance reports. Keep it up to date for
                                professional communication.</p>
                        </div>
                    </div>
                </div>
            </main>

            <footer
                style="position: relative; z-index: 2; padding: 2rem; text-align: center; color: #64748b; font-size: 0.85rem; border-top: 1px solid var(--border);">
                Connected via Secure MediSales Tunnel 2.0
            </footer>
        </body>

        </html>