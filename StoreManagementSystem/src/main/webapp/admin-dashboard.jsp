<%@ page import="com.store.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 2) {
        response.sendRedirect("login.jsp?message=Unauthorized access");
        return;
    }
    
    
%>


<% if (request.getAttribute("error") != null) { %>
    <div style="color: red; font-weight: bold;">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<html>
<head><title>Admin Dashboard</title></head>
<body>
    <h2>Welcome Admin, <%= user.getFullName() %>!</h2>
    <p>This is the admin dashboard.</p>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
    
</body>
</html>
