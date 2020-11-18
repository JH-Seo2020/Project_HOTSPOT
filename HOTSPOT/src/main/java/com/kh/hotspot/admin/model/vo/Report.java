package com.kh.hotspot.admin.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private int spcNo;
	private int reviewNo;
	private String reportType1;
	private String reportType2;
	private String reportWriter;
	private String reportTarget;
	private String reportContent;
	private Date reportDate;
	private String reportStatus;
	
	public Report() {}

	public Report(int reportNo, int spcNo, int reviewNo, String reportType1, String reportType2, String reportWriter,
			String reportTarget, String reportContent, Date reportDate, String reportStatus) {
		super();
		this.reportNo = reportNo;
		this.spcNo = spcNo;
		this.reviewNo = reviewNo;
		this.reportType1 = reportType1;
		this.reportType2 = reportType2;
		this.reportWriter = reportWriter;
		this.reportTarget = reportTarget;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus = reportStatus;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getSpcNo() {
		return spcNo;
	}

	public void setSpcNo(int spcNo) {
		this.spcNo = spcNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReportType1() {
		return reportType1;
	}

	public void setReportType1(String reportType1) {
		this.reportType1 = reportType1;
	}

	public String getReportType2() {
		return reportType2;
	}

	public void setReportType2(String reportType2) {
		this.reportType2 = reportType2;
	}

	public String getReportWriter() {
		return reportWriter;
	}

	public void setReportWriter(String reportWriter) {
		this.reportWriter = reportWriter;
	}

	public String getReportTarget() {
		return reportTarget;
	}

	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", spcNo=" + spcNo + ", reviewNo=" + reviewNo + ", reportType1="
				+ reportType1 + ", reportType2=" + reportType2 + ", reportWriter=" + reportWriter + ", reportTarget="
				+ reportTarget + ", reportContent=" + reportContent + ", reportDate=" + reportDate + ", reportStatus="
				+ reportStatus + "]";
	}

}
