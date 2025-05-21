package com.store.dao;

import com.store.model.Product;
import com.store.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Add a new product with image path as String
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products (name, description, price, stock, is_active, image) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStock());
            stmt.setBoolean(5, product.getIsActive());
            stmt.setString(6, product.getImage());  // image path as String

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all products with image path loaded
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setIsActive(rs.getBoolean("is_active"));
                p.setImage(rs.getString("image"));  // get image path string

                products.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    // Get product by ID with image path
    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE product_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setStock(rs.getInt("stock"));
                    p.setIsActive(rs.getBoolean("is_active"));
                    p.setImage(rs.getString("image"));

                    return p;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update product with optional image path update
    public boolean updateProduct(Product product) {
        String sqlWithImage = "UPDATE products SET name=?, description=?, price=?, stock=?, is_active=?, image=? WHERE product_id=?";
        String sqlWithoutImage = "UPDATE products SET name=?, description=?, price=?, stock=?, is_active=? WHERE product_id=?";

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt;

            if (product.getImage() != null && !product.getImage().isEmpty()) {
                stmt = conn.prepareStatement(sqlWithImage);
                stmt.setString(1, product.getName());
                stmt.setString(2, product.getDescription());
                stmt.setDouble(3, product.getPrice());
                stmt.setInt(4, product.getStock());
                stmt.setBoolean(5, product.getIsActive());
                stmt.setString(6, product.getImage());
                stmt.setInt(7, product.getProductId());
            } else {
                stmt = conn.prepareStatement(sqlWithoutImage);
                stmt.setString(1, product.getName());
                stmt.setString(2, product.getDescription());
                stmt.setDouble(3, product.getPrice());
                stmt.setInt(4, product.getStock());
                stmt.setBoolean(5, product.getIsActive());
                stmt.setInt(6, product.getProductId());
            }

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete product by id
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE product_id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public int countProducts() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM products";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

}
