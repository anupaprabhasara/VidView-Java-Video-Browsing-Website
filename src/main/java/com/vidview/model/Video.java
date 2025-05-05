package com.vidview.model;

public class Video {
	private int videoId;
    private String title;
    private String description;
    private String youtubeUrl;
    private int uploadedBy;
    private String uploadedAt;
    
    private String uploadedByName; // View
    private int totalComments; // View
    
	public int getVideoId() {
		return videoId;
	}
	public String getTitle() {
		return title;
	}
	public String getDescription() {
		return description;
	}
	public String getYoutubeUrl() {
		return youtubeUrl;
	}
	public int getUploadedBy() {
		return uploadedBy;
	}
	public String getUploadedAt() {
		return uploadedAt;
	}
	public String getUploadedByName() {
		return uploadedByName;
	}
	public int getTotalComments() {
		return totalComments;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setYoutubeUrl(String youtubeUrl) {
		this.youtubeUrl = youtubeUrl;
	}
	public void setUploadedBy(int uploadedBy) {
		this.uploadedBy = uploadedBy;
	}
	public void setUploadedAt(String uploadedAt) {
		this.uploadedAt = uploadedAt;
	}
	public void setUploadedByName(String uploadedByName) {
		this.uploadedByName = uploadedByName;
	}
	public void setTotalComments(int totalComments) {
		this.totalComments = totalComments;
	}
}