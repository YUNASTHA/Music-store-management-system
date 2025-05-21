<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed!</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f9f9f9;
            color: #2f2f2f;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .confirmation-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        .confirmation-container h1 {
            color: #28a745; /* Green for success */
            margin-bottom: 20px;
        }
        .confirmation-container p {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .confirmation-container .order-id {
            font-weight: 700;
            font-size: 20px;
            color: #1e3a5f;
            margin-top: 15px;
        }
        .confirmation-container .button-group {
            margin-top: 30px;
        }
        .confirmation-container .button-group a {
            display: inline-block;
            background-color: #1e3a5f;
            color: #e2e8f0;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            margin: 0 10px;
        }
        .confirmation-container .button-group a:hover {
            background-color: #2a4f77;
        }
        .confirmation-container .button-group a.secondary {
            background-color: #f0f0f0;
            color: #2f2f2f;
        }
        .confirmation-container .button-group a.secondary:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h1>Order Confirmed!</h1>
        <p>Thank you for your purchase.</p>
        <p>Your order has been placed successfully.</p>
        <c:if test="${not empty param.orderId}">
            <p class="order-id">Order ID: <c:out value="${param.orderId}" /></p>
        </c:if>

        <div class="button-group">
            <a href="${pageContext.request.contextPath}/">Continue Shopping</a>
            </div>
    </div>
</body>
</html>