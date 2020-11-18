package com.kh.hotspot.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.admin.model.service.AdminReportService;


@Controller
public class AdminReportController {
	
	@Autowired
	private AdminReportService adminReportService;
	
	// 신고관리 화면 진입
	@RequestMapping("reportList.ad")
	public String selectReportList() {
		return "admin/adminReportList";	
	}
	

}
