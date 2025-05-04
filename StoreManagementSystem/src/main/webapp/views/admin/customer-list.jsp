<%@ page import="com.store.model.User" %>

<html>
<head>
    <title>List of Users</title>
</head>
<body>
    <h2>Users with Role ID 1</h2>
    
    <c:if test="${not empty users}">
        <table border="1">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Role ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.address}</td>
                        <td>${user.roleId}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <c:if test="${not empty error}">
        <p>${error}</p>
    </c:if>
</body>
</html>
