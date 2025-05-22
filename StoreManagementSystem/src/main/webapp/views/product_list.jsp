<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List - Music Store</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .header h2 {
            font-size: 32px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .header p {
            color: #666;
            font-size: 16px;
        }

        .search-box input[type="text"] {
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            width: 280px;
            font-size: 15px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            transition: transform 0.2s ease-in-out;
            max-width:400px;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img {
            height: 220px;
            background-color: #f7f7f7;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-img img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }

        .card-body {
            padding: 20px;
        }

        .card-body h6 {
            font-size: 18px;
            margin: 8px 0;
            color: #222;
        }

        .card-body .price {
            color: #e63946;
            font-weight: bold;
            font-size: 16px;
        }

        .card-actions {
            display: flex;
            gap: 10px;
            margin-top: 16px;
        }

        .card-actions form,
        .card-actions a {
            flex: 1;
        }

        .btn {
            display: inline-block;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-dark {
            background-color: #1d3557;
            color: white;
            border: none;
        }

        .btn-dark:hover {
            background-color: #0d1b2a;
        }

        .btn-outline {
            background-color: white;
            color: #1d3557;
            border: 1px solid #1d3557;
        }

        .btn-outline:hover {
            background-color: #1d3557;
            color: white;
        }

        button.btn {
            width: 100%;
            cursor: pointer;
        }

    </style>
</head>
<body>

<%@ include file="../navbar.jsp" %>

<div class="container">
    <div class="header">
        <div>
            <h2>Products</h2>
            <p>Browse our collection of high-quality musical instruments</p>
        </div>
        
    </div>

    <div class="product-grid">
        <c:forEach var="product" items="${productList}">		
            <div class="card">
                <div class="card-img">	
                    <img src="https://vintageguitarsrus.com/cdn/shop/products/V130VSB_1_a5458a25-dde8-4434-acd2-ad809e33aa99.jpg?v=1643976842"
                         alt="${product.name}" />
                </div>
                <div class="card-body">
                    <h6>${product.name}</h6>
                    <h6 class="price">Rs. ${product.price}</h6>
                    <div class="card-actions">
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="productId" value="${product.productId}">
                            <button type="submit" class="btn btn-outline">Add to Cart</button>
                        </form>
                        <a href="${pageContext.request.contextPath}/product?action=view&id=${product.productId}" class="btn btn-dark">View</a>
                     
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
