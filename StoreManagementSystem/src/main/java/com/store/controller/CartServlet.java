package com.store.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * Handles GET requests to view the home page.
     * Retrieves and displays recent activities across all users.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
     

        // Forward to home view
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);

    }
}