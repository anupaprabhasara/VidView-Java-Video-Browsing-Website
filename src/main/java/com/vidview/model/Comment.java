package com.vidview.model;

public class Comment {
	private int commentId;
    private int videoId;
    private int userId;
    private String content;
    private String commentedAt;
    
	public int getCommentId() {
		return commentId;
	}
	public int getVideoId() {
		return videoId;
	}
	public int getUserId() {
		return userId;
	}
	public String getContent() {
		return content;
	}
	public String getCommentedAt() {
		return commentedAt;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCommentedAt(String commentedAt) {
		this.commentedAt = commentedAt;
	}
}