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
import com.kh.hotspot.admin.model.vo.AdminSearchCondition;
import com.kh.hotspot.admin.model.vo.Review;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;


@Controller
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService reviewService;
	
	AdminSearchCondition searchCondition = new AdminSearchCondition();
	
	// 후기관리 리스트 조회요청
	@RequestMapping("reviewList.ad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 AdminSearchCondition searchCondition,
							 Model model) {
		
		if(searchCondition.getStatus() == null) {
			searchCondition.setStatus("Y");
		}
		
		System.out.println("-----컨트롤러-----");
		System.out.println("searchOption : " + searchCondition.getSearchOption());
		System.out.println("searchWord : " + searchCondition.getSearchWord());
		System.out.println("status : " + searchCondition.getStatus());

		
		// 총 후기갯수 조회
		int listCount = reviewService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);

		ArrayList<Review> list = reviewService.selectList(searchCondition, pageInfo);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}

		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchCondition", searchCondition);

		return "admin/adminReview/adminReviewList";
	}

}
