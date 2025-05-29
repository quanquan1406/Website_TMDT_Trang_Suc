
package com.project.model;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int cartId;  
    private int userId;
    private int addressId;
    private int totalPrice;   
    private int status;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Timestamp deletedAt;
    private String userName;
    private String userAddress;


    public Order(int id, int cartId, int userId, int addressId, int totalPrice,int status,Timestamp createdAt) {
        this.id = id;
        this.cartId = cartId;    
        this.userId = userId;
        this.addressId = addressId;
        this.totalPrice = totalPrice;   
        this.status = status;  
        this.createdAt= createdAt;
    }

    public Order() {
       
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int total_price) {
        this.totalPrice = total_price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Timestamp getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Timestamp deletedAt) {
        this.deletedAt = deletedAt;
    }
    //thêm vào
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    
}
