package com.store.dao;

import com.store.model.OrderItem;
import com.store.util.DBUtil; // Make sure this is the correct class for your database connection
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAO {

    /**
     * Adds an order item to the database.
     *
     * @param orderItem The OrderItem object to add.
     * @return true if the order item was added successfully, false otherwise.
     * @throws Exception 
     */
    public boolean addOrderItem(OrderItem orderItem) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean added = false;

        try {
            conn = DBUtil.getConnection(); // Get database connection
            String sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getProductId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getPrice()); // Assuming getPrice() returns a double

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                added = true;
            }

        } catch (SQLException e) {
            // Log the error
            e.printStackTrace();
            throw e; // Re-throw the exception to be handled by the caller
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                // Log the error during closing
                e.printStackTrace();
            }
        }
        return added;
    }
    
    public List<OrderItem> getOrderItemsByOrderId(int orderId) throws Exception {
        List<OrderItem> orderItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT order_item_id, order_id, product_id, quantity, price FROM order_items WHERE order_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemId(rs.getInt("order_item_id"));
                orderItem.setOrderId(rs.getInt("order_id"));
                orderItem.setProductId(rs.getInt("product_id"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setPrice(rs.getDouble("price"));
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderItems;
    }
}