package com.store.controller;

import java.io.IOException;

import com.store.dao.CartItemDAO;
import com.store.model.User;



import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/updatecart")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		System.out.println("this is post mthod for update cat");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        User currentUser = (User) session.getAttribute("user");
        int userId = currentUser.getUserId();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String action = request.getParameter("action");

            CartItemDAO cartItemDAO = new CartItemDAO();
            int currentQty = cartItemDAO.getQuantity(userId, productId);
            int updatedQty = "increase".equals(action) ? currentQty + 1 : Math.max(1, currentQty - 1);

            cartItemDAO.updateQuantity(userId, productId, updatedQty);

            response.sendRedirect(request.getContextPath() + "/cart"); // Redirect to the CartServlet // adjust path if needed


        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}