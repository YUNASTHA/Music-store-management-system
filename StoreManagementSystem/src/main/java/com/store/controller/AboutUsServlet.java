package com.store.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "AboutUsServlet", urlPatterns = {"/aboutUs"})
public class AboutUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * Handles GET requests to view the home page.
     * Retrieves and displays recent activities across all users.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
     

        // Forward to home view
        request.getRequestDispatcher("/views/aboutUs.jsp").forward(request, response);

    }
}
