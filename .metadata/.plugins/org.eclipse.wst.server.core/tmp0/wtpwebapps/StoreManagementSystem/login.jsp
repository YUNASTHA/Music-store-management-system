<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>User Login</h2>
    


    <form action="login" method="post">
        Email: <input type="email" name="email" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        
        <div class="form-group remember-me-group">
            <label class="remember-me-label">
                <input type="checkbox" id="rememberMe" name="rememberMe">
                <span class="checkmark"></span>
                <span class="remember-text">Remember me</span>
            </label>
        </div>

        <input type="submit" value="Login">
    </form>
    
    
    
    <%-- Display error message if exists --%>
    <%
        String errorMessage = (String) request.getAttribute("error");
        if (errorMessage != null) {
    %>
        <div class="error-message" style="color: red;"><%= errorMessage %></div>
    <%
        }
    %>
    
    
        <p class="form-footer">Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
    
</body>
</html>


