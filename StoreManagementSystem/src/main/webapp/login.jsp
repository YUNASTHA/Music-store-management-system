<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login</title>
  <link rel="stylesheet" href="styles.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
  
  <style>
    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background-color: #f8f9fa; /* Off-white background */
      color: #333;
    }

    main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: calc(100vh - 70px);
    }

    .login-box {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 8px;
      text-align: center;
      width: 450px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
    }

    .login-box h2 {
      background-color: #1a273b;
      color: #ffffff;
      margin: -30px -40px 20px -40px;
      padding: 20px;
      font-size: 24px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
    }

    label {
      display: block;
      font-weight: 600;
      margin-top: 15px;
      text-align: left;
      color: #333;
    }

    input[type="email"],
    input[type="password"],
    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f4f4f4;
      color: #333;
      transition: border-color 0.3s ease;
    }

    .password-field {
      position: relative;
      margin-top: 10px;
    }

    .password-field input {
      padding-right: 35px; /* Ensures space for the eye icon */
    }

    .toggle-password {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #555;
      font-size: 18px;
    }

    .login-btn {
      background-color: #1a273b;
      color: white;
      border: none;
      padding: 12px 24px;
      font-weight: bold;
      cursor: pointer;
      border-radius: 25px;
      transition: background-color 0.3s ease, transform 0.2s ease;
      margin-top: 20px;
    }

    .login-btn:hover {
      background-color: #152032;
      transform: scale(1.05);
    }

    .login-btn:active {
      transform: scale(0.98);
    }

    .remember-container {
      margin-top: 15px;
      text-align: left;
    }

    .remember {
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 8px;
      color: #555;
    }

    .button-container {
      text-align: right;
      margin-top: 10px;
    }

    .register-link {
      margin-top: 20px;
      font-size: 14px;
    }

    .register-link a {
      font-weight: bold;
      color: #1a273b;
      text-decoration: underline;
    }

    .error-message {
      color: #d32f2f;
      margin-top: 15px;
    }

   
    .password-field input:focus {
      outline: none;
      border-color: #1a273b;
    }
  </style>
</head>
<body>

  <!-- Main Content -->
  <main>
    <div class="login-box">
      <h2>Login</h2>
      <form action="login" method="post">
        <label for="email">Email Address</label> 
        <input type="email" id="email" name="email" placeholder="" required="">

        <label for="password">Password</label>
        <div class="password-field">
          <input type="password" id="password" name="password" required="">
          <span class="toggle-password"><i class="fas fa-eye-slash"></i></span>
        </div>

        <div class="remember-container">
          <label class="remember">
            <input type="checkbox" name="remember"> Remember Me
          </label>
        </div>

        <div class="button-container">
          <button type="submit" class="login-btn">Login</button>
        </div>

        <div class="register-link">
          <p>Don't have an account? <a href="register">Register</a></p>
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

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      const passwordInput = document.getElementById("password");
      const togglePassword = document.querySelector(".toggle-password");
      const passwordField = document.querySelector(".password-field");

      togglePassword.addEventListener("click", function() {
        // Toggle password visibility
        const type = passwordInput.type === "password" ? "text" : "password";
        passwordInput.type = type;

        // Toggle icon and password visibility class
        if (type === "password") {
          togglePassword.innerHTML = '<i class="fas fa-eye-slash"></i>';
          passwordField.classList.remove('password-visible');
        } else {
          togglePassword.innerHTML = '<i class="fas fa-eye"></i>';
          passwordField.classList.add('password-visible');
        }
      });
    });
  </script>

</body>
</html>
