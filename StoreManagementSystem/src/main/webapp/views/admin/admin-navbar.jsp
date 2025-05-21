<%@ page import="com.store.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 2) {
        response.sendRedirect("login.jsp?message=Unauthorized access");
        return;
    }
%>
<!-- External Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Inline Admin Styles -->
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #f8f9fa;
    }

    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #ffffff;
        position: fixed;
        padding-top: 1rem;
        box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
    }

    .sidebar a {
        display: block;
        padding: 12px 25px;
        color: #333;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .sidebar a:hover,
    .sidebar .active {
        background-color: #e2e6ea;
        color: #0d6efd;
        border-left: 4px solid #0d6efd;
    }

    .content {
        margin-left: 260px;
        padding: 2rem;
    }

    .card {
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        background-color: #fff;
        padding: 2rem;
    }

    .status-instock {
        background-color: #d1e7dd;
        color: #0f5132;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 500;
    }

    .status-lowstock {
        background-color: #fff3cd;
        color: #664d03;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 500;
    }

    .status-outofstock {
        background-color: #f8d7da;
        color: #842029;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 500;
    }

    @media (max-width: 768px) {
        .sidebar {
            display: none;
        }

        .content {
            margin-left: 0;
            padding: 1rem;
        }
    }
</style>

<!-- Sidebar -->
<div class="sidebar">
    <a href="<%= request.getContextPath() %>/admin/dashboard" >Dashboard</a>

    <a href="<%= request.getContextPath() %>/admin/product" >Products</a>
    <a href="<%= request.getContextPath() %>/admin/list-users"">Customer</a>
    <a href="<%= request.getContextPath() %>/logout" class="text-danger">Logout</a>
</div>

<!-- Top Bar -->
<div class="bg-light px-4 py-3 border-bottom" style="margin-left: 250px;">
    <h5 class="mb-0">Welcome Admin, <%= user.getFullName() %>!</h5>
</div>
