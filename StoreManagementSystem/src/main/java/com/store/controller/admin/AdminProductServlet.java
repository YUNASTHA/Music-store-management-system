package com.store.controller.admin;

import com.store.dao.UserDAO;
import com.store.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.store.dao.ProductDAO;
import com.store.model.Product;

import java.io.IOException;

@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/product"})
public class AdminProductServlet extends HttpServlet {
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
        request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean isActive = request.getParameter("is_active") != null;

        // Create a Product object
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setIsActive(isActive);

        // Call the ProductDAO to add the product
        ProductDAO productDAO = new ProductDAO();
        boolean isProductAdded = productDAO.addProduct(product);

        // Set the result message and forward to the result page
        if (isProductAdded) {
            request.setAttribute("message", "Product added successfully!");
        } else {
            request.setAttribute("message", "Failed to add product.");
        }

        // Forward the request to a result page 
        request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
    }
    

    
}
