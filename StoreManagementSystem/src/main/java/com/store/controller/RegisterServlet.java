package com.store.controller;

import com.store.dao.UserDAO;
import com.store.model.User;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "RegisterServlet", value = "/register")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get form data1
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String plainPassword = request.getParameter("password");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        
        UserDAO userDAO = new UserDAO();
        // Check if email already exists
        if (userDAO.isEmailExists(email)) {            
            request.setAttribute("error", "Email already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

       
        // Load default image as profile picture
        InputStream imageStream = getServletContext().getResourceAsStream("/default_profile.jpg");
        byte[] profilePicture = imageStream.readAllBytes();
        
        
        // Hash password
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

        // Create User object
        User user = new User(fullName, email, hashedPassword, phoneNumber, address, profilePicture, 1); // role_id = 1

        // Register user
       
        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
        	
        	request.setAttribute("success", "Registration successfull!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            
            request.setAttribute("error", "Registration Failed!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
