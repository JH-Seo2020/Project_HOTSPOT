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
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.service.SpaceDetailService;
import com.kh.hotspot.guest.space.model.service.SpaceService;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;

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
	
	@RequestMapping("test.search")
	public String searchTest() {
		//이거 고쳐야된다 나중에 
		return "common/spaceSearchresultList";
	}
	
	@RequestMapping("spaceDetail.guest")
	public String spaceDetailView(int spcNo, Model model) {
		
		//1.공간정보
		SpaceInfo si = spaceDetailService.selectSpaceDetail(spcNo);
		
		//2.공간이미지들
		ArrayList<SpaceImages> simg = spaceDetailService.selectSpaceImages(spcNo);
		
		//3.공간유의사항들
		ArrayList<SpaceNotes> snotes = spaceDetailService.selectSpaceNotes(spcNo);
		
		//4.호스트프로필사진, 호스트닉네임.
		Member host = spaceDetailService.selectWhoIsHost(spcNo);
		
		//4.공간리뷰들
		
		//5.공간faq들
		
		model.addAttribute("si",si);
		model.addAttribute("simg",simg);
		model.addAttribute("snotes",snotes);
		model.addAttribute("host",host);
		
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
	

	/*
	@ResponseBody
	@RequestMapping(value="hostHpg.reviews", produces="application/json; charset=utf-8")
	public String hostHomepageReviews(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String userId, Model model) {

		//1.이용후기전체개수
		int listCount = spaceService.selectCountReviewForHomep(userId);
		//2.페이지네이션처리
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		//3.이용후기조회
		ArrayList<Review> rv = spaceService.selectReviewsForHomep(userId, pi);
		
		JSONObject reviews = new JSONObject();
		reviews.put("pi", pi);
		reviews.put("rv", rv);
		
		return 	new Gson().toJson(reviews);
	}*/

	

}
