package com.store.controller;



import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(name = "/ProductServlet", urlPatterns = {"/product"})

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        request.getRequestDispatcher("views/product_list.jsp").forward(request, response);

	}
	

	

}



