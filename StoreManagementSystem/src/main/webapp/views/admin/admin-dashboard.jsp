<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.store.model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-navbar.jsp" />

<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
        }

        .main-content {
            margin-left: 220px;
            padding: 30px;
            padding-left:50px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            margin-bottom: 40px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card h3 {
            color: #34495e;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            color: #1e3a5f;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #1e3a5f;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status {
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: bold;
        }

        .completed {
            background-color: #d4edda;
            color: #155724;
        }

        .pending {
            background-color: #fff3cd;
            color: #856404;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>Admin Dashboard</h2>

    <!-- Dashboard Summary Cards -->
    <div class="stats-grid">
        <div class="card">
            <h3>Total Admins</h3>
            <p>${adminCount}</p>
        </div>
        <div class="card">
            <h3>Total Customers</h3>
            <p>${customerCount}</p>
        </div>
        <div class="card">
            <h3>Total Products</h3>
            <p>${productCount}</p>
        </div>
        <div class="card">
            <h3>Total Orders</h3>
            <p>${orderCount}</p>
        </div>
    </div>

    <!-- Order Table -->
    <h3 style="color:#2c3e50; margin-bottom: 15px;">Recent Orders</h3>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Total (Rs)</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
               
                <td>Rs. ${order.total}</td>
                
                
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
