package com.vidview.service;

import com.vidview.model.Video;
import com.vidview.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoService {

    // Create Video (base table only)
    public boolean createVideo(Video video) {
        String query = "INSERT INTO videos (title, description, youtube_url, uploaded_by) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, video.getTitle());
            stmt.setString(2, video.getDescription());
            stmt.setString(3, video.getYoutubeUrl());
            stmt.setInt(4, video.getUploadedBy());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Video by ID (using video_details_view)
    public Video getVideo(int id) {
        String query = "SELECT * FROM video_details_view WHERE video_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Video video = new Video();
                video.setVideoId(rs.getInt("video_id"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setYoutubeUrl(rs.getString("youtube_url"));
                video.setUploadedByName(rs.getString("uploaded_by"));
                video.setUploadedAt(rs.getString("uploaded_at"));
                video.setTotalComments(rs.getInt("total_comments"));
                return video;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Videos (using video_details_view)
    public List<Video> getAllVideos() {
        List<Video> videos = new ArrayList<>();
        String query = "SELECT * FROM video_details_view ORDER BY uploaded_at DESC";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Video video = new Video();
                video.setVideoId(rs.getInt("video_id"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setYoutubeUrl(rs.getString("youtube_url"));
                video.setUploadedByName(rs.getString("uploaded_by"));
                video.setUploadedAt(rs.getString("uploaded_at"));
                video.setTotalComments(rs.getInt("total_comments"));
                videos.add(video);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videos;
    }

    // Update Video (base table only)
    public boolean updateVideo(Video video) {
        String query = "UPDATE videos SET title = ?, description = ?, youtube_url = ? WHERE video_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, video.getTitle());
            stmt.setString(2, video.getDescription());
            stmt.setString(3, video.getYoutubeUrl());
            stmt.setInt(4, video.getVideoId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Video
    public boolean deleteVideo(int id) {
        String query = "DELETE FROM videos WHERE video_id = ?";
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