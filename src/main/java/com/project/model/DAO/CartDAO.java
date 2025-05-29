
package com.project.model.DAO;



import com.project.model.Cart;
import com.project.DBconnection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private Connection connection;

    public CartDAO() {
        this.connection = DBConnection.getConnection();
    }



 public boolean addToCart(int userId, int productId, int quantity) {
    String checkProductStockQuery = "SELECT quantity FROM products WHERE id = ?";
    String checkCartItemQuery = "SELECT quantity FROM carts WHERE user_id = ? AND product_id = ?";
    String insertCartItemQuery = "INSERT INTO carts (user_id, product_id, quantity, price, total_price, status) VALUES (?, ?, ?, ?, ?, 1)";
    String updateCartItemQuery = "UPDATE carts SET quantity = quantity + ?, total_price = total_price + ? WHERE user_id = ? AND product_id = ?";
    String updateProductStockQuery = "UPDATE products SET quantity = quantity - ? WHERE id = ?";

    try (PreparedStatement checkStockStmt = connection.prepareStatement(checkProductStockQuery);
         PreparedStatement checkCartStmt = connection.prepareStatement(checkCartItemQuery);
         PreparedStatement insertCartStmt = connection.prepareStatement(insertCartItemQuery);
         PreparedStatement updateCartStmt = connection.prepareStatement(updateCartItemQuery);
         PreparedStatement updateProductStmt = connection.prepareStatement(updateProductStockQuery)) {

        // 1. Kiểm tra số lượng trong kho
        checkStockStmt.setInt(1, productId);
        ResultSet stockResult = checkStockStmt.executeQuery();
        if (stockResult.next()) {
            int availableStock = stockResult.getInt("quantity");
            if (quantity > availableStock) {
                return false; // Không đủ hàng
            }
        } else {
            return false; // Không tìm thấy sản phẩm
        }

        // 2. Kiểm tra sản phẩm đã có trong giỏ hàng chưa
        checkCartStmt.setInt(1, userId);
        checkCartStmt.setInt(2, productId);
        ResultSet cartResult = checkCartStmt.executeQuery();
        if (cartResult.next()) {
            // Sản phẩm đã có trong giỏ, cập nhật số lượng
            int existingQuantity = cartResult.getInt("quantity");

            // 2.1. Tính tổng giá
            int price = getProductPrice(productId);
            int additionalTotalPrice = quantity * price;

            updateCartStmt.setInt(1, quantity);
            updateCartStmt.setInt(2, additionalTotalPrice);
            updateCartStmt.setInt(3, userId);
            updateCartStmt.setInt(4, productId);
            updateCartStmt.executeUpdate();
        } else {
            // 2.2. Thêm sản phẩm mới vào giỏ hàng
            int price = getProductPrice(productId);
            int totalPrice = quantity * price;

            insertCartStmt.setInt(1, userId);
            insertCartStmt.setInt(2, productId);
            insertCartStmt.setInt(3, quantity);
            insertCartStmt.setInt(4, price);
            insertCartStmt.setInt(5, totalPrice);
            insertCartStmt.executeUpdate();
        }

        // 3. Cập nhật số lượng sản phẩm trong kho
        updateProductStmt.setInt(1, quantity);
        updateProductStmt.setInt(2, productId);
        updateProductStmt.executeUpdate();

        return true;
    } catch (SQLException e) {
        return false;
    }
}

private int getProductPrice(int productId) throws SQLException {
    String query = "SELECT price FROM products WHERE id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, productId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("price");
        }
    }
    return 0;
}

 // Cập nhật số lượng sản phẩm trong giỏ
public boolean updateCartItem(int userId, int productId, int quantity) {
    String query = "UPDATE carts SET quantity = ?, total_price = quantity * price WHERE user_id = ? AND product_id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, quantity);
        stmt.setInt(2, userId);
        stmt.setInt(3, productId);
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        return false;
    }
}

 // Xóa sản phẩm khỏi giỏ
public boolean removeCartItem(int userId, int productId) {
    String query = "DELETE FROM carts WHERE user_id = ? AND product_id = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, userId);
        stmt.setInt(2, productId);
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        return false;
    }
}

public boolean clearCartByUserId(int userId) {
    String query = "UPDATE carts SET status = 2 WHERE user_id = ? AND status = 1";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, userId);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0; // Trả về true nếu cập nhật thành công
    } catch (SQLException e) {
    }
    return false;
}


    // Get total price of the cart for a specific user
    public int getTotalCartPrice(int userId) {
        String sql = "SELECT SUM(total_price) AS total FROM carts WHERE user_id = ? AND deleted_at IS NULL";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
        }
        return 0;
    }
   public List<Cart> getCartByUserId(int userId) {
    List<Cart> cartItems = new ArrayList<>();
    String query = "SELECT c.id, c.product_id, p.name AS product_name, c.price, c.quantity, c.total_price, c.status, p.category_id " +
                   "FROM carts c " +
                   "JOIN products p ON c.product_id = p.id " +
                   "WHERE c.user_id = ? AND c.status = 1"; // Status 1: đang trong giỏ hàng
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Cart cart = new Cart();
            cart.setId(rs.getInt("id"));
            cart.setProductId(rs.getInt("product_id"));
            cart.setProductName(rs.getString("product_name"));
            cart.setPrice(rs.getInt("price"));
            cart.setQuantity(rs.getInt("quantity"));
            cart.setTotalPrice(rs.getInt("total_price"));
            cart.setStatus(rs.getInt("status"));
            cart.setCategoryId(rs.getInt("category_id"));  // Lấy thông tin categoryId từ bảng products
            cart.setUserId(userId);  // Thiết lập userId
            cartItems.add(cart);
        }
    } catch (SQLException e) {
        // In lỗi nếu có
        
    }
    return cartItems;
}

}
