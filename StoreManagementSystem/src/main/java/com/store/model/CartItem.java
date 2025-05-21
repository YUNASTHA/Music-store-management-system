package com.store.model;

import java.sql.Timestamp;

public class CartItem {
    private int cartItemId;
    private Product product;
    private int quantity;
    private Timestamp addedAt;

    public int getCartItemId() { return cartItemId; }
    public void setCartItemId(int id) { this.cartItemId = id; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Timestamp getAddedAt() { return addedAt; }
    public void setAddedAt(Timestamp addedAt) { this.addedAt = addedAt; }
}