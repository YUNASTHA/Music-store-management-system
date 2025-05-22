<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }

        h2 {
            color: #111827;
            font-size: 28px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
        }

        .order-card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid #e5e7eb;
            transition: box-shadow 0.2s ease;
        }

        .order-card:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        .order-info {
            margin-bottom: 15px;
            font-size: 16px;
            color: #374151;
            font-weight: 500;
            text-transform: capitalize;
        }

        .order-info strong {
            color: #1f2937;
            font-size: 18px;
        }

        .order-total {
            font-size: 18px;
            font-weight: bold;
            color: #1f2937;
            margin-bottom: 15px;
            border-top: 2px solid #e5e7eb;
            padding-top: 10px;
        }

        .order-items {
            margin-top: 15px;
            padding-left: 0;
            list-style: none;
        }

        .order-items li {
            padding: 12px 20px;
            border-radius: 6px;
            background-color: #f9fafb;
            border: 1px solid #e5e7eb;
            margin-bottom: 8px;
            font-size: 15px;
            color: #374151;
            display: flex;
            justify-content: space-between;
        }

        .order-items li .item-details {
            display: flex;
            justify-content: space-between;
            width: 100%;
            padding-right: 15px; /* Add space on the right */
        }

        .order-items li .item-details div {
            padding-left: 10px;
            padding-right: 10px;
        }

        .no-orders {
            text-align: center;
            background-color: #e0f2fe;
            padding: 20px;
            border: 1px solid #bae6fd;
            border-radius: 8px;
            color: #0369a1;
            font-style: italic;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Your Order History</h2>

    <c:if test="${empty orders}">
        <p class="no-orders">You haven't placed any orders yet.</p>
    </c:if>

    <c:forEach var="order" items="${orders}">
        <div class="order-card">
            <div class="order-info"><strong>Order ID:</strong> ${order.orderId}</div>
            <div class="order-info"><strong>Status:</strong> ${order.status}</div>
            <div class="order-total"><strong>Total:</strong> Rs.<fmt:formatNumber value="${order.total}" type="number" minFractionDigits="2" /></div>

            <c:if test="${not empty order.orderItems}">
                <div class="order-info"><strong>Items:</strong></div>
                <ul class="order-items">
                    <c:forEach var="item" items="${order.orderItems}">
                        <li>
                            <div class="item-details">
                                <div><strong>Product Name:</strong> ${item.productName}</div>
                                <div><strong>Qty:</strong> ${item.quantity}</div>
                                <div><strong>Price:</strong> Rs.<fmt:formatNumber value="${item.productPrice}" type="number" minFractionDigits="2" /></div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </c:forEach>
</div>

</body>
</html>
