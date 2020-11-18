package com.kh.hotspot.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.admin.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	// Report 화면 진입
	@RequestMapping("reportList.ad")
	public String selectReportList() {
		return "admin/adminReportList";	
	}
	
	// Review 화면 진입
	@RequestMapping("reviewList.ad")
	public String selectReviewList() {
		return "admin/adminReviewList";
	}
}
