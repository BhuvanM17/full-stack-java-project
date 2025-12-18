<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Dashboard - MediSales Premium</title>

                <!-- Google Fonts & Icons -->
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <!-- Chart.js -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                <style>
                    :root {
                        --primary: #6366f1;
                        --secondary: #ec4899;
                        --bg-dark: #0f172a;
                        --sidebar-bg: #1e293b;
                        --card-glass: rgba(30, 41, 59, 0.7);
                        --border: rgba(255, 255, 255, 0.1);
                        --text-main: #f8fafc;
                        --text-muted: #94a3b8;
                    }

                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: 'Outfit', sans-serif;
                    }

                    body {
                        background-color: var(--bg-dark);
                        color: var(--text-main);
                        overflow-x: hidden;
                        display: flex;
                    }

                    /* Sidebar */
                    .sidebar {
                        width: 280px;
                        height: 100vh;
                        background: var(--sidebar-bg);
                        border-right: 1px solid var(--border);
                        padding: 2rem 1.5rem;
                        position: fixed;
                        display: flex;
                        flex-direction: column;
                    }

                    .sidebar-header {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        margin-bottom: 3rem;
                        cursor: pointer;
                    }

                    .sidebar-header i {
                        font-size: 2rem;
                        color: var(--primary);
                    }

                    .nav-link {
                        display: flex;
                        align-items: center;
                        gap: 1rem;
                        padding: 1rem 1.25rem;
                        color: var(--text-muted);
                        text-decoration: none;
                        border-radius: 0.75rem;
                        margin-bottom: 0.5rem;
                        transition: all 0.3s;
                        font-weight: 500;
                    }

                    .nav-link:hover,
                    .nav-link.active {
                        background: rgba(99, 102, 241, 0.1);
                        color: var(--primary);
                    }

                    .nav-link i {
                        font-size: 1.2rem;
                    }

                    /* Main Content */
                    .main-content {
                        margin-left: 280px;
                        width: calc(100% - 280px);
                        padding: 2rem 3rem;
                    }

                    /* Topbar */
                    .topbar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 3rem;
                    }

                    .user-pill {
                        background: var(--card-glass);
                        padding: 0.5rem 1rem;
                        border-radius: 2rem;
                        border: 1px solid var(--border);
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .avatar {
                        width: 32px;
                        height: 32px;
                        border-radius: 50%;
                        background: var(--primary);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 700;
                        font-size: 0.8rem;
                    }

                    /* Stats Grid */
                    .stats-grid {
                        display: grid;
                        grid-template-columns: repeat(4, 1fr);
                        gap: 1.5rem;
                        margin-bottom: 2rem;
                    }

                    .stat-card {
                        background: var(--card-glass);
                        padding: 1.5rem;
                        border-radius: 1.25rem;
                        border: 1px solid var(--border);
                        backdrop-filter: blur(10px);
                    }

                    .stat-icon {
                        width: 45px;
                        height: 45px;
                        border-radius: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 1.25rem;
                        margin-bottom: 1.25rem;
                    }

                    .stat-value {
                        font-size: 1.75rem;
                        font-weight: 700;
                        margin-bottom: 0.25rem;
                    }

                    .stat-label {
                        color: var(--text-muted);
                        font-size: 0.85rem;
                    }

                    /* Content Sections */
                    .grid-2 {
                        display: grid;
                        grid-template-columns: 2fr 1fr;
                        gap: 1.5rem;
                    }

                    .panel {
                        background: var(--card-glass);
                        border-radius: 1.5rem;
                        border: 1px solid var(--border);
                        padding: 2rem;
                        backdrop-filter: blur(10px);
                    }

                    .panel-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 2rem;
                    }

                    .btn-action {
                        background: var(--primary);
                        color: white;
                        padding: 0.75rem 1.25rem;
                        border-radius: 0.75rem;
                        text-decoration: none;
                        font-size: 0.85rem;
                        font-weight: 600;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        transition: all 0.3s;
                    }

                    .btn-action:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
                    }

                    .btn-outline {
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border);
                        color: var(--text-main);
                        padding: 1rem;
                        border-radius: 0.75rem;
                        text-decoration: none;
                        display: block;
                        margin-bottom: 1rem;
                        font-weight: 500;
                        transition: all 0.3s;
                    }

                    .btn-outline:hover {
                        background: rgba(255, 255, 255, 0.1);
                        border-color: var(--primary);
                    }

                    @media (max-width: 1200px) {
                        .stats-grid {
                            grid-template-columns: repeat(2, 1fr);
                        }

                        .grid-2 {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
            </head>

            <body>

                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="sidebar-header" onclick="location.href='index'">
                        <i class="fa-solid fa-flask-vial"></i>
                        <h2 style="font-weight: 800; font-size: 1.5rem;">MediSales</h2>
                    </div>

                    <nav>
                        <a href="dashboard" class="nav-link active">
                            <i class="fa-solid fa-chart-pie"></i> Dashboard
                        </a>
                        <a href="createstock" class="nav-link">
                            <i class="fa-solid fa-plus"></i> New Stock
                        </a>
                        <a href="getallstocks" class="nav-link">
                            <i class="fa-solid fa-boxes-stacked"></i> Inventory
                        </a>
                        <a href="generatebill" class="nav-link">
                            <i class="fa-solid fa-file-invoice-dollar"></i> Billing
                        </a>
                        <a href="fetchDto?eMail=${dto.email}" class="nav-link">
                            <i class="fa-solid fa-gears"></i> Settings
                        </a>
                    </nav>

                    <div style="margin-top: auto;">
                        <a href="logout" class="nav-link" style="color: #ef4444; background: rgba(239, 68, 68, 0.05);">
                            <i class="fa-solid fa-power-off"></i> Logout
                        </a>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <div class="topbar">
                        <div>
                            <h1 style="font-size: 1.75rem; font-weight: 700;">Inventory Intelligence</h1>
                            <p style="color: var(--text-muted); font-size: 0.9rem;">Welcome back, ${dto.contactPerson}
                            </p>
                        </div>

                        <div class="user-pill">
                            <div class="avatar">${dto.contactPerson.substring(0,1).toUpperCase()}</div>
                            <div style="font-size: 0.85rem; font-weight: 600;">System Active</div>
                            <i class="fa-solid fa-circle-check" style="color: #10b981; font-size: 0.8rem;"></i>
                        </div>
                    </div>

                    <!-- Stats -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(99, 102, 241, 0.15); color: var(--primary);">
                                <i class="fa-solid fa-box"></i>
                            </div>
                            <div class="stat-label">Stock Items</div>
                            <div class="stat-value">${totalProducts}</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon"
                                style="background: rgba(236, 72, 153, 0.15); color: var(--secondary);">
                                <i class="fa-solid fa-indian-rupee-sign"></i>
                            </div>
                            <div class="stat-label">Inventory Value</div>
                            <div class="stat-value">₹${inventoryValue}</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(245, 158, 11, 0.15); color: #f59e0b;">
                                <i class="fa-solid fa-truck-ramp-box"></i>
                            </div>
                            <div class="stat-label">Low Stock</div>
                            <div class="stat-value">${lowStockCount}</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon" style="background: rgba(16, 185, 129, 0.15); color: #10b981;">
                                <i class="fa-solid fa-user-clock"></i>
                            </div>
                            <div class="stat-label">Login Count</div>
                            <div class="stat-value">${dto.noOfLogins}</div>
                        </div>
                    </div>

                    <!-- Charts & Actions -->
                    <div class="grid-2">
                        <div class="panel">
                            <div class="panel-header">
                                <h3 style="font-size: 1.1rem; font-weight: 600;">Product Performance</h3>
                                <div style="font-size: 0.75rem; color: var(--text-muted);">Last 5 Items</div>
                            </div>
                            <div style="height: 300px;">
                                <canvas id="mainChart"></canvas>
                            </div>
                        </div>

                        <div class="panel">
                            <h3 style="font-size: 1.1rem; font-weight: 600; margin-bottom: 1.5rem;">Quick Operations
                            </h3>
                            <a href="createstock" class="btn-action"
                                style="padding: 1rem; justify-content: center; margin-bottom: 2rem;">
                                <i class="fa-solid fa-plus-circle"></i> Add Inventory
                            </a>

                            <h4
                                style="font-size: 0.85rem; font-weight: 600; color: var(--text-muted); margin-bottom: 1rem; text-transform: uppercase; letter-spacing: 0.05em;">
                                Drafts & Reports</h4>
                            <a href="generatebill" class="btn-outline">
                                <i class="fa-solid fa-file-invoice"></i> Create New Bill
                            </a>
                            <a href="getallstocks" class="btn-outline">
                                <i class="fa-solid fa-table-list"></i> Full Stock Report
                            </a>
                        </div>
                    </div>

                    <c:if test="${lowStockCount > 0}">
                        <div
                            style="margin-top: 1.5rem; background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.2); border-radius: 1rem; padding: 1.25rem; display: flex; align-items: center; gap: 1rem;">
                            <i class="fa-solid fa-circle-exclamation" style="color: #ef4444; font-size: 1.25rem;"></i>
                            <div style="font-size: 0.9rem;">
                                <span style="font-weight: 700; color: #ef4444;">Action Required:</span> ${lowStockCount}
                                products have fallen below the 10-unit safety threshold.
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- Chart Script -->
                <script>
                    const ctx = document.getElementById('mainChart').getContext('2d');
                    const labels = [];
                    const dataValues = [];

                    <c:forEach items="${topProducts}" var="product">
                        labels.push('${product.productName}');
                        dataValues.push(${product.quantity});
                    </c:forEach>

                    if (labels.length === 0) {
                        labels.push('No Inventory');
                        dataValues.push(0);
                    }

                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Units in Stock',
                                data: dataValues,
                                borderColor: '#6366f1',
                                backgroundColor: 'rgba(99, 102, 241, 0.1)',
                                fill: true,
                                tension: 0.4,
                                pointRadius: 4,
                                borderWidth: 3
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false }
                            },
                            scales: {
                                y: {
                                    beginAtZero: true,
                                    grid: { color: 'rgba(255,255,255,0.05)' },
                                    ticks: { color: '#94a3b8' }
                                },
                                x: {
                                    grid: { display: false },
                                    ticks: { color: '#94a3b8' }
                                }
                            }
                        }
                    });
                </script>
            </body>

            </html>