<%@ page import="java.util.List" %>
<%@ page import="com.store.model.Order" %>
<%@ page import="com.store.model.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .order-summary {
            border: 1px solid #ddd;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .order-item {
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .order-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
            margin-bottom: 0;
        }

        .order-total {
            font-weight: bold;
            font-size: 1.2em;
            margin-top: 10px;
        }

        .no-orders {
            text-align: center;
            padding: 10px;
            background-color: #e0f7fa;
            border: 1px solid #b2ebf2;
            border-radius: 4px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Orders</h1>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders == null || orders.isEmpty()) {
        %>
            <p class="no-orders">You have no orders yet.</p>
        <%
            } else {
        %>
            <%
                for (Order order : orders) {
            %>
                <div class="order-summary">
                    <h4>Order ID: <%= order.getOrderId() %></h4>
                    <p>Order Status: <%= order.getStatus() %></p>
                    <p class="order-total">Total: $<%= String.format("%.2f", order.getTotal()) %></p>
                    <h5>Order Items:</h5>
                    <%
                        List<OrderItem> orderItems = order.getOrderItems();
                        if (orderItems == null || orderItems.isEmpty()) {
                    %>
                        <p>No items found in this order.</p>
                    <%
                        } else {
                            for (OrderItem orderItem : orderItems) {
                    %>
                        <div class="order-item">
                            <p>Product ID: <%= orderItem.getProductId() %></p>
                            <p>Quantity: <%= orderItem.getQuantity() %></p>
                            <p>Price: $<%= String.format("%.2f", orderItem.getPrice()) %></p>
                            <% if (orderItem.getProduct() != null) { %>
                                <p>Product Name: <%= orderItem.getProduct().getName() %></p>
                            <% } %>
                        </div>
                    <%
                            } // end inner loop
                        }
                    %>
                </div>
            <%
                } // end outer loop
            }
        %>
    </div>
</body>
