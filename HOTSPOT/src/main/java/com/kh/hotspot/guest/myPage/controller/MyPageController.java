package com.kh.hotspot.guest.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.service.MyPageService;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Reservation;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;

	
	@RequestMapping("myReserv.re")
	public String selectReservList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, HttpSession session) { // 페이지 기본값을 1로지정
		
		
		Member m = (Member)session.getAttribute("loginUser"); // 로그인한 Member객체 뽑아오기
		
		int listCount = mpService.selectReservListCount(m.getUserId());
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		//sout + ctrl+space
		
		ArrayList<Reservation> list = mpService.selectReservList(pi, m.getUserId());
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "guest/myPage/reservationListView";

	}
	
	@RequestMapping("align.re")
	public String alignReservList(String align, HttpSession session, Model model) {
		
		//session.setAttribute("align", align);
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<Reservation> list = mpService.alignReservList(align, m.getUserId());
		
		model.addAttribute("list", list);
		
		return "guest/myPage/reservationListView";
		
		
		
	}

	
	@RequestMapping("reservDetail.re")
	public ModelAndView selectDetailReserv(int reservNo, ModelAndView mv) {
		
		Reservation r = mpService.selectDetailReserv(reservNo);
		
		mv.addObject("r", r);
		mv.setViewName("guest/myPage/reservationDetailView");
		
		return mv;

	}
	
	@RequestMapping("delete.re")
	public String deleteReserv(int reservNo, HttpSession session, Model model) {
		
		int result = mpService.deleteReserv(reservNo);
		
		if(result > 0) {
			
			session.setAttribute("alert", "성공적으로 예약이 취소되었습니다");
			return "redirect:reservDetail.re";
			
		}else {
			
			model.addAttribute("errorMsg", "예약취소에 실패하셨습니다");
			return "common/errorPage";
			
		}
		
		
	}
	
}
