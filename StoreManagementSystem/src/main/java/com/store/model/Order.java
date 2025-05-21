package com.store.model;

import java.util.List;

public class Order {
	private int orderId;
    private int userId;
    private String status;   
    private float total;
    private List<OrderItem> orderItems;
    
    public Order() {}
    
    public Order(int orderId, int userId, String status, float total) {
        this.orderId = orderId;
        this.userId = userId;
        this.status = status;
        this.total = total;
    }
    
    public List<OrderItem> getOrderItems() { //getter
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) { //setter
        this.orderItems = orderItems;
    }
    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotal() { 
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
}