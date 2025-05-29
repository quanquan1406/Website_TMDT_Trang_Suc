package com.project.model.DAO;

import com.project.model.Address;
import com.project.DBconnection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {
    private Connection connection;

    public AddressDAO() {
        this.connection = DBConnection.getConnection();
    }

    // get address by user_id
    public List<Address> getAddressByUserId(int userId) {
        List<Address> addresses = new ArrayList<>();
        String query = "SELECT * FROM address WHERE user_id = ? AND deleted_at IS NULL";
        try(Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                addresses.add(new Address(
                        rs.getInt("id"),
                        rs.getString("address"),
                        rs.getInt("user_id"),
                        rs.getInt("address_default")
//                        rs.getTimestamp("created_at"),
//                        rs.getTimestamp("updated_at")
                        
                ));
            }
        } catch (SQLException e) {
        }
        return addresses;
    }

    // Add a new address for a user
    public boolean addAddress(Address address) {
        String query = "INSERT INTO address (address, user_id, address_default) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, address.getAddress());
            stmt.setInt(2, address.getUserId());
            stmt.setInt(3, address.getAddressDefault());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    // Update an existing address (for both User and Admin)
    public boolean updateAddress(Address address) {
        String query = "UPDATE address SET address = ?, address_default = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?  AND user_id = ?";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, address.getAddress());
            stmt.setInt(2, address.getAddressDefault());
            stmt.setInt(3, address.getId());
            stmt.setInt(4, address.getUserId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }
    public List<Address> getAllAddresses() {
    List<Address> addresses = new ArrayList<>();
    String query = "SELECT * FROM address WHERE deleted_at IS NULL";
    try (Connection connection = DBConnection.getConnection();
         PreparedStatement statement = connection.prepareStatement(query);
         ResultSet resultSet = statement.executeQuery()) {
        while (resultSet.next()) {
            Address address = new Address();
            address.setId(resultSet.getInt("id"));
            address.setAddress(resultSet.getString("address"));
            address.setUserId(resultSet.getInt("user_id"));
            address.setAddressDefault(resultSet.getInt("address_default"));
            addresses.add(address);
        }
    } catch (SQLException e) {
    }
    return addresses;
}


    // Delete an address (soft delete)
    public boolean deleteAddress(int addressId) {
        String sql = "UPDATE address SET deleted_at = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, addressId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    // Set an address as default
    public boolean setDefaultAddress(int userId, int addressId) {
        // Set all other addresses of the user to non-default
        String sqlUpdate = "UPDATE address SET address_default = 0 WHERE user_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sqlUpdate)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();

            // Set the specified address to default
            String sql = "UPDATE address SET address_default = 1 WHERE id = ?";
            try (PreparedStatement stmt2 = connection.prepareStatement(sql)) {
                stmt2.setInt(1, addressId);
                return stmt2.executeUpdate() > 0;
            }
        } catch (SQLException e) {
        }
        return false;
    }
    // Phương thức sắp xếp danh sách địa chỉ theo ID khách hàng
public List<Address> getSortedAddresses(String sortBy) {
    List<Address> addresses = new ArrayList<>();
    String query = "SELECT * FROM address WHERE deleted_at IS NULL";

    // Xác định thứ tự sắp xếp
    if ("user-name-asc".equals(sortBy)) {
        query += " ORDER BY user_id ASC"; // Sắp xếp theo ID khách hàng tăng dần
    }

    try (Connection connection = DBConnection.getConnection();
         PreparedStatement stmt = connection.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            addresses.add(new Address(
                rs.getInt("id"),
                rs.getString("address"),
                rs.getInt("user_id"),
                rs.getInt("address_default")
            ));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return addresses;
}

}

