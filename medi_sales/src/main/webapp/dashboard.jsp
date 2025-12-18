<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="icon" href="logo.png" type="image/png">
                <title>MediSales - Premium Dashboard</title>

                <!-- Google Fonts & Icons -->
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                <!-- Custom CSS -->
                <link rel="stylesheet" href="css/dashboard.css">

                <!-- Chart.js -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            </head>

            <body>

                <!-- Sidebar -->
                <div class="sidebar">
                    <div class="sidebar-header">
                        <img src="logo.png" alt="Logo" style="height: 40px; border-radius: 8px;">
                        <h2
                            style="font-size: 1.25rem; margin: 0; background: linear-gradient(to right, #6366f1, #ec4899); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">
                            MediSales</h2>
                    </div>

                    <nav style="margin-top: 2rem;">
                        <a href="dashboard" class="nav-link active">
                            <i class="fa-solid fa-house"></i> Dashboard
                        </a>
                        <a href="createstock" class="nav-link">
                            <i class="fa-solid fa-plus-circle"></i> Create Stock
                        </a>
                        <a href="getallstocks" class="nav-link">
                            <i class="fa-solid fa-boxes-stacked"></i> View Stocks
                        </a>
                        <a href="generatebill" class="nav-link">
                            <i class="fa-solid fa-file-invoice-dollar"></i> Generate Bill
                        </a>
                        <a href="fetchDto?eMail=${dto.email}" class="nav-link">
                            <i class="fa-solid fa-user-gear"></i> Settings
                        </a>

                        <div style="position: absolute; bottom: 2rem; width: 100%;">
                            <a href="logout.jsp" class="nav-link" style="color: #ef4444;">
                                <i class="fa-solid fa-right-from-bracket"></i> Logout
                            </a>
                        </div>
                    </nav>
                </div>

                <!-- Topbar -->
                <div class="topbar">
                    <div class="search-box">
                        <h2 style="font-size: 1.1rem; margin: 0; font-weight: 500;">Welcome, ${dto.contactPerson}!</h2>
                    </div>
                    <div class="user-profile" style="display: flex; align-items: center; gap: 1rem;">
                        <div class="notifications" style="position: relative;">
                            <i class="fa-regular fa-bell" style="font-size: 1.2rem; cursor: pointer;"></i>
                            <span
                                style="position: absolute; top: -5px; right: -5px; background: #ef4444; width: 8px; height: 8px; border-radius: 50%;"></span>
                        </div>
                        <img src="logo.jpeg" alt="Avatar"
                            style="width: 40px; height: 40px; border-radius: 50%; border: 2px solid var(--primary-color);">
                    </div>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <div class="header-msg" style="margin-bottom: 2rem;">
                        <h1 style="font-weight: 700; margin-bottom: 0.5rem;">Sales Overview</h1>
                        <p style="color: var(--text-muted);">Real-time metrics for your medical supply business.</p>
                    </div>

                    <!-- Stats Grid -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="icon" style="background: rgba(99, 102, 241, 0.2); color: #6366f1;">
                                <i class="fa-solid fa-box-open"></i>
                            </div>
                            <div class="stat-value">${totalProducts}</div>
                            <div class="stat-label">Total Products</div>
                        </div>

                        <div class="stat-card">
                            <div class="icon" style="background: rgba(236, 72, 153, 0.2); color: #ec4899;">
                                <i class="fa-solid fa-indian-rupee-sign"></i>
                            </div>
                            <div class="stat-value">₹${inventoryValue}</div>
                            <div class="stat-label">Inventory Value</div>
                        </div>

                        <div class="stat-card">
                            <div class="icon" style="background: rgba(245, 158, 11, 0.2); color: #f59e0b;">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <div class="stat-value">${lowStockCount}</div>
                            <div class="stat-label">Low Stock Alerts</div>
                        </div>

                        <div class="stat-card">
                            <div class="icon" style="background: rgba(16, 185, 129, 0.2); color: #10b981;">
                                <i class="fa-solid fa-chart-line"></i>
                            </div>
                            <div class="stat-value">${dto.noOfLogins}</div>
                            <div class="stat-label">Total Logins</div>
                        </div>
                    </div>

                    <!-- Content Grid -->
                    <div class="content-grid">
                        <div class="panel">
                            <h3>Inventory Distribution</h3>
                            <canvas id="inventoryChart" height="150"></canvas>
                        </div>

                        <div class="panel">
                            <h3>Quick Actions</h3>
                            <div style="display: flex; flex-direction: column; gap: 1rem;">
                                <button class="btn-premium" onclick="location.href='createstock'">
                                    <i class="fa-solid fa-plus"></i> Add New Stock
                                </button>
                                <button class="btn-premium"
                                    style="background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border);"
                                    onclick="location.href='generatebill'">
                                    <i class="fa-solid fa-file-invoice"></i> Create Bill
                                </button>
                                <button class="btn-premium"
                                    style="background: rgba(255,255,255,0.05); border: 1px solid var(--glass-border);"
                                    onclick="location.href='getallstocks'">
                                    <i class="fa-solid fa-list"></i> View Inventory
                                </button>
                            </div>

                            <div style="margin-top: 2rem;">
                                <h4>Recent Alerts</h4>
                                <c:if test="${lowStockCount > 0}">
                                    <div
                                        style="background: rgba(239, 68, 68, 0.1); border-left: 4px solid #ef4444; padding: 1rem; border-radius: 8px;">
                                        <p style="margin: 0; color: #f87171; font-size: 0.9rem;">
                                            <i class="fa-solid fa-circle-exclamation"></i> ${lowStockCount} products are
                                            running low on stock!
                                        </p>
                                    </div>
                                </c:if>
                                <c:if test="${lowStockCount == 0}">
                                    <p style="color: var(--text-muted); font-size: 0.9rem;">All stocks are healthy.</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chart Configuration -->
                <script>
                    const ctx = document.getElementById('inventoryChart').getContext('2d');
                    const labels = [];
                    const dataValues = [];

                    <c:forEach items="${topProducts}" var="product">
                        labels.push('${product.productName}');
                        dataValues.push(${product.quantity});
                    </c:forEach>

                    // Fallback if no products
                    if (labels.length === 0) {
                        labels.push('No Data');
                        dataValues.push(0);
                    }

                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Stock Quantity',
                                data: dataValues,
                                backgroundColor: 'rgba(99, 102, 241, 0.5)',
                                borderColor: '#6366f1',
                                borderWidth: 2,
                                borderRadius: 8
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
                                    grid: { color: 'rgba(255,255,255,0.1)' },
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