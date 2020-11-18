package com.kh.hotspot.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.admin.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	// 리뷰관리화면 진입
	@RequestMapping("reviewList.ad")
	public String selectReviewList() {
		return "admin/adminReviewList";
	}

}
