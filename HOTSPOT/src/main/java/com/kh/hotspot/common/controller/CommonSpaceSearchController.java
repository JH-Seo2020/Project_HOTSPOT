package com.kh.hotspot.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.common.model.service.CommonSpaceSearchService;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Controller
public class CommonSpaceSearchController {
	
	@Autowired
	private CommonSpaceSearchService spaceSearchService;
	
	@RequestMapping("search.hotspot")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			                 String searchWord, Model model) {
		// 조회결과수
		int listCount = spaceSearchService.selectListCount(searchWord);
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 9);
		// 검색결과리스트 조회
		ArrayList<SpaceInfo> list = spaceSearchService.selectList(searchWord, pageInfo);
		
		// 각 공간별 리뷰수 조회
		for(SpaceInfo num : list) {
			num.setReviewCount(spaceSearchService.selectReviewCount(num.getSpcNo()));
		}
		// 각 공간별 위시수 조회
		for(SpaceInfo num : list) {
			num.setWishCount(spaceSearchService.selectWishCount(num.getSpcNo()));		
		}
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		
		return "common/spaceSearchresultList";
	}

}
