package com.project.model.DAO;

import com.project.model.Category;
import com.project.DBconnection.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private Connection connection;

    public CategoryDAO() {
        this.connection = DBConnection.getConnection();
    }

    // Create a new category
    public boolean addCategory(Category category) {
        String sql = "INSERT INTO categories (name) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, category.getName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    // Get all categories
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE deleted_at IS NULL";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                categories.add(new Category(rs.getInt("id"), rs.getString("name")));
            }
        } catch (SQLException e) {
        }
        return categories;
    }

    // Update a category
    public boolean updateCategory(Category category) {
        String query = "UPDATE categories SET name = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, category.getName());
            stmt.setInt(2, category.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    // Delete a category (soft delete)
    public boolean deleteCategory(int id) {
    String query = "DELETE FROM categories WHERE id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, id);
        return stmt.executeUpdate() > 0; // Trả về true nếu có ít nhất một dòng bị xóa
    } catch (SQLException e) {
    }
    return false;
}
}   
