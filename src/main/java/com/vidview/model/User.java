package com.vidview.model;

public class User {
	private int userId;
    private String fullName;
    private String email;
    private String password;
    private String createdAt;
    
	public int getUserId() {
		return userId;
	}
	public String getFullName() {
		return fullName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}