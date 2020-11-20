package com.kh.hotspot.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 Model model) {
		
		// 총 신고내역 수 조회
		int listCount = reportService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 총 신고내역 조회
		ArrayList<Report> list = reportService.selectList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "admin/adminReportList";
	}
	

}
