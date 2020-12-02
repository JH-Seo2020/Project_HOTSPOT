package com.kh.hotspot.guest.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.model.vo.Report;
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
	public String selectDetailReserv(int reservNo, HttpSession session, Model model) {

		Member m = (Member)session.getAttribute("loginUser");
		
		Reservation r = mpService.selectDetailReserv(reservNo, m.getUserId());
		
		session.setAttribute("r", r);
		
		return "guest/myPage/reservationDetailView";


	}
	
	@RequestMapping("reservDelete.re")
	public String deleteReserv(int reservNo, HttpSession session, Model model) {
		
		int result = mpService.deleteReserv(reservNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 예약이 취소되었습니다");
			return "redirect:reservDetail.re?reservNo="+ reservNo;
			
		}else {
			
			model.addAttribute("errorMsg", "예약취소에 실패하셨습니다");
			return "common/errorPage";
			
		}
		
		
	}
	
	@RequestMapping("reservReport.re")
	public String reportReserv(Report rp, HttpSession session, Model model) {
	
		int result = mpService.reportReserv(rp);
		
		Reservation rv = (Reservation)session.getAttribute("r");
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "신고가 접수되었습니다!");
			return "redirect:reservDetail.re?reservNo=" + rv.getReservNo();
			
		}else {
			
			model.addAttribute("errorMsg", "신고접수에 실패하셨습니다.");
			return "common/errorPage";
			
		}
		
	}
	
	// 나의 예약리스트 끝
	
	
	/**
	 * 이용후기 시작
	 * 
	 */
	@RequestMapping("myReview.mg")
	public String selectmyManageList(HttpSession session, Model model) {
		return "guest/myPage/reviewListView";
	}

	
	
	/**
	 * Q&A시작
	 * 
	 */
	@RequestMapping("myQna.mg")
	public String selectmyQnaList(HttpSession session, Model model) {
		return "guest/myPage/qnaListView";
	}
	
	
	
	
	
	/**
	 * 고객문의관리시작
	 * 
	 */
	@RequestMapping("myInquiry.mg")
	public String selectmyInquiryList(HttpSession session, Model mdoel) {
		return "guest/myPage/inquiryListView";
	}
	
}
