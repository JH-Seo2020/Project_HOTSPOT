package com.kh.hotspot.admin.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.reservation.model.service.AdminReservationService;
import com.kh.hotspot.admin.reservation.model.vo.Reservation;
import com.kh.hotspot.admin.reservation.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;

@Controller
public class AdminReservationController {

	@Autowired
	private AdminReservationService rService;
	
	@RequestMapping("list.rad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, String search ,String keyword,@RequestParam(value="head", defaultValue="전체" )String head) {
	
		if(keyword == null) { //검색x
			
			int listCount = rService.selectListCount(head);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
			
			ArrayList<Reservation> list = rService.selectList(pi, head);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("head", head);
			
			return "admin/adminReservation/reservationList";
		}else { //검색 o
			
			SearchCondition sc = new SearchCondition();
			
			switch(search) {
			case "guest" : sc.setGuest(keyword); break;
			case "host" : sc.setHost(keyword); break;
			case "reNo" : sc.setReNo(keyword); break;
			}
			
			Map map = new HashMap();
			map.put("sc", sc);
			map.put("head", head);
			int listCount =  rService.searchListCount(map);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
			
			ArrayList<Reservation> list = rService.searchList(pi, map);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("sc", sc);
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			model.addAttribute("head", head);						
			return "admin/adminReservation/reservationList";
		}
		
	}
	
	@RequestMapping("detail.rad")
	public String detailReservation(int rno, Model model) {
		
		Reservation r = rService.detailReservation(rno);
		
		model.addAttribute("r", r);
		return "admin/adminReservation/reservationDetail";
	}
	@RequestMapping("delete.rad")
	public String deleteReservation(int rno) {
		
			int result = rService.deleteReservation(rno);
			
		return "redirect:list.rad";
	}
	
}
