<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Music Store - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        .hero {
            height: 50vh;
            background: url('https://treasuremusicstore.com/wp-content/uploads/2020/06/WhatsApp-Image-2024-12-02-at-11.09.44-AM.jpeg') no-repeat center center / cover;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 40px;
            font-weight: bold;
            margin: 0;
        }

        .hero p {
            font-size: 18px;
            margin: 12px 0 28px;
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .hero-buttons a {
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: white;
            color: black;
        }

        .btn-primary:hover {
            background-color: #e0e0e0;
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid white;
            color: white;
        }

        .btn-secondary:hover {
            background-color: rgba(255,255,255,0.1);
        }

        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 16px;
            background-color: #fff;
            text-align: center;
            height: 100%;
        }

        .product-image {
            background-color: #eaeaea;
            height: 200px;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-title {
            font-weight: 600;
        }

        .view-button {
            background-color: #111;
            color: #fff;
        }

        .container {
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="hero">
    <h1>Find Your Perfect Sound</h1>
    <p>Discover premium musical instruments and accessories for musicians of all levels.</p>
    <div class="hero-buttons">
        <a href="#" class="btn-primary">Shop Now</a>
        <a href="#" class="btn-secondary">Learn More</a>
    </div>
</div>

<!-- Featured Products Section -->
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Featured Products</h2>
        <a href="product" class="text-decoration-none fw-bold">View All →</a>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- Loop through the first 4 products -->
        <c:forEach var="product" items="${productList}">
            <div class="col">
                <div class="product-card">
                    <div class="product-image">
                        <img src="https://vintageguitarsrus.com/cdn/shop/products/V130VSB_1_a5458a25-dde8-4434-acd2-ad809e33aa99.jpg?v=1643976842" alt="${product.name}" style="width: 100%; height: 100%; object-fit: cover; border-radius: 10px;">
                    </div>
                    <div class="product-title">${product.name}</div>
                    <div class="fw-bold mt-2">Rs.${product.price}</div>
                    <form method="get" action="productDetails.jsp">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <a href="${pageContext.request.contextPath}/product?action=view&id=${product.productId}" class="btn btn-dark">View Details</a>
                        
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
