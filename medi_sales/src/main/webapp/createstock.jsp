<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create Stock - MediSales</title>

            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <style>
                :root {
                    --primary: #6366f1;
                    --bg-dark: #0f172a;
                    --card-glass: rgba(30, 41, 59, 0.7);
                    --border: rgba(255, 255, 255, 0.1);
                    color-scheme: dark;
                }

                body {
                    background-color: var(--bg-dark);
                    background-image: url('https://images.unsplash.com/photo-1587854692152-cbe660dbbb88?q=80&w=2069&auto=format&fit=crop');
                    background-size: cover;
                    background-position: center;
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
                    backdrop-filter: blur(10px);
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
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                    font-size: 1.5rem;
                    font-weight: 800;
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

                .stock-card {
                    background: var(--card-glass);
                    border: 1px solid var(--border);
                    border-radius: 2rem;
                    width: 1000px;
                    max-width: 100%;
                    display: flex;
                    overflow: hidden;
                    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                }

                .form-area {
                    flex: 1.5;
                    padding: 3rem;
                }

                .info-area {
                    flex: 1;
                    background: rgba(15, 23, 42, 0.4);
                    padding: 3rem;
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

                .form-group label {
                    display: block;
                    margin-bottom: 0.5rem;
                    color: #94a3b8;
                    font-size: 0.85rem;
                }

                .input-wrapper {
                    position: relative;
                }

                .input-wrapper i {
                    position: absolute;
                    left: 1rem;
                    top: 50%;
                    transform: translateY(-50%);
                    color: var(--primary);
                    pointer-events: none;
                }

                input {
                    width: 100%;
                    background: rgba(15, 23, 42, 0.6);
                    border: 1px solid var(--border);
                    padding: 0.75rem 1rem 0.75rem 2.8rem;
                    border-radius: 0.8rem;
                    color: white;
                    outline: none;
                    transition: all 0.3s;
                }

                input:focus {
                    border-color: var(--primary);
                    box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
                }

                input[type="date"]::-webkit-calendar-picker-indicator {
                    filter: invert(1);
                    cursor: pointer;
                    opacity: 0.6;
                    transition: opacity 0.3s;
                }

                input[type="date"]::-webkit-calendar-picker-indicator:hover {
                    opacity: 1;
                }

                input[type="date"]::-webkit-datetime-edit-text,
                input[type="date"]::-webkit-datetime-edit-month-field,
                input[type="date"]::-webkit-datetime-edit-day-field,
                input[type="date"]::-webkit-datetime-edit-year-field {
                    color: white;
                }

                input[type="date"]::-webkit-datetime-edit-text {
                    opacity: 0.5;
                }

                .btn-submit {
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

                .btn-submit:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px -5px rgba(99, 102, 241, 0.4);
                }

                .btn-back {
                    color: white;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                    font-weight: 500;
                    transition: opacity 0.3s;
                }

                .btn-back:hover {
                    opacity: 0.8;
                }

                @media (max-width: 900px) {
                    .info-area {
                        display: none;
                    }

                    .form-grid {
                        grid-template-columns: 1fr;
                    }

                    .btn-submit {
                        grid-column: auto;
                    }

                    .main-container {
                        padding: 1.5rem;
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
                    <i class="fa-solid fa-arrow-left"></i> Back to Fleet
                </a>
            </header>

            <main class="main-container">
                <div class="stock-card">
                    <div class="form-area">
                        <h2 style="font-size: 2rem; margin-bottom: 0.5rem;">Create Stock</h2>
                        <p style="color: #94a3b8; margin-bottom: 2.5rem;">Register new products to your cloud inventory.
                        </p>

                        <c:if test="${not empty success}">
                            <div
                                style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 1rem; border-radius: 0.8rem; margin-bottom: 2rem; display: flex; align-items: center; gap: 0.75rem;">
                                <i class="fa-solid fa-circle-check"></i> ${success}
                            </div>
                        </c:if>

                        <form action="stock" method="post" class="form-grid">
                            <div class="form-group">
                                <label for="productCompany">Product Company</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-building"></i>
                                    <input type="text" id="productCompany" name="productCompany"
                                        placeholder="e.g. Pfizer" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productName">Product Name</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-box"></i>
                                    <input type="text" id="productName" name="productName"
                                        placeholder="e.g. Paracetamol" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mrp">MRP (₹)</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-indian-rupee-sign"></i>
                                    <input type="text" id="mrp" name="mrp" placeholder="0.00" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pack">Pack Type</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-boxes-stacked"></i>
                                    <input type="text" id="pack" name="pack" placeholder="e.g. 10x10 Strips" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mfgDate">MFG Date</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-calendar-day"></i>
                                    <input type="date" id="mfgDate" name="mfgDate" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="expDate">EXP Date</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-calendar-xmark"></i>
                                    <input type="date" id="expDate" name="expDate" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Initial Quantity</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-calculator"></i>
                                    <input type="number" id="quantity" name="quantity" placeholder="0" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rate">Purchase Rate (₹)</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-tag"></i>
                                    <input type="text" id="rate" name="rate" placeholder="0.00" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="gst">GST (%)</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-percent"></i>
                                    <input type="text" id="gst" name="gst" placeholder="18" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="discount">Discount (%)</label>
                                <div class="input-wrapper">
                                    <i class="fa-solid fa-hand-holding-dollar"></i>
                                    <input type="text" id="discount" name="discount" placeholder="0" required>
                                </div>
                            </div>

                            <button type="submit" class="btn-submit">Initialize Product Entry</button>
                        </form>
                    </div>
                    <div class="info-area">
                        <i class="fa-solid fa-shield-virus"
                            style="font-size: 3rem; color: var(--primary); margin-bottom: 2rem;"></i>
                        <h3 style="font-size: 1.5rem; margin-bottom: 1rem;">Inventory Safety</h3>
                        <p style="color: #94a3b8; line-height: 1.6; font-size: 0.9rem;">Adding items to the registry
                            enables real-time tracking, automatic expiry alerts, and smart reordering predictions.</p>

                        <div style="margin-top: 2rem; display: flex; flex-direction: column; gap: 1rem;">
                            <div style="display: flex; gap: 0.75rem; align-items: center; font-size: 0.85rem;">
                                <i class="fa-solid fa-check" style="color: #10b981;"></i> Cloud Sync Enabled
                            </div>
                            <div style="display: flex; gap: 0.75rem; align-items: center; font-size: 0.85rem;">
                                <i class="fa-solid fa-check" style="color: #10b981;"></i> HSN Integration
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <script>
                document.querySelectorAll('.input-wrapper').forEach(wrapper => {
                    wrapper.addEventListener('click', () => {
                        const input = wrapper.querySelector('input[type="date"]');
                        if (input && input.showPicker) {
                            input.showPicker();
                        } else if (input) {
                            input.focus();
                        }
                    });
                });
            </script>
        </body>

        </html>