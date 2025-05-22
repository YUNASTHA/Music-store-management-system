<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>${product.name} - Product Details</title>
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

        .product-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
            border-radius: 12px;
        }

        .product-details {
            flex: 1;
        }

        .product-details h1 {
            font-size: 36px;
            margin-bottom: 10px;
            color: #111827;
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
            cursor: pointer;
        }

        .quantity button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
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

<%@ include file="../navbar.jsp" %>

<div class="product-container">
    <div class="product-image">
        <c:choose>
            <c:when test="${not empty product.image}">
                <img src="https://vintageguitarsrus.com/cdn/shop/products/V130VSB_1_a5458a25-dde8-4434-acd2-ad809e33aa99.jpg?v=1643976842" alt="${product.name}" />
            </c:when>
            <c:otherwise>
                <i class="fa fa-image fa-3x" style="color: #9ca3af;"></i>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="product-details">
        <h1>${product.name}</h1>

        <div class="shipping-info">
            <i class="fa fa-truck"></i> Free shipping
        </div>

        <div class="quantity">
            <label>Quantity:</label>
            <button type="button" onclick="decreaseQty()">-</button>
            <span id="quantity-value">1</span>
            <button type="button" onclick="increaseQty()">+</button>
            <span class="stock">${product.stock} in stock</span>
        </div>

        <!-- Hidden quantity input -->
        <input type="hidden" name="quantity" id="quantity-input" form="addToCartForm" value="1" />

        <div class="actions">
            <form id="addToCartForm" action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="productId" value="${product.productId}" />
                <button type="submit" class="btn btn-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
            </form>
        </div>

        <div class="tab-content">
            <c:if test="${not empty product.description}">
                <p>${product.description}</p>
            </c:if>
        </div>
    </div>
</div>

<!-- JavaScript to handle quantity -->
<script>
    let quantity = 1;
    const maxStock = ${product.stock};
    const quantityDisplay = document.getElementById("quantity-value");
    const quantityInput = document.getElementById("quantity-input");

    function increaseQty() {
        if (quantity < maxStock) {
            quantity++;
            updateQty();
        }
    }

    function decreaseQty() {
        if (quantity > 1) {
            quantity--;
            updateQty();
        }
    }

    function updateQty() {
        quantityDisplay.textContent = quantity;
        quantityInput.value = quantity;
    }
</script>

</body>
</html>
