package com.store.controller.admin;

import com.store.dao.UserDAO;
import com.store.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = {"/admin/list-users"})
public class CustomerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Check if the current user is logged in
        if (currentUser == null) {
            response.sendRedirect("/login");  // Redirect if user is not logged in
            return;
        }

     // Fetch all users with roleId = 1 from the database
        List<User> usersWithRoleId1 = UserDAO.getUsersByRoleId(2);

        // Check if there are users with roleId = 1
        if (usersWithRoleId1 != null && !usersWithRoleId1.isEmpty()) {
            request.setAttribute("users", usersWithRoleId1);
        } else {
            request.setAttribute("error", "No users with role ID 1 found.");
        }
        // Forward to the JSP for displaying the user
        request.getRequestDispatcher("/views/admin/customer-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This can be used for actions like filtering, etc.
        doGet(request, response);
    }
}
