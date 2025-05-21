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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(CartItem cart: cartItems) {
			System.out.println("this is quantity" +cart.getQuantity());
			System.out.println("this is image" +cart.getProduct().getImage());
			System.out.println("this is product price" +cart.getProduct().getPrice());
			System.out.println("this is product name" +cart.getProduct().getName());
		}
		
		

        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }


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
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            // default quantity is 1
        }

        CartItemDAO cartItemDAO = new CartItemDAO();
        boolean success = false;
		try {
			success = cartItemDAO.addToCart(userId, productId, quantity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (success) {
            request.setAttribute("message", "Product added to cart.");
        } else {
            request.setAttribute("message", "Failed to add product to cart.");
        }

        request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
    }
}