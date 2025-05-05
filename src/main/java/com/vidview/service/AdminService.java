package com.vidview.service;

import com.vidview.model.Admin;
import com.vidview.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    // Create Admin
    public boolean createAdmin(Admin admin) {
        String query = "INSERT INTO admins (full_name, email, password) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, admin.getFullName());
            stmt.setString(2, admin.getEmail());
            stmt.setString(3, admin.getPassword());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Admin by ID
    public Admin getAdmin(int id) {
        String query = "SELECT * FROM admins WHERE admin_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setFullName(rs.getString("full_name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
                admin.setCreatedAt(rs.getString("created_at"));
                return admin;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Admins
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM admins ORDER BY admin_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setFullName(rs.getString("full_name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
                admin.setCreatedAt(rs.getString("created_at"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }

    // Update Admin
    public boolean updateAdmin(Admin admin) {
        String query = "UPDATE admins SET full_name = ?, email = ?, password = ? WHERE admin_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, admin.getFullName());
            stmt.setString(2, admin.getEmail());
            stmt.setString(3, admin.getPassword());
            stmt.setInt(4, admin.getAdminId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Admin
    public boolean deleteAdmin(int id) {
        String query = "DELETE FROM admins WHERE admin_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}