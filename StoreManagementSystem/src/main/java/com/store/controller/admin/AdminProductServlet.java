package com.store.controller.admin;

import com.store.dao.ProductDAO;
import com.store.model.Product;
import com.store.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/product"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 50      // 50MB
)
public class AdminProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null || currentUser.getRoleId() != 2) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=Unauthorized access");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            List<Product> products = productDAO.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/admin/product-list.jsp").forward(request, response);
            return;
        }

        switch (action) {
            case "add":
                request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
                break;

            case "edit":
                String editIdStr = request.getParameter("id");
                if (editIdStr != null) {
                    try {
                        int editId = Integer.parseInt(editIdStr);
                        Product product = productDAO.getProductById(editId);
                        if (product != null) {
                            request.setAttribute("product", product);
                            request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
                        } else {
                            response.sendRedirect(request.getContextPath() + "/admin/product?message=Product not found");
                        }
                    } catch (NumberFormatException e) {
                        response.sendRedirect(request.getContextPath() + "/admin/product?message=Invalid product ID");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/product");
                }
                break;

            case "delete":
                String delIdStr = request.getParameter("id");
                if (delIdStr != null) {
                    try {
                        int delId = Integer.parseInt(delIdStr);
                        boolean deleted = productDAO.deleteProduct(delId);
                        String msg = deleted ? "Product deleted successfully" : "Failed to delete product";
                        response.sendRedirect(request.getContextPath() + "/admin/product?message=" + msg);
                    } catch (NumberFormatException e) {
                        response.sendRedirect(request.getContextPath() + "/admin/product?message=Invalid product ID");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/product");
                }
                break;

            case "view":
                String viewIdStr = request.getParameter("id");
                if (viewIdStr != null) {
                    try {
                        int viewId = Integer.parseInt(viewIdStr);
                        Product product = productDAO.getProductById(viewId);
                        if (product != null) {
                            request.setAttribute("product", product);
                            request.getRequestDispatcher("/views/admin/view-product.jsp").forward(request, response);
                        } else {
                            response.sendRedirect(request.getContextPath() + "/admin/product?message=Product not found");
                        }
                    } catch (NumberFormatException e) {
                        response.sendRedirect(request.getContextPath() + "/admin/product?message=Invalid product ID");
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/product");
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/admin/product");
                break;
        }
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

        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("product_id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = 0;
        int stock = 0;
        boolean isActive = "true".equalsIgnoreCase(request.getParameter("is_active"));

        try {
            price = Double.parseDouble(request.getParameter("price"));
            stock = Integer.parseInt(request.getParameter("stock"));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Price and Stock must be valid numbers.");
            if (idStr == null || idStr.isEmpty()) {
                request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
            }
            return;
        }

        // Process uploaded image file and save to server folder
        Part imagePart = request.getPart("image");
        String imagePath = null;

        if (imagePart != null && imagePart.getSize() > 0) {
            // Get file name safely
            String fileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();

            // Define uploads directory relative to your app root (inside deployed webapp)
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save the file on disk
            String filePath = uploadPath + File.separator + fileName;
            imagePart.write(filePath);


            // Save only filename or relative path (relative to webapp root)
            imagePath = fileName;  // store filename only, or "uploads/" + fileName
            System.out.println("File uploaded to: " + filePath);

        }

        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setStock(stock);
        product.setIsActive(isActive);

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(idStr);
                product.setProductId(productId);

                if (imagePath == null) {
                    // Keep old image path if no new image uploaded
                    Product existingProduct = productDAO.getProductById(productId);
                    if (existingProduct != null) {
                        product.setImage(existingProduct.getImage());
                    }
                } else {
                    product.setImage(imagePath);
                }

                boolean success = productDAO.updateProduct(product);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/admin/product?message=Product updated successfully");
                } else {
                    request.setAttribute("message", "Failed to update product.");
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/product?message=Invalid product ID");
            }
        } else {
            // Add new product
            product.setImage(imagePath);  // can be null if no image uploaded

            boolean success = productDAO.addProduct(product);
            if (success) {
                request.setAttribute("message", "Product added successfully!");
                request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to add product.");
                request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
            }
        }
    }
}
