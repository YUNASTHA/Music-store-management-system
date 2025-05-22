package com.store.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import com.store.dao.ProductDAO;
import com.store.model.Product;

/**
 * Servlet responsible for displaying the home page with recent activities.
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home", "/"})
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Create an instance of ProductDAO and call the method
    ProductDAO productDao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	String action = request.getParameter("action");
		String idParam = request.getParameter("id");

		if ("view".equals(action) && idParam != null) {
			// View product details
			int productId = Integer.parseInt(idParam);
			Product product = productDao.getProductById(productId);

			if (product != null) {
				request.setAttribute("product", product);
				request.getRequestDispatcher("views/product_details.jsp").forward(request, response);
			} else {
				request.setAttribute("error", "Product not found");
				response.sendRedirect("product"); // back to list
			}
		} else {
		
    	
      
        List<Product> allProducts = productDao.getAllProducts();

        // Limit the list to only the first 4 products
        List<Product> featuredProducts = allProducts.size() > 4 ? allProducts.subList(0, 4) : allProducts;

        // Set the featured products list as a request attribute
        request.setAttribute("productList", featuredProducts);

        // Forward the request to home.jsp
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }}
}
