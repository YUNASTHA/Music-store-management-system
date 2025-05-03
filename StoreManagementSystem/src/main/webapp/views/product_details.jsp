<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Guitar - Product Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            background-color: #f7f7f7;
            font-family: 'Inter', sans-serif;
            color: #1f2937;
        }

        .product-container {
            display: flex;
            gap: 60px;
            padding: 60px 80px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            max-width: 1500px;
            margin: 40px auto;
        }

        .product-image {
            flex: 1;
            background-color: #e5e7eb;
            border-radius: 12px;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .product-details {
            flex: 1;
        }

        .product-details h1 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #111827;
        }

        .product-price {
            font-size: 28px;
            font-weight: 700;
            margin: 16px 0;
            color: #dc6a23;
        }

        .shipping-info {
            color: #16a34a;
            margin-bottom: 20px;
        }

        .quantity {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .quantity label {
            margin-right: 10px;
        }

        .quantity button, .quantity span {
            background-color: #e2e8f0;
            color: #111827;
            padding: 8px 12px;
            border: none;
            font-size: 16px;
            margin: 0 5px;
            border-radius: 6px;
        }

        .stock {
            color: #22c55e;
            margin-left: 10px;
        }

        .actions {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 15px;
        }

        .btn-cart {
            background-color: #dc6a23;
            color: white;
        }

        .btn-wishlist {
            background-color: transparent;
            border: 1px solid #9ca3af;
            color: #111827;
        }

        .tab-content {
            font-size: 15px;
            color: #374151;
        }

        ul.features {
            margin-top: 10px;
            padding-left: 20px;
        }

        ul.features li {
            margin-bottom: 8px;
        }
    </style>
</head>
<body>

<div class="product-container">
    <div class="product-image">
        <i class="fa fa-image fa-3x" style="color: #9ca3af;"></i>
    </div>

    <div class="product-details">
        <h1>Product Name</h1>
        <div class="product-price">$299.99</div>

        <div class="shipping-info">
            <i class="fa fa-truck"></i> Free shipping on orders over $50
        </div>

        <div class="quantity">
            <label>Quantity:</label>
            <button>-</button>
            <span>1</span>
            <button>+</button>
            <span class="stock">15 in stock</span>
        </div>

        <div class="actions">
            <button class="btn btn-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
        </div>

        <div class="tab-content">
            <ul class="features">
                <li>Solid spruce top</li>
                <li>Mahogany back and sides</li>
                <li>Rosewood fingerboard</li>
                <li>Die-cast tuners</li>
                <li>Natural finish</li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
