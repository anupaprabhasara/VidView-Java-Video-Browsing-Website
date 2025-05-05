package com.vidview.service;

import com.vidview.model.Report;
import com.vidview.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportService {

    // Create Report
    public boolean createReport(Report report) {
        String query = "INSERT INTO reports (video_id, user_id, reason) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, report.getVideoId());
            stmt.setInt(2, report.getUserId());
            stmt.setString(3, report.getReason());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Report by ID
    public Report getReport(int id) {
        String query = "SELECT * FROM reports WHERE report_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Report report = new Report();
                report.setReportId(rs.getInt("report_id"));
                report.setVideoId(rs.getInt("video_id"));
                report.setUserId(rs.getInt("user_id"));
                report.setReason(rs.getString("reason"));
                report.setReportedAt(rs.getString("reported_at"));
                return report;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Reports
    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        String query = "SELECT * FROM reports ORDER BY reported_at DESC";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Report report = new Report();
                report.setReportId(rs.getInt("report_id"));
                report.setVideoId(rs.getInt("video_id"));
                report.setUserId(rs.getInt("user_id"));
                report.setReason(rs.getString("reason"));
                report.setReportedAt(rs.getString("reported_at"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    // Delete Report
    public boolean deleteReport(int id) {
        String query = "DELETE FROM reports WHERE report_id = ?";
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