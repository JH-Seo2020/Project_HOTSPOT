package com.kh.hotspot.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hotspot.admin.model.service.AdminReportService;
import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;


@Controller
public class AdminReportController {
	
	@Autowired
	private AdminReportService reportService;
	
	// 신고관리 리스트 조회 요청
	@RequestMapping("reportList.ad")
	public String selectList(@RequestParam(value="reportStatus", defaultValue="접수완료") String reportStatus,
							 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 Model model) {
		// 총 신고내역 수 조회
		int listCount = reportService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 신고리스트 조회
		ArrayList<Report> list = reportService.selectList(reportStatus, pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("reportStatus", reportStatus);
		
		return "admin/adminReportList";
	}
	
	// 신고내역 상세조회 요청
	@RequestMapping("reportDetail.ad")
	public String selectReportDetail(int reportNo, Model model) {
		
		Report report = reportService.selectReportDetail(reportNo);
		
		model.addAttribute("report", report);
		 
		 return "admin/adminReport/adminReportDetail";
		
	}
	
	// 신고상태 변경 요청
	@ResponseBody
	@RequestMapping(value="updateReportStatus.ad", produces="application/json; charset=utf-8")
	public String updateReportStatus(Model model, Report report) {
		
		int update = reportService.updateReportStatus(report);
		String result = "";
		if(update > 0) {
			result = report.getReportStatus();
		}else {
			result = "";
		}
		
		return new Gson().toJson(result);
		
	}
	

}
