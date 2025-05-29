package com.project.model.DAO;

import com.project.DBconnection.DBConnection;
import com.project.model.User;
import java.sql.*;

public class UserDAO {
    private  Connection conn;

    public UserDAO(Connection par) {
        this.conn=DBConnection.getConnection();  
    }

    // Phương thức để đăng ký người dùng mới
    public boolean registerUser(User user) {
            if (conn == null) {
        System.out.println("Kết nối cơ sở dữ liệu chưa được khởi tạo!");
        return false; // Hoặc có thể ném ngoại lệ
    }

        String query = "INSERT INTO users (email, password, phone_number, fullname, gender) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getPhone_number());
            ps.setString(4, user.getFullname());
            ps.setInt(5, user.getGender());

            int result = ps.executeUpdate();
            return result > 0;  // Trả về true nếu đăng ký thành công
        } catch (SQLException e) {
        }
        return false;
    }

    // Phương thức để đăng nhập người dùng
    public User loginUser(String email, String password) {
        
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFullname(rs.getString("fullname"));
                return user;  // Trả về thông tin người dùng nếu tìm thấy
            }
        } catch (SQLException e) {
        }
        return null;  // Trả về null nếu không tìm thấy người dùng
    }
}
