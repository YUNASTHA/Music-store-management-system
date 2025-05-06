package com.store.controller.admin;

import com.store.dao.UserDAO;
import com.store.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.IOException;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        // Check if user is logged in and is an admin (assuming roleId 2 is admin)
        if (currentUser == null || currentUser.getRoleId() != 2) {
            System.out.println("Unauthorized access attempt to /admin/dashboard");
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=You do not have permission to access admin pages");
            return;
        }

       
        request.setAttribute("currentUser", currentUser);

        // Forward to admin dashboard JSP
        request.getRequestDispatcher("/views/admin/admin-dashboard.jsp").forward(request, response);
    }
}



