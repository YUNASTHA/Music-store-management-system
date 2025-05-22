<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<%@ page import="com.store.model.User" %>

<%@ page session="true" %>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
    }

    .navbar {
        background-color: #0f1c2e; /* Dark blue-gray background */
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px 40px;
    }

    .logo {
        font-size: 24px;
        font-weight: 700;
        color: #f0f4ff; /* Light text for contrast */
    }

    .center-nav {
        flex-grow: 1;
        display: flex;
        justify-content: center;
    }

    .center-links {
        list-style: none;
        display: flex;
        gap: 30px;
    }

    .center-links li a {
        text-decoration: none;
        color: #cbd5e1; /* Light gray-blue text */
        font-size: 17px;
        font-weight: 600;
        position: relative;
        padding-bottom: 5px;
        transition: color 0.3s ease, border-bottom 0.3s ease;
    }

    .center-links li a:hover {
        color: #61a5ff;
        border-bottom: 2px solid #61a5ff;
    }

    .center-links li a.active {
        color: #3c9aff;
        border-bottom: 2px solid #3c9aff;
    }

    .auth-links {
        display: flex;
        gap: 12px;
    }

    .auth-btn {
        text-decoration: none;
        background-color: #1e3a5f;
        padding: 8px 16px;
        color: #e2e8f0;
        border-radius: 5px;
        font-weight: 600;
        font-size: 15px;
        transition: background-color 0.3s ease;
    }

    .auth-btn:hover {
        background-color: #2a4f77;
    }
</style>



<header class="navbar">
    <h1 class="logo">Tune Cart</h1>

    <nav class="center-nav">
        <ul class="nav-links center-links">
            <li><a href="home" class="<%= request.getRequestURI().endsWith("home") ? "active" : "" %>">Home</a></li>
            <li><a href="product" class="<%= request.getRequestURI().endsWith("orders.jsp") ? "active" : "" %>">Products</a></li>
            
            <li><a href="cart" class="<%= request.getRequestURI().endsWith("cart.jsp") ? "active" : "" %>">Cart</a></li>
            <li><a href="orderhistory" class="<%= request.getRequestURI().endsWith("Order.jsp") ? "active" : "" %>">Orders</a></li>
            
            <li><a href="aboutUs" class="<%= request.getRequestURI().endsWith("about.jsp") ? "active" : "" %>">About Us</a></li>
            
        </ul>
    </nav>

    <div class="auth-links">
        <%
            // Check if the user is logged in
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
            <!-- Display user full name if logged in -->
            <div style="display: flex; align-items: center; gap: 10px;">
                
                <span style="font-weight: 600; color: #ffffff;"><%= user.getFullName() %></span>
                
            </div>
                <a href="<%= request.getContextPath() %>/logout">Logout</a>
            
        <%
            } else {
        %>
            <!-- Show Login and Register button if user is not logged in -->
            <a href="login" class="auth-btn">Login</a>
            <a href="register" class="auth-btn">Register</a>
        <%
            }
        %>
    </div>
</header>
