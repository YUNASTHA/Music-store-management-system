package com.store.controller;



import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.store.dao.ProductDAO;
import com.store.model.Product;

import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(name = "/ProductServlet", urlPatterns = {"/product"})

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static final List<Product> Product = null;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO productdao = new ProductDAO();
		
		List<Product> products = productdao.getAllProducts(); 
		for(Product p: products) {
			System.out.println(p.getName());
			System.out.println(p.getImage());
		}
		System.out.println(products);
		request.setAttribute("productList", products);
		
		
        request.getRequestDispatcher("views/product_list.jsp").forward(request, response);

	}
	

	

}