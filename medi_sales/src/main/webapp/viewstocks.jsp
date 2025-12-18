<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Inventory Registry - MediSales</title>

                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <style>
                    :root {
                        --primary: #6366f1;
                        --secondary: #ec4899;
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
                        background-image: radial-gradient(circle at 100% 0%, rgba(236, 72, 153, 0.05) 0%, transparent 50%);
                        min-height: 100vh;
                        font-family: 'Outfit', sans-serif;
                        color: white;
                        padding: 2rem 3rem;
                    }

                    header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 3rem;
                        max-width: 1400px;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .logo {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        font-size: 1.5rem;
                        font-weight: 800;
                    }

                    .container {
                        max-width: 1400px;
                        margin: 0 auto;
                    }

                    .panel {
                        background: var(--card-glass);
                        border: 1px solid var(--border);
                        border-radius: 2rem;
                        padding: 2.5rem;
                        backdrop-filter: blur(15px);
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                    }

                    .panel-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 2.5rem;
                    }

                    h2 {
                        font-size: 1.75rem;
                        font-weight: 700;
                    }

                    .table-container {
                        overflow-x: auto;
                        border-radius: 1rem;
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid var(--border);
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.9rem;
                    }

                    th {
                        background: rgba(255, 255, 255, 0.03);
                        text-align: left;
                        padding: 1.25rem 1rem;
                        color: var(--text-muted);
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.05em;
                        font-size: 0.75rem;
                        border-bottom: 1px solid var(--border);
                    }

                    td {
                        padding: 1.25rem 1rem;
                        border-bottom: 1px solid var(--border);
                        color: #f8fafc;
                    }

                    tr:last-child td {
                        border-bottom: none;
                    }

                    tr:hover td {
                        background: rgba(255, 255, 255, 0.02);
                    }

                    .badge {
                        padding: 0.4rem 0.8rem;
                        border-radius: 2rem;
                        font-size: 0.7rem;
                        font-weight: 700;
                    }

                    .badge-success {
                        background: rgba(16, 185, 129, 0.1);
                        color: #10b981;
                    }

                    .badge-warning {
                        background: rgba(245, 158, 11, 0.1);
                        color: #f59e0b;
                    }

                    .badge-danger {
                        background: rgba(239, 68, 68, 0.1);
                        color: #ef4444;
                    }

                    .btn-back {
                        color: white;
                        text-decoration: none;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        background: rgba(255, 255, 255, 0.05);
                        padding: 0.75rem 1.25rem;
                        border-radius: 0.75rem;
                        border: 1px solid var(--border);
                        font-size: 0.9rem;
                        transition: all 0.3s;
                    }

                    .btn-back:hover {
                        background: rgba(255, 255, 255, 0.1);
                        border-color: var(--primary);
                    }

                    .status-dot {
                        height: 8px;
                        width: 8px;
                        border-radius: 50%;
                        display: inline-block;
                        margin-right: 6px;
                    }

                    @media (max-width: 768px) {
                        body {
                            padding: 1.5rem;
                        }

                        .panel {
                            padding: 1.5rem;
                        }

                        .panel-header {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 1rem;
                        }
                    }
                </style>
            </head>

            <body>
                <header>
                    <div class="logo">
                        <i class="fa-solid fa-flask-vial" style="color: var(--primary);"></i>
                        MediSales
                    </div>
                    <a href="javascript:history.back()" class="btn-back">
                        <i class="fa-solid fa-arrow-left"></i> Discard & Return
                    </a>
                </header>

                <div class="container">
                    <div class="panel">
                        <div class="panel-header">
                            <div>
                                <h2>Inventory Registry</h2>
                                <p style="color: var(--text-muted); font-size: 0.85rem; margin-top: 0.25rem;">Live view
                                    of all medical products in stock.</p>
                            </div>
                            <div style="display: flex; gap: 1rem;">
                                <span class="badge badge-success"><i class="fa-solid fa-circle-check"></i> Enterprise
                                    Verified</span>
                            </div>
                        </div>

                        <div class="table-container">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Ref ID</th>
                                        <th>Product Details</th>
                                        <th>Company</th>
                                        <th>MRP</th>
                                        <th>Batch / HSN</th>
                                        <th>Dates (MFG/EXP)</th>
                                        <th>Volume</th>
                                        <th>Pricing</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="stock" items="${stockList}">
                                        <tr>
                                            <td style="color: var(--text-muted);">#${stock.id}</td>
                                            <td>
                                                <div style="font-weight: 700;">${stock.productName}</div>
                                                <div style="font-size: 0.75rem; color: var(--text-muted);">${stock.pack}
                                                    Pack</div>
                                            </td>
                                            <td>${stock.productCompany}</td>
                                            <td style="font-weight: 600;">₹${stock.mrp}</td>
                                            <td>
                                                <div style="font-size: 0.85rem;">${stock.batchNo}</div>
                                                <div style="font-size: 0.7rem; color: var(--text-muted);">${stock.hsn}
                                                </div>
                                            </td>
                                            <td>
                                                <div style="font-size: 0.85rem;">${stock.mfgDate}</div>
                                                <div style="font-size: 0.85rem; color: #ef4444;">${stock.expDate}</div>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${stock.quantity < 10}">
                                                        <span style="color: #ef4444; font-weight: 700;"><i
                                                                class="fa-solid fa-triangle-exclamation"></i>
                                                            ${stock.quantity} Unit</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="font-weight: 500;">${stock.quantity} Unit</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div style="font-weight: 600;">₹${stock.rate}</div>
                                                <div style="font-size: 0.75rem; color: #10b981;">-${stock.discount}%
                                                    Disc</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty stockList}">
                                        <tr>
                                            <td colspan="8"
                                                style="text-align: center; padding: 4rem; color: var(--text-muted);">
                                                <i class="fa-solid fa-inbox"
                                                    style="font-size: 3rem; display: block; margin-bottom: 1rem; opacity: 0.5;"></i>
                                                No records found in the current inventory cluster.
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <footer
                    style="margin-top: 3rem; text-align: center; color: var(--text-muted); font-size: 0.8rem; padding-bottom: 2rem;">
                    &copy; 2025 MediSales Enterprise. Advanced Pharma ERP Cloud.
                </footer>
            </body>

            </html>