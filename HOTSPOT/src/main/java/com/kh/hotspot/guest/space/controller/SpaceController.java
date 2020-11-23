package com.kh.hotspot.guest.space.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.guest.space.model.service.SpaceService;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService spaceService;
	
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
		return "common/spaceSearchresultList";
	}
	
	@RequestMapping("spaceDetail.guest")
	public String spaceDetailView(int spcNo, Model model) {
		
		return "guest/space/spaceDetailView";
	}
	
	@RequestMapping("hostHpg.guest")
	public String hostHomepageDetail() {
		return "guest/space/hostHmpView";
	}

}
