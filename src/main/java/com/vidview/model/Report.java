package com.vidview.model;

public class Report {
	private int reportId;
    private int videoId;
    private int userId;
    private String reason;
    private String reportedAt;
    
    private String videoTitle; // View
    private String reportedBy; // View
    
	public int getReportId() {
		return reportId;
	}
	public int getVideoId() {
		return videoId;
	}
	public int getUserId() {
		return userId;
	}
	public String getReason() {
		return reason;
	}
	public String getReportedAt() {
		return reportedAt;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public String getReportedBy() {
		return reportedBy;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setReportedAt(String reportedAt) {
		this.reportedAt = reportedAt;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public void setReportedBy(String reportedBy) {
		this.reportedBy = reportedBy;
	}
}