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
            background-color: #f9f9f9;
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
        }

        .header h2 {
            font-weight: bold;
            margin: 0;
        }

        .header p {
            color: #777;
            margin-top: 5px;
            font-size: 14px;
        }

        .search-box input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            width: 250px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            justify-items: start;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            max-width: 300px;
            min-width: 300px;
        }

        .card-img {
            height: 200px;
            background-color: #eee;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-img img {
            max-height: 100%;
            max-width: 100%;
        }

        .card-body {
            padding: 15px;
        }

        .card-body h6 {
            margin: 5px 0;
        }

        .card-body .price {
            font-weight: bold;
            color: #222;
        }

        .card-actions {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .btn {
            flex: 1;
            padding: 8px;
            text-align: center;
            font-size: 14px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-outline-dark {
            background-color: white;
            border: 1px solid #333;
            color: #333;
        }

        .btn-outline-dark:hover {
            background-color: #333;
            color: white;
        }

        .btn-dark {
            background-color: #333;
            color: white;
        }

        .btn-dark:hover {
            background-color: #111;
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
        <div class="search-box">
            <input type="text" placeholder="Search products...">
        </div>
    </div>

    <div class="product-grid">
        <c:forEach var="product" items="${productList}">		

            <div class="card">
                <div class="card-img">	
                    <img src="https://vintageguitarsrus.com/cdn/shop/products/V130VSB_1_a5458a25-dde8-4434-acd2-ad809e33aa99.jpg?v=1643976842" alt="${product.name}" />
                    
                    
					
                </div>
                <div class="card-body">
                    <h6>${product.name}</h6>
                    <h6 class="price">Rs. ${product.price}</h6>
                    <div class="card-actions">
                        <form action="${pageContext.request.contextPath}/cart" method="post">
						    <input type="hidden" name="productId" value="${product.productId}">
						    <input type="number" name="quantity" value="1" min="1">
						    <button type="submit">Add to Cart</button>
						</form>
                        <a href="view-product?id=${product.productId}" class="btn btn-dark">View</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>