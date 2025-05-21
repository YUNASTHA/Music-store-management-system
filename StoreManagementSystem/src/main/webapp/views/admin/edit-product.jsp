<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.store.model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-navbar.jsp" />

<html>
<head>
    <title>Admin - Edit Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
        }

        .main-content {
            margin-left: 220px;
            padding: 30px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #34495e;
        }

        form input,
        form textarea,
        form select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        form input:focus,
        form textarea:focus,
        form select:focus {
            border-color: #007bff;
            outline: none;
        }

        form textarea {
            height: 120px;
            resize: none;
        }

        .form-row {
            display: flex;
            gap: 90px;
        }

        .form-row input {
            width: 140%;
        }

        button {
            padding: 12px;
            background-color: #1e3a5f;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #152032;
            transform: scale(1.05);
        }

        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

        .current-image {
            margin-bottom: 20px;
            text-align: center;
        }

        .current-image img {
            max-width: 200px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>Edit Product</h2>

    <div class="container">
        <c:if test="${not empty message}">
            <div class="message ${message == 'Product updated successfully.' ? 'success' : 'error'}">
                ${message}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/product" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="product_id" value="${product.productId}" />

            <label for="name">Product Name:</label>
            <input type="text" name="name" id="name" value="${product.name}" required>

            <label for="description">Description:</label>
            <textarea name="description" id="description" required>${product.description}</textarea>

            <div class="form-row">
                <div>
                    <label for="price">Price:</label>
                    <input type="number" step="0.01" name="price" id="price" value="${product.price}" required>
                </div>
                <div>
                    <label for="stock">Stock:</label>
                    <input type="number" name="stock" id="stock" value="${product.stock}" required>
                </div>
            </div>

            <c:if test="${not empty product.image}">
                <div class="current-image">
                    <label>Current Image:</label><br/>
                    <img src="${pageContext.request.contextPath}/uploads/${product.image}" alt="Product Image"/>
                </div>
            </c:if>

            <label for="image">Upload New Image (optional):</label>
            <input type="file" name="image" id="image" accept="image/*">

            <label for="is_active">Active:</label>
            <input type="checkbox" name="is_active" id="is_active" value="true" ${product.isActive ? "checked" : ""}>

            <button type="submit">Update Product</button>
        </form>
    </div>
</div>

</body>
</html>
