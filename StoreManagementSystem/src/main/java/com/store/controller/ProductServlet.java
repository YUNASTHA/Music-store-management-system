package com.store.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.store.dao.ProductDAO;
import com.store.model.Product;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "/ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProductDAO productDao = new ProductDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			// Show product list
			List<Product> products = productDao.getAllProducts();
			request.setAttribute("productList", products);
			request.getRequestDispatcher("views/product_list.jsp").forward(request, response);
		}
	}
}
