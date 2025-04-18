package com.store.dao;

import com.store.model.User;
import com.store.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
	public boolean registerUser(User user) {
	    String sql = "INSERT INTO users (full_name, email, password, phone_number, address, profile_picture, role_id) " +
	                 "VALUES (?, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, user.getFullName());
	        stmt.setString(2, user.getEmail());
	        stmt.setString(3, user.getPassword());
	        stmt.setString(4, user.getPhoneNumber());
	        stmt.setString(5, user.getAddress());
	        stmt.setBytes(6, user.getProfilePicture());
	        stmt.setInt(7, user.getRoleId());

	        int rowsInserted = stmt.executeUpdate();
	        return rowsInserted > 0;

	    } catch (Exception e) {
	        e.printStackTrace(); // THIS is important for debugging
	        return false;
	    }
	}

    
    
    public User getUserByEmail(String email) {
        User user = null;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            var rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRoleId(rs.getInt("role_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
}
