package com.store.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.store.dao.OrderDAO;
import com.store.model.Order;
import com.store.model.User;

@WebServlet(name = "/OrderHistoryServlet", value = "/orderhistory")
public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // Redirect to login if user not logged in
        if (user == null) {
            response.sendRedirect("login.jsp?message=Please login first");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();

        try {
            // Retrieve orders for logged-in user
            List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());

            // Populate order items for each order
            for (Order order : orders) {
                order.setOrderItems(orderDAO.getOrderItems(order.getOrderId()));
            }

            // If no orders, set a message
            if (orders.isEmpty()) {
                request.setAttribute("noOrdersMessage", "You haven't placed any orders yet.");
            }

            // Pass the orders to the JSP
            request.setAttribute("orders", orders);

        } catch (Exception e) {
            e.printStackTrace();  // Replace with proper logging in production
            request.setAttribute("errorMessage", "There was an error retrieving your orders. Please try again later.");
        }

        // Forward to JSP
        request.getRequestDispatcher("/views/order-history.jsp").forward(request, response);
    }
}
