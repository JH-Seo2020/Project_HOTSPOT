package com.kh.hotspot.admin.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private int spcNo;
	private String reviewWriter;
	private String reviewTitle;
	private String reviewContent;
	private String reviewScore;
	private Date reviewDate;
	private String reviewStatus;
	private String reviewReply;
	
	public Review() {}

	public Review(int reviewNo, int spcNo, String reviewWriter, String reviewTitle, String reviewContent,
			String reviewScore, Date reviewDate, String reviewStatus, String reviewReply) {
		super();
		this.reviewNo = reviewNo;
		this.spcNo = spcNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewDate = reviewDate;
		this.reviewStatus = reviewStatus;
		this.reviewReply = reviewReply;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getSpcNo() {
		return spcNo;
	}

	public void setSpcNo(int spcNo) {
		this.spcNo = spcNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(String reviewScore) {
		this.reviewScore = reviewScore;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getReviewReply() {
		return reviewReply;
	}

	public void setReviewReply(String reviewReply) {
		this.reviewReply = reviewReply;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", spcNo=" + spcNo + ", reviewWriter=" + reviewWriter + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewScore=" + reviewScore + ", reviewDate="
				+ reviewDate + ", reviewStatus=" + reviewStatus + ", reviewReply=" + reviewReply + "]";
	}

}
