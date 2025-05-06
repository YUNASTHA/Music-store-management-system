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
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = {"/admin/list-users"})
public class CustomerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Redirect to login if not logged in
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserDAO userDAO = new UserDAO();
        List<User> usersWithRoleId1 = userDAO.getAllUsersByRoleId(1); // role_id = 1

        // Debug output (optional)
        if (usersWithRoleId1 != null && !usersWithRoleId1.isEmpty()) {
            request.setAttribute("users", usersWithRoleId1);
        } else {
            System.out.println("No users with role ID 1 found.");
            request.setAttribute("error", "No users with role ID 1 found.");
        }

        request.getRequestDispatcher("/views/admin/customer-list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This can be used for actions like filtering, etc.
        doGet(request, response);
    }
}
