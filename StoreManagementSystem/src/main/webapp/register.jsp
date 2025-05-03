<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Register</title>
  <link rel="stylesheet" href="styles.css" />
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

  <style>
    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background-color: #f8f9fa;
      color: #333;
    }

    main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: calc(100vh - 70px);
    }

    .register-box {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 8px;
      width: 450px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
    }

    .register-box h2 {
      background-color: #1a273b;
      color: #ffffff;
      margin: -30px -40px 20px -40px;
      padding: 20px;
      text-align: center;
      font-size: 24px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
    }

    label {
      display: block;
      font-weight: 600;
      margin-top: 15px;
      text-align: left;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f4f4f4;
      color: #333;
    }

    .register-btn {
      background-color: #1a273b;
      color: white;
      border: none;
      padding: 12px 24px;
      font-weight: bold;
      cursor: pointer;
      border-radius: 25px;
      margin-top: 20px;
      transition: background-color 0.3s ease, transform 0.2s ease;
      width: 100%;
    }

    .register-btn:hover {
      background-color: #152032;
      transform: scale(1.05);
    }

    .register-link {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .register-link a {
      font-weight: bold;
      color: #1a273b;
      text-decoration: underline;
    }

    .success-message {
      color: #2e7d32;
      background-color: #e8f5e9;
      border: 1px solid #66bb6a;
      padding: 10px;
      margin-top: 15px;
      border-radius: 4px;
      text-align: center;
      font-weight: bold;
    }

    .error-message {
      color: #d32f2f;
      background-color: #fbe9e7;
      border: 1px solid #e57373;
      padding: 10px;
      margin-top: 15px;
      border-radius: 4px;
      text-align: center;
      font-weight: bold;
    }
  </style>
</head>
<body>

<main>
  <div class="register-box">
    <h2>Register</h2>
    <form action="register" method="post" enctype="multipart/form-data">
      <label for="name">Full Name</label>
      <input type="text" id="name" name="name" required />

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required />
      
      <label for="address">Address</label>
      <input type="text" id="address" name="address" />

      <label for="phone">Phone Number</label>
      <input type="text" id="phone" name="phone" />

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required />

      <button type="submit" class="register-btn">Register</button>
    </form>

    <div class="register-link">
      <p>Already have an account? <a href="login.jsp">Login</a></p>
    </div>

    <%-- Success Message --%>
    <%
      String successMessage = (String) request.getAttribute("success");
      if (successMessage != null) {
    %>
      <div class="success-message"><%= successMessage %></div>
    <%
      }
    %>

    <%-- Error Message --%>
    <%
      String errorMessage = (String) request.getAttribute("error");
      if (errorMessage != null) {
    %>
      <div class="error-message"><%= errorMessage %></div>
    <%
      }
    %>
  </div>
</main>

</body>
</html>
