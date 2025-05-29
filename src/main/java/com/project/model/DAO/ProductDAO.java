/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.model.DAO;



import com.project.model.Product;
import com.project.DBconnection.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection connection;

    public ProductDAO() {
        this.connection = DBConnection.getConnection();
    }

    // Add a new product
    public void addProduct(Product product) {
    String query = "INSERT INTO products (name, image, price, sku, quantity, description,category_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, product.getName());
        ps.setString(2, product.getImage());
        ps.setInt(3, product.getPrice());
        ps.setString(4, product.getSku());
        ps.setInt(5, product.getQuantity());
        ps.setString(6, product.getDescription());
        ps.setInt(7, product.getCategoryId());
        ps.executeUpdate();
    } catch (Exception e) {
    }
}


    // Get all products
public List<Product> getAllProducts(String orderBy) {
    List<Product> products = new ArrayList<>();
    
    // Xây dựng câu lệnh SQL với phần sắp xếp
    String query = "SELECT * FROM products";
    
    // Thêm phần sắp xếp vào câu lệnh SQL dựa trên tham số orderBy
    if (orderBy != null && !orderBy.isEmpty()) {
        switch (orderBy) {
            case "price-asc":
                query += " ORDER BY price ASC";
                break;
            case "price-desc":
                query += " ORDER BY price DESC";
                break;
            case "quantity-asc":
                query += " ORDER BY quantity ASC";
                break;
            case "quantity-desc":
                query += " ORDER BY quantity DESC";
                break;
            default:
                break;
        }
    }

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setImage(rs.getString("image"));
            product.setPrice(rs.getInt("price"));
            product.setSku(rs.getString("sku"));
            product.setQuantity(rs.getInt("quantity"));
            product.setDescription(rs.getString("description"));
            product.setCategoryId(rs.getInt("category_id"));
            products.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();  // In lỗi để dễ dàng debug
    }

    return products;
}


    // Update a product
    public boolean updateProduct(Product product) {
        String query = "UPDATE products SET name = ?, image = ?, price = ?, sku = ?, quantity = ?, description = ?, category_id = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getImage());
            stmt.setInt(3, product.getPrice());
            stmt.setString(4, product.getSku());
            stmt.setInt(5, product.getQuantity());
            stmt.setString(6, product.getDescription());
            stmt.setInt(7, product.getCategoryId());
            stmt.setInt(8, product.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }
    public boolean deleteProduct(int id) {
        String query = "DELETE FROM products WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            // Log lỗi nếu cần

        }
        return false;
    }
    public Product getProductById(int productId) {
        String query = "SELECT * FROM products WHERE id = ?";
        Product product = null;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            // Kiểm tra nếu có sản phẩm
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getInt("price"));
                product.setSku(rs.getString("sku"));
                product.setQuantity(rs.getInt("quantity"));
                product.setDescription(rs.getString("description"));
                product.setCategoryId(rs.getInt("category_id"));
            }
        } catch (SQLException e) {
        }

        return product;
    }
}
