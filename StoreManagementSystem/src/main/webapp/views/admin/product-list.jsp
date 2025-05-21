<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-navbar.jsp" />

<html>
<head>
    <title>Admin - View Products</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
        }

        .main-content {
            margin-left: 220px; /* Adjust based on your sidebar */
            padding: 30px;
        }

        h2 {
            color: #2c3e50;
            margin-left: 20px;
        }

        .top-actions {
            display: flex;
            justify-content: flex-end;
            margin: 10px 20px 20px 0;
        }

        .btn-add {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        .btn-add:hover {
            background-color: #0056b3;
        }

        table {
            width: calc(100% - 40px);
            border-collapse: separate;
            border-spacing: 0;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
        }

        th {
            background-color: #34495e;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0f7fa;
        }

        img {
            height: 60px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-edit {
            background-color: #28a745;
            color: white;
            margin-right: 5px;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .message {
            margin: 20px;
            color: green;
            font-weight: bold;
        }

        .error {
            margin: 20px;
            color: #e74c3c;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>All Products</h2>
    

    <div class="top-actions">
        <a href="${pageContext.request.contextPath}/admin/product?action=add" class="btn-add">Add Product</a>
    </div>

    <c:if test="${not empty message}">
        <p class="message">${message}</p>
    </c:if>

    <c:if test="${empty products}">
        <p class="error">No products found.</p>
    </c:if>

    <c:if test="${not empty products}">
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>
                            
						<img src="${pageContext.request.contextPath}/${product.image}" alt="${product.name}" width="200" />
                            
                            
                            
                            
                        </td>
                        <td>${product.name}</td>
                        <td>Rs. ${product.price}</td>
                        <td>${product.stock}</td>
                        <td>
                                <a href="${pageContext.request.contextPath}/admin/product?action=edit&id=${product.productId}">
                                <button class="btn btn-edit">Edit</button>
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/product?action=delete&id=${product.productId}"
                               onclick="return confirm('Are you sure you want to delete this product?');">
                                <button class="btn btn-delete">Delete</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
                            
