package com.project.model.DAO;

import com.project.DBconnection.DBConnection;
import com.project.model.Admin;
import java.sql.*;

public class AdminDAO {
    private Connection conn;

  public AdminDAO(java.sql.Connection conn) {
        this.conn=DBConnection.getConnection();
        }
        
    public Admin loginAdmin(String username, String password) {
        Admin admin = null;
        try {
            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement stmt = this.conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                // Cập nhật thêm các thuộc tính khác nếu cần
            }
        } catch (SQLException e) {
        }
        return admin;
    }
}
