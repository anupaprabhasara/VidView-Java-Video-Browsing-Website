package com.vidview.service;

import com.vidview.model.Comment;
import com.vidview.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentService {

    // Create Comment
    public boolean createComment(Comment comment) {
        String query = "INSERT INTO comments (video_id, user_id, content) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, comment.getVideoId());
            stmt.setInt(2, comment.getUserId());
            stmt.setString(3, comment.getContent());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Comment by ID
    public Comment getComment(int id) {
        String query = "SELECT * FROM comments WHERE comment_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setVideoId(rs.getInt("video_id"));
                comment.setUserId(rs.getInt("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setCommentedAt(rs.getString("commented_at"));
                return comment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Comments
    public List<Comment> getAllComments() {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM comments ORDER BY commented_at DESC";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_id"));
                comment.setVideoId(rs.getInt("video_id"));
                comment.setUserId(rs.getInt("user_id"));
                comment.setContent(rs.getString("content"));
                comment.setCommentedAt(rs.getString("commented_at"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    // Update Comment
    public boolean updateComment(Comment comment) {
        String query = "UPDATE comments SET content = ? WHERE comment_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, comment.getContent());
            stmt.setInt(2, comment.getCommentId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Comment
    public boolean deleteComment(int id) {
        String query = "DELETE FROM comments WHERE comment_id = ?";
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