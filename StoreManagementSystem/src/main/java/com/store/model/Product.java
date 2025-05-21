package com.store.model;

public class Product {
	private int productId;
	private String name;
	private String description;
	private double price;
	private int stock;
	private boolean isActive;
	private String image;

	// Constructor
	public Product() {
	}

	// Getters and Setters
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(boolean active) {
		this.isActive = active;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
