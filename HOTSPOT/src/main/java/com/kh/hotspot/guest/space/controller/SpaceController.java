package com.kh.hotspot.guest.space.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.myPage.model.vo.Wish;
import com.kh.hotspot.guest.space.model.service.SpaceDetailService;
import com.kh.hotspot.guest.space.model.service.SpaceService;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;
import com.kh.hotspot.host.model.vo.HostInfo;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService spaceService;
	@Autowired
	private SpaceDetailService spaceDetailService;
	
	@RequestMapping("/")
	public String index(Model model) {
		
		//1.오늘의공간 3개
		ArrayList<SpaceInfo> todayList = spaceService.selectTodaySpace();
		model.addAttribute("todayList",todayList);
		
		//2.이용자후기 9개
		ArrayList<SpaceInfo> reviewList = spaceService.selectUserReview();
		model.addAttribute("reviewList",reviewList);
		
		return "main";
	}
	
	@RequestMapping("spaceDetail.guest")
	public String spaceDetailView(@RequestParam(value="currentPage", defaultValue="1") int currentPage, int spcNo, Model model) {
		
		//1.공간정보
		SpaceInfo si = spaceDetailService.selectSpaceDetail(spcNo);
		
		//2.공간이미지들
		ArrayList<SpaceImages> simg = spaceDetailService.selectSpaceImages(spcNo);
		
		//3.공간유의사항들
		ArrayList<SpaceNotes> snotes = spaceDetailService.selectSpaceNotes(spcNo);
		
		//4.호스트프로필사진, 호스트닉네임.
		Member host = spaceDetailService.selectWhoIsHost(spcNo);
		
		//4-1.공간리뷰 게시글 개수 조회
		int listCount = spaceDetailService.selectReviewListCount(spcNo);
		
		//4-2.페이지네이션처리(5,5)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		//4-3.공간리뷰 전부조회
		ArrayList<Review> userReviews = spaceDetailService.selectUserReviewDetail(spcNo, pi);
		
		model.addAttribute("si",si);
		model.addAttribute("simg",simg);
		model.addAttribute("snotes",snotes);
		model.addAttribute("host",host);
		model.addAttribute("userReviews",userReviews);
		model.addAttribute("pi",pi);
		
		return "guest/space/spaceDetailView";
	}
	
	@RequestMapping("hostHpg.guest")
	public String hostHomepageDetail(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String userId, Model model) {
		
		//1.호스트정보(프로필사진,닉네임,한줄소개?)
		Member mm = spaceService.selectHostInfoForHomep(userId);

		//2.호스트의공간
		ArrayList<SpaceInfo> hs = spaceService.selectHostSpacesForHomep(userId);
		
		//1.이용후기전체개수
		int listCount = spaceService.selectCountReviewForHomep(userId);
		//2.페이지네이션처리
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		//3.이용후기조회
		ArrayList<Review> rv = spaceService.selectReviewsForHomep(userId, pi);
		
//		System.out.println(rv);
		
		model.addAttribute("mm",mm);
		model.addAttribute("hs",hs);
		model.addAttribute("hostUserId",userId);
		model.addAttribute("listCount",listCount);
		model.addAttribute("pi",pi);
		model.addAttribute("rv",rv);
		
		return "guest/space/hostHmpView";
	}
	
	@RequestMapping("ask.guest")
	public String askToHost(Qna qna, HttpSession session, Model model ) {
		
//		System.out.println(qna);
		
		if(qna.getQaSecret() == null) {
			qna.setQaSecret("Y");
		}
		int result = spaceDetailService.insertQuestion(qna);
		
		if(result>0) {
			session.setAttribute("alertMsg","성공적으로 질문을 등록하였습니다.");
			return "redirect:spaceDetail.guest?spcNo="+qna.getSpaceNo();
		}else {
			model.addAttribute("errorMsg","질문 등록실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("report.guest")
	public String reportFromGuest(Report report, String hostUserId, HttpSession session, Model model) {
//		System.out.println(report);
		
		int result = spaceDetailService.insertReport(report);
		
		if(result>0) {
			session.setAttribute("alertMsg","신고 완료되었습니다.");
			if(report.getSpcNo() != 0) {
				return "redirect:spaceDetail.guest?spcNo="+report.getSpcNo();
			}else if(report.getReviewNo() != 0) {
				return "redirect:hostHpg.guest?currentPage=1&userId="+hostUserId;
			}
		}else {
			model.addAttribute("errorMsg","신고 등록실패");
			return "common/errorPage";
		}
		return"";
	}
	
	@ResponseBody
	@RequestMapping(value="question.guest", produces="application/json; charset=utf-8")
	public String selectQnaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, int spcNo, Model model) {

		//1.질문답변 전체개수
		int listCount = spaceDetailService.selectQnaListCount(spcNo);
		//2.페이지네이션처리
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		//3.질문답변 전체조회
		ArrayList<Qna> qna = spaceDetailService.selectQnaDetail(spcNo, pi);
		
		JSONObject qnas = new JSONObject();
		qnas.put("pi", pi);
		qnas.put("qna", qna);
		
		return 	new Gson().toJson(qnas);
	}
	
	@ResponseBody
	@RequestMapping(value="wishIn.guest", produces="application/json; charset=utf-8")
	public int insertWishForGuest(Wish wish, Model model) {
		
		System.out.println(wish);
		
		int result = spaceDetailService.insertLike(wish);
		if(result>0) {
			return 1; 
		}else {
			return 0;
		}
		
	}

	@ResponseBody
	@RequestMapping(value="wishDelete.guest", produces="application/json; charset=utf-8")
	public int deleteWishForGuest(Wish wish, Model model) {
		
		int result = spaceDetailService.deleteLike(wish);
		if(result>0) {
			return 1; 
		}else {
			return 0;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="checkImg.guest", produces="application/json; charset=utf-8")
	public int checkWishForGuest(Wish wish, Model model) {
		
		int result = spaceDetailService.checkLike(wish);
		if(result>0) {
			return 1; 
		}else {
			return 0;
		}
		
	}
	
	@RequestMapping("reservation.guest")
	public String goToReservPage(Reservation reserv, Model model) {
//		System.out.println(reserv);
		
		//호스트정보받아오기
		HostInfo host = spaceService.hostInfo(reserv);
		
		model.addAttribute("reserv",reserv);
		model.addAttribute("host",host);
		
		return "guest/space/spaceReserv";
	}

}
