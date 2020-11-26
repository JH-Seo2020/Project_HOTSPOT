package com.kh.hotspot.guest.myPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.service.MyPageService;
import com.kh.hotspot.guest.space.model.vo.Reservation;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;
	
	@RequestMapping("myReserv.re")
	public String selelctMyReserv() {
		
		return "guest/myPage/reservationListView";
	}
	
	@RequestMapping("resevList.re")
	public String selectReservListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) { // 페이지 기본값을 1로지정
		
		int listCount = mpService.selectReservListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		ArrayList<Reservation> list = mpService.selectReservList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "guest/myPage/reservationListView";

	}

	
	@RequestMapping("reservDetail.re")
	public String selectDetailReserv() {
		return "guest/myPage/reservationDetailView";
	}
	
}
