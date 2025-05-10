package com.store.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = "/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // don't create session if not exists

        boolean isLoggedIn = session != null && Boolean.TRUE.equals(session.getAttribute("isLoggedIn"));
        String uri = req.getRequestURI();
        String ctx = req.getContextPath();

        boolean isPublic = uri.equals(ctx + "/login") ||
                           uri.equals(ctx + "/logout") ||
                           uri.equals(ctx + "/home") ||
                           uri.equals(ctx + "/register") ||
                           uri.equals(ctx + "/product") ||
                           uri.equals(ctx + "/cart") ||
                           uri.equals(ctx + "/aboutUs") ||
                           uri.contains("/assets/") || uri.contains("/static/") ||
                           uri.matches(".*\\.(css|js|png|jpg|jpeg|gif|svg|ico)$");

        if (isLoggedIn || isPublic) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(ctx + "/login");
        }
    }
}
