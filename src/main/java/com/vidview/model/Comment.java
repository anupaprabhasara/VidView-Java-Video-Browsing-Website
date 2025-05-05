package com.vidview.model;

public class Comment {
	private int commentId;
    private int videoId;
    private int userId;
    private String content;
    private String commentedAt;
    
    private String commenter; // View
    private String videoTitle; // View
    
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
	public String getCommenter() {
		return commenter;
	}
	public String getVideoTitle() {
		return videoTitle;
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
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
}