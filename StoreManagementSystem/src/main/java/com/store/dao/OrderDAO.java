package com.store.dao;

import com.store.model.Order;
import com.store.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
//import java.sql.Timestamp; 
import java.util.List;


public class OrderDAO {
	
	 public List<Order> getOrdersByUserId(int userId) throws Exception {
	        List<Order> orders = new ArrayList<>();
	        String sql = "SELECT order_id, user_id, order_date, status, total FROM orders WHERE user_id = ?";
	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setInt(1, userId);
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next()) {
	                Order order = new Order();
	                order.setOrderId(rs.getInt("order_id"));
	                order.setUserId(rs.getInt("user_id"));
	                order.setStatus(rs.getString("status"));
	                order.setTotal(rs.getFloat("total"));
	                orders.add(order);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw e;
	        }
	        return orders;
	    }
	
	 public int createOrder(Order order) throws Exception {
	        // SQL query adjusted for your 'orders' table columns: user_id, order_date, status, total
	        String sql = "INSERT INTO orders (user_id, status, total) VALUES (?, ?, ?)";
	        int orderId = -1;
	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	            pstmt.setInt(1, order.getUserId());
	            // order_date is set by DEFAULT CURRENT_TIMESTAMP in DB, so we don't set it here
	            pstmt.setString(2, order.getStatus()); // e.g., "Pending"
	            pstmt.setFloat(3, order.getTotal());

	            int affectedRows = pstmt.executeUpdate();

	            if (affectedRows > 0) {
	                try (ResultSet rs = pstmt.getGeneratedKeys()) {
	                    if (rs.next()) {
	                        orderId = rs.getInt(1);
	                    }
	                }
	            }
	        }
	        return orderId;
	    }
	 
	 public Order getOrderById(int orderId) throws Exception {
	        String sql = "SELECT order_id, user_id, order_date, status, total FROM orders WHERE order_id = ?";
	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setInt(1, orderId);
	            try (ResultSet rs = pstmt.executeQuery()) {
	                if (rs.next()) {
	                    Order order = new Order();
	                    order.setOrderId(rs.getInt("order_id"));
	                    order.setUserId(rs.getInt("user_id"));
	                    return order;
	                }
	            }
	        }
	        return null;
	    }

	 

	    public List<Order> getAllOrders() {
	        List<Order> orders = new ArrayList<>();

	        String sql = "SELECT order_id, user_id, status, total FROM orders";

	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                Order order = new Order();
	                order.setOrderId(rs.getInt("order_id"));
	                order.setUserId(rs.getInt("user_id"));
	                order.setStatus(rs.getString("status"));
	                order.setTotal(rs.getFloat("total"));

	                orders.add(order);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return orders;
	    }

	 
	 public int countOrders() {
		    int count = 0;
		    String sql = "SELECT COUNT(*) FROM orders";
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