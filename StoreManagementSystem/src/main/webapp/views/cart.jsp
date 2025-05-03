<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f9f9f9;
            color: #2f2f2f;
        }
        .cart-page {
            display: flex;
            padding: 40px 60px;
            gap: 40px;
        }

        .cart-items, .order-summary {
            background-color: #fff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .cart-items {
            flex: 2;
        }

        .cart-items h2 {
            margin-bottom: 20px;
            font-size: 22px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #e0e0e0;
            padding: 16px 0;
        }

        .cart-item img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
        }

        .item-info {
            flex: 1;
            display: flex;
            align-items: center;
        }

        .item-details {
            display: flex;
            flex-direction: column;
        }

        .item-name {
            font-weight: 600;
        }

        .qty-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .qty-controls button {
            background-color: #1e3a5f;
            color: #e2e8f0;
            border: none;
            padding: 6px 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        .qty-controls button:hover {
            background-color: #2a4f77;
        }

        .btn-remove {
            color: red;
            background: none;
            border: none;
            cursor: pointer;
        }

        .order-summary {
            flex: 1;
            height: fit-content;
        }

        .order-summary h3 {
            margin-bottom: 20px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .checkout-btn {
            display: block;
            width: 100%;
            background-color: #1e3a5f;
            color: #e2e8f0;
            padding: 12px;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
            font-weight: 600;
            cursor: pointer;
        }

        .checkout-btn:hover {
            background-color: #2a4f77;
        }
    </style>
</head>
<body>

<%@ include file="../navbar.jsp" %>

<div class="cart-page">
    <div class="cart-items">
        <h2>Cart Items (2)</h2>
        
        <div class="cart-item">
            <div class="item-info">
                <img src="https://via.placeholder.com/70" alt="Acoustic Guitar">
                <div class="item-details">
                    <span class="item-name">Acoustic Guitar</span>
                    <span>$299.99 each</span>
                </div>
            </div>
            <div class="qty-controls">
                <button>-</button>
                <span>1</span>
                <button>+</button>
            </div>
            <div>$299.99</div>
            <button class="btn-remove">Remove</button>
        </div>

        <div class="cart-item">
            <div class="item-info">
                <img src="https://via.placeholder.com/70" alt="Electric Keyboard">
                <div class="item-details">
                    <span class="item-name">Electric Keyboard</span>
                    <span>$499.99 each</span>
                </div>
            </div>
            <div class="qty-controls">
                <button>-</button>
                <span>1</span>
                <button>+</button>
            </div>
            <div>$499.99</div>
            <button class="btn-remove">Remove</button>
        </div>
    </div>

    <div class="order-summary">
        <h3>Order Summary</h3>
        <div class="summary-row">
            <span>Subtotal</span>
            <span>$799.98</span>
        </div>
        <div class="summary-row">
            <span>Shipping</span>
            <span>Free</span>
        </div>
        <hr>
        <div class="summary-row" style="font-weight: 700;">
            <span>Total</span>
            <span>$799.98</span>
        </div>
        <p style="font-size: 13px; color: gray;">Your order qualifies for free shipping!</p>
        <button class="checkout-btn">Proceed to Checkout</button>
    </div>
</div>

</body>
</html>
