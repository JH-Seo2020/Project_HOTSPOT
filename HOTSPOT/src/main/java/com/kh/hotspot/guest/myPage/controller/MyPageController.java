package com.kh.hotspot.guest.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;
	
	@RequestMapping("resevList.re")
	public void selectReservListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage) { // 페이지 기본값을 1로지정
		
		int listCount = mpService.selectReservListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		
	}

}
