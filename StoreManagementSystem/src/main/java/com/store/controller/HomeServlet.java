package com.store.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


/**
 * Servlet responsible for displaying the home page with recent activities.
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home", "/"})
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * Handles GET requests to view the home page.
     * Retrieves and displays recent activities across all users.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
     

        // Forward to home view
        request.getRequestDispatcher("/home.jsp").forward(request, response);

    }
}
