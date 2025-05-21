package com.store.controller;

import com.store.dao.CartItemDAO;
import com.store.dao.OrderDAO;
import com.store.dao.OrderItemDAO;
//import com.store.dao.OrderItemDAO;
import com.store.dao.ProductDAO;
import com.store.model.CartItem;
import com.store.model.Order;
import com.store.model.OrderItem;
import com.store.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet({"/checkout"})
public class CheckoutServlet extends HttpServlet {
	
	
    private static final long serialVersionUID = 1L;
    private final CartItemDAO cartItemDAO = new CartItemDAO();
    private final OrderDAO orderDAO = new OrderDAO();
    private final OrderItemDAO orderItemDAO = new OrderItemDAO();
    private final ProductDAO productDAO = new ProductDAO();
//    private final OrderItemDAO orderItemDAO = new OrderItemDAO(); 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle requests to the /orders page
        response.sendRedirect("views/orderConfirmation.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("this is postmethod");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?message=Please login to checkout.");
            return;
        }

        User currentUser = (User) session.getAttribute("user");
        int userId = currentUser.getUserId();

        CartItemDAO cartItemDAO = new CartItemDAO();
//        OrderDAO orderDAO = new OrderDAO();
//        ProductDAO productDAO = new ProductDAO();

//        Connection conn = null; // Declare connection for transaction management

        try {
            List<CartItem> cartItems = cartItemDAO.getCartItemsByUserId(userId);

            if (cartItems == null || cartItems.isEmpty()) {
                session.setAttribute("errorMessage", "Your cart is empty. Please add items before checking out.");
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

          

            // --- Start Transaction ---
          

            // 1. Create the Order
            Order newOrder = new Order();
            newOrder.setUserId(userId);
            newOrder.setStatus("Pending");// Initial status
            float serverSideCalculatedTotal = 0;
            
            for (CartItem item : cartItems) {
                serverSideCalculatedTotal += (item.getProduct().getPrice() * item.getQuantity());
            }
            newOrder.setTotal(serverSideCalculatedTotal);

            int orderId = orderDAO.createOrder(newOrder);

            if (orderId == -1) {
                throw new SQLException("Failed to create order in orders table.");
            }
            newOrder.setOrderId(orderId);

            // 2. Add Order Items and Update Product Stock
            for (CartItem cartItem : cartItems) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(orderId);
                orderItem.setProductId(cartItem.getProduct().getProductId());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getProduct().getPrice());
                
                if (!orderItemDAO.addOrderItem(orderItem)) {
                    throw new SQLException("Failed to add order item for product ID: " + cartItem.getProduct().getProductId());
                }

                
            boolean cartCleared = cartItemDAO.clearCart(userId);
            if (!cartCleared && cartItems.size() > 0) {
                System.out.println("Warning: Cart not fully cleared for user " + userId + " after checkout.");
            }
            }


            // Redirect to an order confirmation page
            response.sendRedirect("views/orderConfirmation.jsp");

        }
        catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void showOrdersPage(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        System.out.println("CheckoutServlet - showOrdersPage method called");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("CheckoutServlet - User not logged in. Redirecting to login.");
            response.sendRedirect("login.jsp?message=Please login to view your orders.");
            return;
        }

        User user = (User) session.getAttribute("user");
        int userId = user.getUserId();
        try {
            // 1. Get all orders for the user
            List<Order> orders = orderDAO.getOrdersByUserId(userId); // Call the new method

            // 2. Fetch order items for each order
            for (Order order : orders) {
                List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(order.getOrderId()); //  OrderItemDAO
                order.setOrderItems(orderItems); // Attach the order items to the order object.
            }

            // 3. Set the orders as an attribute in the request
            request.setAttribute("orders", orders);

            // 4. Forward to the orders.jsp page to display the orders
            request.getRequestDispatcher("/views/orders.jsp").forward(request, response); // Create this JSP page

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("CheckoutServlet - SQLException: " + e.getMessage());
            session.setAttribute("errorMessage", "Database error occurred while retrieving your orders.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        } catch (ServletException e) {
            e.printStackTrace();
            System.err.println("CheckoutServlet - ServletException: " + e.getMessage());
            session.setAttribute("errorMessage", "Error processing request. Please try again.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during checkout.");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("CheckoutServlet - IOException: " + e.getMessage());
            session.setAttribute("errorMessage", "Error  retrieving orders.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error during checkout.");
        }
    }
    
}