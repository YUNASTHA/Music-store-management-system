package com.store.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.store.model.CartItem;
import com.store.model.Product;
import com.store.util.DBUtil;

public class CartItemDAO {
	
	public List<CartItem> getCartItemsByUserId(int userId) throws Exception {
	    List<CartItem> cartItems = new ArrayList<>();

	    String sql = "SELECT ci.cart_item_id, ci.quantity, ci.added_at, " +
	                 "p.product_id, p.name, p.price, p.image " +
	                 "FROM cart_items ci " +
	                 "JOIN products p ON ci.product_id = p.product_id " +
	                 "WHERE ci.user_id = ?";

	    try (Connection conn = DBUtil.getConnection();) {
	    	PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            CartItem item = new CartItem();
	            item.setCartItemId(rs.getInt("cart_item_id"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setAddedAt(rs.getTimestamp("added_at"));

	            Product product = new Product();
	            product.setProductId(rs.getInt("product_id"));
	            product.setName(rs.getString("name"));
	            product.setPrice(rs.getDouble("price"));
	            product.setImage(rs.getString("image"));

	            item.setProduct(product);
	            cartItems.add(item);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return cartItems;
	}

    

    
    public boolean addToCart(int userId, int productId, int quantity) throws Exception {
        String selectSQL = "SELECT quantity FROM cart_items WHERE user_id = ? AND product_id = ?";
        String updateSQL = "UPDATE cart_items SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
        String insertSQL = "INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();) {
            PreparedStatement psSelect = conn.prepareStatement(selectSQL);
            psSelect.setInt(1, userId);
            psSelect.setInt(2, productId);
            ResultSet rs = psSelect.executeQuery();

            if (rs.next()) {
                // Product already in cart → update quantity
                PreparedStatement psUpdate = conn.prepareStatement(updateSQL);
                psUpdate.setInt(1, quantity);
                psUpdate.setInt(2, userId);
                psUpdate.setInt(3, productId);
                return psUpdate.executeUpdate() > 0;
            } else {
                // Product not in cart → insert new
                PreparedStatement psInsert = conn.prepareStatement(insertSQL);
                psInsert.setInt(1, userId);
                psInsert.setInt(2, productId);
                psInsert.setInt(3, quantity);
                return psInsert.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
 // Method 1: Get current quantity for a cart item
    public int getQuantity(int userId, int productId) throws Exception {
        String sql = "SELECT quantity FROM cart_items WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return 0; // default if not found
    }

    // Method 2: Update quantity for a cart item
    public boolean updateQuantity(int userId, int productId, int newQuantity) throws Exception {
        String sql = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, newQuantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public boolean clearCart(int userId) throws Exception {
        String sql = "DELETE FROM cart_items WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        }
    }

}