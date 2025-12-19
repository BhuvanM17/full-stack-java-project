<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Enterprise Billing - MediSales</title>

                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <style>
                    :root {
                        --primary: #6366f1;
                        --bg-dark: #0f172a;
                        --card-glass: rgba(30, 41, 59, 0.7);
                        --border: rgba(255, 255, 255, 0.1);
                        --text-muted: #94a3b8;
                    }

                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        background-color: var(--bg-dark);
                        background-image: radial-gradient(circle at 0% 0%, rgba(99, 102, 241, 0.1) 0%, transparent 50%);
                        min-height: 100vh;
                        font-family: 'Outfit', sans-serif;
                        color: white;
                        padding: 2rem;
                    }

                    .container {
                        max-width: 1200px;
                        margin: 0 auto;
                    }

                    header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 3rem;
                    }

                    .logo {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        font-size: 1.5rem;
                        font-weight: 800;
                    }

                    .billing-grid {
                        display: grid;
                        grid-template-columns: 1fr 2fr;
                        gap: 2rem;
                    }

                    .panel {
                        background: var(--card-glass);
                        border: 1px solid var(--border);
                        border-radius: 1.5rem;
                        padding: 2rem;
                        backdrop-filter: blur(15px);
                    }

                    h2 {
                        font-size: 1.5rem;
                        margin-bottom: 1.5rem;
                    }

                    .form-group {
                        margin-bottom: 1.25rem;
                    }

                    label {
                        display: block;
                        margin-bottom: 0.5rem;
                        font-size: 0.85rem;
                        color: var(--text-muted);
                    }

                    select,
                    input {
                        width: 100%;
                        background: rgba(15, 23, 42, 0.6);
                        border: 1px solid var(--border);
                        padding: 0.8rem 1rem;
                        border-radius: 0.75rem;
                        color: white;
                        outline: none;
                        transition: all 0.3s;
                    }

                    select:focus,
                    input:focus {
                        border-color: var(--primary);
                    }

                    .btn-plus {
                        background: var(--primary);
                        color: white;
                        border: none;
                        padding: 1rem;
                        border-radius: 0.75rem;
                        font-weight: 700;
                        width: 100%;
                        cursor: pointer;
                        margin-top: 1rem;
                        transition: all 0.3s;
                    }

                    .btn-plus:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 5px 15px rgba(99, 102, 241, 0.3);
                    }

                    /* Table Style */
                    .billing-table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 1rem;
                    }

                    .billing-table th {
                        text-align: left;
                        padding: 1rem;
                        color: var(--text-muted);
                        font-size: 0.85rem;
                        border-bottom: 1px solid var(--border);
                    }

                    .billing-table td {
                        padding: 1.25rem 1rem;
                        border-bottom: 1px solid var(--border);
                        font-size: 0.9rem;
                    }

                    .total-strip {
                        margin-top: 2rem;
                        padding: 1.5rem;
                        background: rgba(99, 102, 241, 0.1);
                        border-radius: 1rem;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .btn-back {
                        background: rgba(255, 255, 255, 0.05);
                        color: white;
                        text-decoration: none;
                        padding: 0.75rem 1.25rem;
                        border-radius: 0.75rem;
                        border: 1px solid var(--border);
                        font-size: 0.9rem;
                    }

                    @media (max-width: 1000px) {
                        .billing-grid {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <header>
                        <div class="logo">
                            <i class="fa-solid fa-flask-vial" style="color: var(--primary);"></i>
                            MediSales
                        </div>
                        <a href="javascript:history.back()" class="btn-back">
                            <i class="fa-solid fa-arrow-left"></i> Dashboard
                        </a>
                    </header>

                    <div class="billing-grid">
                        <!-- Sidebar Form -->
                        <div class="panel">
                            <h2>Invoice Entry</h2>
                            <form action="getBill" method="POST">
                                <div class="form-group">
                                    <label>Select Product</label>
                                    <select name="productName" id="productName" required onchange="fetchProductStock()">
                                        <option value="">Choose item...</option>
                                    </select>
                                    <div id="maxStockMessage"
                                        style="font-size: 0.75rem; color: #10b981; margin-top: 0.4rem;"></div>
                                </div>

                                <div class="form-group">
                                    <label>Target Customer</label>
                                    <select name="customerName" id="customerName" required>
                                        <option value="">Choose customer...</option>
                                    </select>
                                </div>

                                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                                    <div class="form-group">
                                        <label>Quantity</label>
                                        <input type="number" name="quantity" id="quantityEntered" placeholder="0"
                                            required>
                                    </div>
                                    <div class="form-group">
                                        <label>GST (%)</label>
                                        <input type="number" name="gst" value="12" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Discount (%)</label>
                                    <input type="number" name="discount" value="0">
                                </div>

                                <button type="submit" class="btn-plus">
                                    <i class="fa-solid fa-plus-circle"></i> Add to Invoice
                                </button>

                                <a href="generatePdf" class="btn-plus"
                                    style="background: #10b981; margin-top: 0.75rem; display: flex; text-decoration: none; align-items: center; justify-content: center; gap: 0.5rem;">
                                    <i class="fa-solid fa-file-pdf"></i> Generate Final PDF
                                </a>
                            </form>
                        </div>

                        <!-- Table View -->
                        <div class="panel">
                            <div
                                style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                                <h2>Active Invoice Draft</h2>
                                <span
                                    style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 0.4rem 0.8rem; border-radius: 2rem; font-size: 0.75rem; font-weight: 600;">System
                                    Active</span>
                            </div>

                            <div style="overflow-x: auto;">
                                <table class="billing-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Item Name</th>
                                            <th>Qty</th>
                                            <th>MRP</th>
                                            <th>Tax</th>
                                            <th>Discount</th>
                                            <th>Net Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dto" items="${dtoList}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td style="font-weight: 600;">${dto.productName}</td>
                                                <td>${dto.quantity}</td>
                                                <td>₹${dto.mrp}</td>
                                                <td>${dto.gst}%</td>
                                                <td>${dto.discount}%</td>
                                                <td style="color: #10b981; font-weight: 700;">₹${dto.totalAmount}</td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty dtoList}">
                                            <tr>
                                                <td colspan="7"
                                                    style="text-align: center; color: var(--text-muted); padding: 3rem;">
                                                    No items added to current invoice session</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>

                            <div class="total-strip">
                                <div style="color: var(--text-muted); font-size: 0.9rem;">Invoice Grand Total:</div>
                                <div style="font-size: 1.5rem; font-weight: 800; color: #10b981;">₹${total}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    // Ensure API_BASE doesn't have double slashes
                    const rootPath = '${pageContext.request.contextPath}'.replace(/\/$/, '');
                    const API_BASE = rootPath + '/api';

                    document.addEventListener("DOMContentLoaded", () => {
                        console.log("Initializing billing page. API_BASE:", API_BASE);
                        fetchProducts();
                        fetchCustomers();
                    });

                    async function fetchProducts() {
                        try {
                            console.log("Fetching products from:", `${API_BASE}/getProducts`);
                            const res = await fetch(`${API_BASE}/getProducts`);
                            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                            const data = await res.json();
                            console.log("Products received:", data);
                            let select = document.getElementById("productName");

                            if (!data || data.length === 0) {
                                console.warn("No products found in database.");
                                return;
                            }

                            data.forEach(p => {
                                let opt = document.createElement("option");
                                opt.value = p; opt.text = p;
                                select.appendChild(opt);
                            });
                        } catch (e) {
                            console.error("Failed to fetch products:", e);
                        }
                    }

                    async function fetchCustomers() {
                        try {
                            console.log("Fetching customers from:", `${API_BASE}/getCustomer`);
                            const res = await fetch(`${API_BASE}/getCustomer`);
                            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                            const data = await res.json();
                            console.log("Customers received:", data);
                            let select = document.getElementById("customerName");

                            if (!data || data.length === 0) {
                                console.warn("No customers found in database.");
                                return;
                            }

                            data.forEach(c => {
                                let opt = document.createElement("option");
                                opt.value = c; opt.text = c;
                                select.appendChild(opt);
                            });
                        } catch (e) {
                            console.error("Failed to fetch customers:", e);
                        }
                    }

                    async function fetchProductStock() {
                        const name = document.getElementById("productName").value;
                        const msg = document.getElementById("maxStockMessage");
                        if (name) {
                            try {
                                const res = await fetch(`${API_BASE}/getStockByProduct?productName=${name}`);
                                const stock = await res.json();
                                msg.innerHTML = `<i class="fa-solid fa-warehouse"></i> ${stock} units available`;
                                document.getElementById("quantityEntered").max = stock;
                            } catch (e) { }
                        } else msg.innerHTML = "";
                    }
                </script>
            </body>

            </html>