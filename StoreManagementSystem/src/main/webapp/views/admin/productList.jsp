<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.store.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<div class="container">
    <h1>Product List</h1>

        <div class="contact-card">
            <p><strong>ID:</strong> ${product.id}</p>
            <p><strong><i class="fas fa-music"></i> Name:</strong> ${product.name}</p>
            <p><strong><i class="fas fa-money-bill-wave"></i> Price:</strong> ${product.price}</p>
            <p><strong><i class="fas fa-layer-group"></i> Quantity:</strong> ${product.quantity}</p>
            <p><strong><i class="fas fa-tags"></i> Category:</strong> ${product.category}</p>
            <p><strong><i class="fas fa-file-alt"></i> Description:</strong> ${product.description}</p>
        </div>

      
</div>


</body>
</html>
