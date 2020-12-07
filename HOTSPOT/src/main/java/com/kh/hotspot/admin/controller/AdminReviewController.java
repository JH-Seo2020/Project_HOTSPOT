package com.kh.hotspot.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hotspot.admin.model.service.AdminReviewService;
import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;


@Controller
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService reviewService;
	
	// 후기관리 리스트 조회요청
	@RequestMapping("reviewList.ad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 Model model) {
		// 총 후기갯수 조회
		int listCount = reviewService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);

		ArrayList<Review> list = reviewService.selectList(pageInfo);

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);

		return "admin/adminReview/adminReviewList";
	}
	
	// 상세화면 요청
	@RequestMapping("reviewDetail.ad")
	public String selectDetail(int reviewNo, Model model) {
		
		// 후기상세조회
		Review review = reviewService.selectDetail(reviewNo);
		
		model.addAttribute("review", review);
		
		return "admin/adminReview/adminReviewDetail";
	}
	
	// 상태변경 요청
	@ResponseBody
	@RequestMapping(value="updateStatus.ad", produces="application/json; charset=utf-8")
	public String updateStatus(int reviewNo) {
		return new Gson().toJson(reviewService.updateStatus(reviewNo));
	}
	
}
