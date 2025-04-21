<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="navbar.jsp"%>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login</title>
  <link rel="stylesheet" href="styles.css" />
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #efcdb8;
    }

    main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: calc(100vh - 70px);
    }

    .login-box {
      background-color: white;
      padding: 30px 40px;
      border-radius: 5px;
      text-align: center;
      width: 450px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    .login-box h2 {
      background-color: #40362e;
      color: white;
      margin: -30px -40px 20px -40px;
      padding: 20px;
      font-size: 24px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-top: 15px;
      text-align: left;
    }

    input[type="email"], input[type="password"] {
      width: 100%;
      padding: 10px;
      padding-right: 30px; 
      margin-top: 5px;
      border: 1px solid #ddd;
      border-radius: 5px; 
      background-color: #f7f7f7;
    }

    .password-field {
      position: relative;
      margin-top: 10px;
    }

    .password-field input {
      width: 100%;
      padding: 10px;
      padding-right: 30px; 
      margin-top: 5px;
      border: 1px solid #ddd;
      border-radius: 5px; 
      background-color: #f7f7f7;
    }

    .toggle-password {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%); /* Center the icon vertically */
      cursor: pointer;
      color: #40362e;
      font-size: 18px;
    }

    .login-btn {
      background-color: #40362e;
      color: white;
      border: none;
      padding: 12px 24px;
      font-weight: bold;
      cursor: pointer;
      border-radius: 25px;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .login-btn:hover {
      background-color: #2f2a20;
      transform: scale(1.05);
    }

    .login-btn:active {
      transform: scale(0.98);
    }

    .remember-container {
      margin-top: 15px;
      text-align: left;
    }

    .button-container {
      text-align: right;
      margin-top: 10px;
    }

    .remember {
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .register-link {
      margin-top: 20px;
      font-size: 14px;
    }

    .register-link a {
      font-weight: bold;
      color: black;
      text-decoration: underline;
    }

    .error-message {
      color: red;
      margin-top: 10px;
    }
  </style>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      const passwordInput = document.getElementById("password");
      const togglePassword = document.querySelector(".toggle-password");

      togglePassword.addEventListener("click", function() {
        // Toggle password visibility
        const type = passwordInput.type === "password" ? "text" : "password";
        passwordInput.type = type;

        // Toggle icon (eye with slash when password is visible, eye when hidden)
        togglePassword.innerHTML = type === "password" 
          ? '<i class="fas fa-eye"></i>' 
          : '<i class="fas fa-eye-slash"></i>';
      });
    });
  </script>

</head>
<body>

  <!-- Main Content -->
  <main>
    <div class="login-box">
      <h2>Login</h2>
      <form action="login" method="post">
        <label for="email">Email Address</label> 
        <input type="email" id="email" name="email" placeholder="" required />

        <label for="password">Password</label>
        <div class="password-field">
          <input type="password" id="password" name="password" required />
          <span class="toggle-password">
            <i class="fas fa-eye"></i>
          </span>
        </div>

        <div class="remember-container">
          <label class="remember">
            <input type="checkbox" name="remember" /> Remember Me
          </label>
        </div>

        <div class="button-container">
          <button type="submit" class="login-btn">Login</button>
        </div>

        <div class="register-link">
          <p>Don't have an account? <a href="register.jsp">Register</a></p>
        </div>
      </form>

      <%-- Display error message if exists --%>
      <%
      String errorMessage = (String) request.getAttribute("error");
      if (errorMessage != null) {
      %>
      <div class="error-message"><%=errorMessage%></div>
      <%
      }
      %>
    </div>
  </main>

</body>
</html>
