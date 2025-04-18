package com.store.filter;

import com.store.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AdminAuthFilter", urlPatterns = {"/admin/*"})
public class AdminAuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");

            if (user.getRoleId() == 2) {
                chain.doFilter(request, response); // Allow request
                return;
            }
        }
        
        // Not authorized, forward to home with error message
        httpRequest.setAttribute("error", "You do not have permission to access admin pages.");
        httpRequest.getRequestDispatcher("/").forward(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup logic if needed
    }
}
