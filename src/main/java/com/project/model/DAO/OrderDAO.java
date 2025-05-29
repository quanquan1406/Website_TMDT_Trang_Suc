/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.model.DAO;



import com.project.model.Order;
import com.project.DBconnection.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection connection;

    public OrderDAO() {
        this.connection = DBConnection.getConnection();
    }

 
    public List<Order> getOrderHistoryByUserId(int userId) {
    List<Order> orderHistory = new ArrayList<>();
    String query = "SELECT o.id, o.total_price, o.created_at, o.status, " +
                   "u.fullname AS user_name, a.address AS user_address " +
                   "FROM orders o " +
                   "JOIN users u ON o.user_id = u.id " +
                   "JOIN address a ON o.address_id = a.id " +
                   "WHERE o.user_id = ? " +
                   "ORDER BY o.created_at DESC"; // Hiển thị lịch sử theo thứ tự mới nhất
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, userId);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setTotalPrice(rs.getInt("total_price"));
                order.setCreatedAt(rs.getTimestamp("created_at"));
                order.setStatus(rs.getInt("status"));
                order.setUserName(rs.getString("user_name"));
                order.setUserAddress(rs.getString("user_address"));
                orderHistory.add(order);
            }
        }
    } catch (SQLException e) {
        // Ghi log nếu có lỗi
        
    }
    return orderHistory;
}


    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.id, o.cart_id, o.user_id, o.address_id, o.total_price, o.status, o.created_at, "
                     + "u.fullname as userName, a.address as userAddress "
                     + "FROM orders o "
                     + "JOIN users u ON o.user_id = u.id "
                     + "JOIN address a ON o.address_id = a.id";

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
                // Tạo đối tượng Order và thêm vào danh sách
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCartId(rs.getInt("cart_id"));                 
                order.setTotalPrice(rs.getInt("total_price"));
                order.setStatus(rs.getInt("status"));
                order.setCreatedAt(rs.getTimestamp("created_at"));
                order.setUserName(rs.getString("userName"));
                order.setUserAddress(rs.getString("userAddress"));
                order.setUserId(rs.getInt("user_id"));
                order.setAddressId(rs.getInt("address_id"));
                
                orders.add(order);
            }
        } catch (SQLException e) {
        }

        return orders;
    }
  
    //lưu đơn hàng 
    public boolean saveOrder(Order order) {
    String query = "INSERT INTO orders (user_id, address_id, total_price, status, created_at) VALUES (?, ?, ?, ?, NOW())";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, order.getUserId());
        stmt.setInt(2, order.getAddressId());
        stmt.setInt(3, order.getTotalPrice());
        stmt.setInt(4, order.getStatus());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        return false;
    }
}
    public boolean createOrder(Order newOrder) {
    boolean success = false;
    String query = "INSERT INTO orders (cart_id, user_id, address_id, total_price, status, created_at, updated_at) " +
                   "VALUES (?, ?, ?, ?, ?, NOW(), NOW())";
    
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        // Set các giá trị vào PreparedStatement
        stmt.setInt(1, newOrder.getCartId());
        stmt.setInt(2, newOrder.getUserId());
        stmt.setInt(3, newOrder.getAddressId());
        stmt.setInt(4, newOrder.getTotalPrice());
        stmt.setInt(5, newOrder.getStatus());

        // Thực thi câu lệnh insert
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            success = true; // Nếu chèn thành công ít nhất 1 bản ghi, trả về true
        }
    } catch (SQLException e) {
    }
    return success;
}
public boolean updateOrderStatus(int orderId, int status) {
        String query = "UPDATE orders SET status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, status);  // Trạng thái mới
            stmt.setInt(2, orderId); // ID đơn hàng cần cập nhật

            // Nếu câu lệnh update thành công ít nhất một bản ghi
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();  // Ghi log lỗi nếu có
        }
        return false;  // Trả về false nếu không cập nhật thành công
    }
public List<Order> getSortedOrders(String sortBy) {
    List<Order> orders = new ArrayList<>();
    StringBuilder query = new StringBuilder("SELECT o.id, o.cart_id, o.user_id, o.address_id, o.total_price, o.status, o.created_at, "
                     + "u.fullname as userName, a.address as userAddress "
                     + "FROM orders o "
                     + "JOIN users u ON o.user_id = u.id "
                     + "JOIN address a ON o.address_id = a.id");

    // Xử lý tham số sortBy và thêm điều kiện sắp xếp vào query
    if (sortBy != null) {
        switch (sortBy) {
            case "total-price-asc":
                query.append(" ORDER BY o.total_price ASC");
                break;
            case "total-price-desc":
                query.append(" ORDER BY o.total_price DESC");
                break;
            case "user-name-asc":
                query.append(" ORDER BY u.fullname ASC");
                break;
            case "date-desc":
                query.append(" ORDER BY o.created_at DESC");
                break;
            case "status-asc":
                query.append(" ORDER BY o.status ASC");
                break;
            default:
                // Nếu không có tiêu chí sắp xếp hợp lệ, trả về danh sách theo mặc định
                query.append(" ORDER BY o.id ASC");
                break;
        }
    } else {
        // Nếu không có tham số sắp xếp, trả về theo ID mặc định
        query.append(" ORDER BY o.id ASC");
    }

    try (PreparedStatement stmt = connection.prepareStatement(query.toString());
         ResultSet rs = stmt.executeQuery()) {
        // Tạo đối tượng Order và thêm vào danh sách
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setCartId(rs.getInt("cart_id"));
            order.setTotalPrice(rs.getInt("total_price"));
            order.setStatus(rs.getInt("status"));
            order.setCreatedAt(rs.getTimestamp("created_at"));
            order.setUserName(rs.getString("userName"));
            order.setUserAddress(rs.getString("userAddress"));
            order.setUserId(rs.getInt("user_id"));
            order.setAddressId(rs.getInt("address_id"));

            orders.add(order);
        }
    } catch (SQLException e) {
        e.printStackTrace();  // Ghi log lỗi nếu có
    }

    return orders;
    }
}