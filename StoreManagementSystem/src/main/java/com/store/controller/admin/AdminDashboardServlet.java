package com.store.controller.admin;

import com.store.dao.UserDAO;
import com.store.dao.ProductDAO;
import com.store.dao.OrderDAO;
import com.store.model.Order;
import com.store.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    private UserDAO userDAO;
    private ProductDAO productDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        productDAO = new ProductDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || currentUser.getRoleId() != 2) {
            System.out.println("Unauthorized access attempt to /admin/dashboard");
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=You do not have permission to access admin pages");
            return;
        }

        // Get counts
        int adminCount = userDAO.countUsersByRole(2);     // roleId 2 = admin
        int customerCount = userDAO.countUsersByRole(1);  // roleId 1 = customer
        int productCount = productDAO.countProducts();
        int orderCount = orderDAO.countOrders();
        List<Order> orders = orderDAO.getAllOrders();

     


        // Set attributes
        request.setAttribute("currentUser", currentUser);
        request.setAttribute("adminCount", adminCount);
        request.setAttribute("customerCount", customerCount);
        request.setAttribute("productCount", productCount);
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("orders", orders);



        request.getRequestDispatcher("/views/admin/admin-dashboard.jsp").forward(request, response);
    }
}
