package com.store.dao;

import com.store.model.User;
import com.store.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	        e.printStackTrace(); 
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
    
    
    public boolean isEmailExists(String email) {
        boolean exists = false;
        String sql = "SELECT email FROM users WHERE email = ?";

        try (Connection conn = DBUtil.getConnection();
   	         PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                exists = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
    
    
    

   
    public List<User> getAllUsersByRoleId(int roleId) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, roleId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setAddress(rs.getString("address"));
                user.setProfilePicture(rs.getBytes("profile_picture"));
                user.setRoleId(rs.getInt("role_id"));
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
    
    
    public int countUsersByRole(int roleId) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM users WHERE role_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, roleId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    
    
    
    
    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("id"));
                    user.setFullName(rs.getString("name")); 
                    user.setEmail(rs.getString("email"));
                    user.setRoleId(rs.getInt("role_id"));
                    // Add any other necessary fields
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


}
