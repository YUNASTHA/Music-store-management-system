<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        .container{
        margin-bottom:40px}
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
        <a href="#" class="text-decoration-none fw-bold">View All →</a>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <div class="col">
            <div class="product-card">
                <div class="product-image"></div>
                <div class="product-title">Acoustic Guitar</div>
                <div class="fw-bold mt-2">Rs.299.99</div>
                <button class="btn view-button mt-2">View Details</button>
            </div>
        </div>
        <div class="col">
            <div class="product-card">
                <div class="product-image"></div>
                <div class="product-title">Electric Keyboard</div>
                <div class="fw-bold mt-2">Rs.499.99</div>
                <button class="btn view-button mt-2">View Details</button>
            </div>
        </div>
        <div class="col">
            <div class="product-card">
                <div class="product-image"></div>
                <div class="product-title">Professional Microphone</div>
                <div class="fw-bold mt-2">Rs.149.99</div>
                <button class="btn view-button mt-2">View Details</button>
            </div>
        </div>
        <div class="col">
            <div class="product-card">
                <div class="product-image"></div>
                <div class="product-title">Drum Set</div>
                <div class="fw-bold mt-2">Rs.799.99</div>
                <button class="btn view-button mt-2">View Details</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>


</body>
</html>
