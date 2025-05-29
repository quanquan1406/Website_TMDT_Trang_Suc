
package com.project.model.DAO;

import com.project.model.User;
import com.project.DBconnection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDetailDAO {
    private Connection connection;

    public UserDetailDAO() {
        this.connection = DBConnection.getConnection();
    }

    // Get all user 
    public List<User> getAllUsers() {
    List<User> users = new ArrayList<>();
    String query = "SELECT * FROM users WHERE deleted_at IS NULL";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            users.add(new User(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("phone_number"),
                rs.getString("fullname"),
                rs.getInt("gender")
//                rs.getTimestamp("created_at"),
//                rs.getTimestamp("updated_at")
            ));
        }
    } catch (SQLException e) {
    }
    return users; // Trả về danh sách người dùng
}
       // Get user details by userId
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id = ? AND deleted_at IS NULL";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone_number"),
                        rs.getString("fullname"),
                        rs.getInt("gender")
//                        rs.getTimestamp("created_at"),
//                        rs.getTimestamp("updated_at")
                       
                );
            }
        } catch (SQLException e) {
        }
        return null; // Return null if no user found
    }

    // Update user details
    public boolean updateUser(User user) {
        String query = "UPDATE users SET email = ?, password = ?, phone_number = ?, fullname = ?, gender = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getPhone_number());
            stmt.setString(4, user.getFullname());
            stmt.setInt(5, user.getGender());
            stmt.setInt(6, user.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    // Delete user (soft delete)
    public boolean deleteUser(int userId) {
        String sql = "UPDATE users SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }
}
