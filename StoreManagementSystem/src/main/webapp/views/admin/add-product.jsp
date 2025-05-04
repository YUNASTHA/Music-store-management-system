<jsp:include page="admin-navbar.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 100px; /* Space to prevent overlap with navbar */
            padding: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        form input {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
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
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Product</h2>

    <!-- Display message if exists -->
    <c:if test="${not empty message}">
        <div class="message ${message == 'Product added successfully!' ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <form action="<%= request.getContextPath() %>/admin/product" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="description">Description:</label>
        <input type="text" name="description" id="description" required>

        <label for="price">Price:</label>
        <input type="text" name="price" id="price" required>

        <label for="stock">Stock:</label>
        <input type="text" name="stock" id="stock" required>

        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
