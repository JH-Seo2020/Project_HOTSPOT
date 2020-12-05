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
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.voices.model.vo.VoicesInquiry;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;

	
	@RequestMapping("myReserv.re")
	public String selectReservList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, HttpSession session) { // 페이지 기본값을 1로지정
		
		
		Member loginUser = (Member)session.getAttribute("loginUser"); // 로그인한 Member객체 뽑아오기
		
		int listCount = mpService.selectReservListCount(loginUser.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		//sout + ctrl+space
		
		ArrayList<Reservation> list = mpService.selectReservList(pi, loginUser.getUserId());
		
		model.addAttribute("pi", pi);
		session.setAttribute("list", list);
		
		return "guest/myPage/reservationListView";

	}
	
	@RequestMapping("align.re")
	public String alignReservList(String align, HttpSession session, Model model) {
		
		//session.setAttribute("align", align);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Reservation> list = mpService.alignReservList(align, loginUser.getUserId());
		
		model.addAttribute("list", list);
		
		return "guest/myPage/reservationListView";
		
		
	}

	
	@RequestMapping("reservDetail.re")
	public String selectDetailReserv(int reservNo, HttpSession session, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Reservation r = mpService.selectDetailReserv(reservNo, loginUser.getUserId());
		
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
		
		Reservation reserv = (Reservation)session.getAttribute("r"); // 위에 session담긴 예약정보 갖고오기
		System.out.println(reserv);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "신고가 접수되었습니다!");
			return "redirect:reservDetail.re?reservNo=" + reserv.getReservNo();
			
		}else {
			
			model.addAttribute("errorMsg", "신고접수에 실패하셨습니다.");
			return "common/errorPage";
			
		}
		
	}
	
	// 나의 예약리스트 끝
	
	
	/**
	 * 이용후기 시작
	 * 
	 * 이용후기 리스트 조회 서비스
	 */
	@RequestMapping("myReview.mg")
	public String selectMyReviewList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int listCount = mpService.selectMyReviewListCount(loginUser.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);

		ArrayList<Review> rvList = mpService.selectMyReviewList(pi, loginUser.getUserId());
		
		model.addAttribute("pi", pi);
		session.setAttribute("rvList", rvList);
		
		return "guest/myPage/reviewListView";
	}

	
	@RequestMapping("enrollFormReview.mg")
	public String selectEnrollFormReview(HttpSession session, Model model) {

		Reservation rv = (Reservation)session.getAttribute("list");
		System.out.println(rv);
		
		Reservation r = mpService.selectEnrollFormReview(rv.getReservNo());

			
			model.addAttribute("r", r);
			return "guest/myPage/reviewEnrollForm";
			

	
		
	
		
	}
	
	
	
	@RequestMapping("insertReview.mg")
	public String insertEnrollReview() {

		
		return "guest/myPage/reviewEnrollForm";
	}
	
	
	
	
	/**
	 * Q&A시작
	 * 
	 */
	@RequestMapping("myQna.mg")
	public String selectMyQnaList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, HttpSession session, Model model) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int listCount = mpService.selectMyQnaListCount(loginUser.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		ArrayList<Qna> qnList = mpService.selectMyQnaList(pi, loginUser.getUserId());
		//qnList.getQaNo.getClass().getName();
		
		model.addAttribute("pi", pi);
		model.addAttribute("qnList", qnList);
		
		return "guest/myPage/qnaListView";
		
		
	}

	@RequestMapping("deleteQnA.mg")
	public String deleteMyQna(int qaNo, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int result = mpService.deleteMyQna(qaNo, loginUser.getUserId());
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:myQna.mg";
			
		}else {
			
			session.setAttribute("errorMsg", "게시물 삭제에 실패하셨습니다.");
			return "common/errorPage";
			
		}
	}
	
	
	
	
	/**
	 * 고객문의관리시작
	 * 
	 */
	@RequestMapping("myInquiry.mg")
	public String selectMyInquiryList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int listCount = mpService.selectMyInquiryListCount(loginUser.getUserId());
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		ArrayList<VoicesInquiry> viList = mpService.selectMyInquiryList(pi, loginUser.getUserId());
		
		model.addAttribute("pi", pi);
		model.addAttribute("viList", viList);
		
		return "guest/myPage/inquiryListView";
	}
	

	/**
	 * 찜한공간 시작
	 */ 
	@RequestMapping("myLike.lv")
	public String selectmyWishList(HttpSession session, Model model) {
		return "guest/myPage/likeView";
	}
	
}
