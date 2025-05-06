package com.store.controller.admin;

import com.store.dao.ProductDAO;
import com.store.model.Product;
import com.store.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/product"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 50      // 50MB
)
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || currentUser.getRoleId() != 2) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=Unauthorized access");
            return;
        }

        request.setAttribute("currentUser", currentUser);
        request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || currentUser.getRoleId() != 2) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=Unauthorized access");
            return;
        }

        // Get form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean isActive = "true".equalsIgnoreCase(request.getParameter("is_active"));

        // Handle image
        Part imagePart = request.getPart("image");
        String contentDisp = imagePart.getHeader("content-disposition");
        String imageFileName = "default_product.jpg"; // default name

        if (contentDisp != null && contentDisp.contains("filename=")) {
            imageFileName = contentDisp.substring(contentDisp.indexOf("filename=") + 10).replace("\"", "").trim();
        }

        String uploadPath = getServletContext().getRealPath("/images/");
        if (uploadPath == null) {
            uploadPath = System.getProperty("java.io.tmpdir"); 
        }

        Files.createDirectories(Paths.get(uploadPath)); 

        if (imagePart != null && imagePart.getSize() > 0 && !imageFileName.isEmpty()) {
            try (InputStream inputStream = imagePart.getInputStream()) {
                Files.copy(inputStream, Paths.get(uploadPath, imageFileName), StandardCopyOption.REPLACE_EXISTING);
            }
        }

        // Save product
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setIsActive(isActive);
        product.setImage("images/" + imageFileName);

        ProductDAO productDAO = new ProductDAO();
        boolean isProductAdded = productDAO.addProduct(product);

        if (isProductAdded) {
            request.setAttribute("message", "Product added successfully!");
        } else {
            request.setAttribute("message", "Failed to add product.");
        }

        request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
    }
}
