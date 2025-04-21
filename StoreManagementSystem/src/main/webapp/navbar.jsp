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
        background-color: #f5ede3;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px 40px;
    }

    .logo {
        font-size: 24px;
        font-weight: 700;
        color: #4b2e2e;
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
        color: #2f2f2f;
        font-size: 17px;
        font-weight: 600;
        position: relative;
        padding-bottom: 5px;
        transition: color 0.3s ease, border-bottom 0.3s ease;
    }

    .center-links li a:hover {
        color: #a15c38;
        border-bottom: 2px solid #a15c38;
    }

    .center-links li a.active {
        color: #9c4f1c;
        border-bottom: 2px solid #9c4f1c;
    }

    .auth-links {
        display: flex;
        gap: 12px;
    }

    .auth-btn {
        text-decoration: none;
        background-color: #decab5;
        padding: 8px 16px;
        color: #2f2f2f;
        border-radius: 5px;
        font-weight: 600;
        font-size: 15px;
        transition: background-color 0.3s ease;
    }

    .auth-btn:hover {
        background-color: #c8b099;
    }
</style>

<header class="navbar">
    <h1 class="logo">Tune Cart</h1>

    <nav class="center-nav">
        <ul class="nav-links center-links">
            <li><a href="home" class="<%= request.getRequestURI().endsWith("home") ? "active" : "" %>">Home</a></li>
            <li><a href="cart.jsp" class="<%= request.getRequestURI().endsWith("cart.jsp") ? "active" : "" %>">Cart</a></li>
            <li><a href="orders.jsp" class="<%= request.getRequestURI().endsWith("orders.jsp") ? "active" : "" %>">Orders</a></li>
            <li><a href="about.jsp" class="<%= request.getRequestURI().endsWith("about.jsp") ? "active" : "" %>">About Us</a></li>
        </ul>
    </nav>

    <div class="auth-links">
        <%
            // Check if the user is logged in
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
            <!-- Display user profile if logged in -->
            <div style="display: flex; align-items: center; gap: 10px;">
			<img src=" >" alt="Profile" style="width: 30px; height: 30px; border-radius: 50%;">
                
                <span style="font-weight: 600; color: #2f2f2f;"><%= user.getFullName() %></span>
            </div>
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
