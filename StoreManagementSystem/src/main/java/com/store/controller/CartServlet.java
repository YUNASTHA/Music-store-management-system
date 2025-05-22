package com.store.controller;

import com.store.dao.CartItemDAO;
import com.store.model.CartItem;
import com.store.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GET: Display cart page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null) {
            response.sendRedirect("login.jsp?message=Please login first");
            return;
        }

        int userId = currentUser.getUserId();

        CartItemDAO cartItemDAO = new CartItemDAO();
        List<CartItem> cartItems = null;

        try {
            cartItems = cartItemDAO.getCartItemsByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("cartItems", cartItems);

        // Retrieve and clear flash message
        String message = (String) session.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
        }

        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }

    // POST: Add to cart
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null) {
            response.sendRedirect("login.jsp?message=Please login first");
            return;
        }

        int userId = currentUser.getUserId();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1;

        try {
            if (request.getParameter("quantity") != null) {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
        } catch (NumberFormatException e) {
            // default to 1
        }

        CartItemDAO cartItemDAO = new CartItemDAO();
        boolean success = false;

        try {
            success = cartItemDAO.addToCart(userId, productId, quantity);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (success) {
            session.setAttribute("message", "Product added to cart.");
        } else {
            session.setAttribute("message", "Failed to add product to cart.");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
