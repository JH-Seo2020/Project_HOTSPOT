package com.kh.hotspot.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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
							 SpaceInfo spaceInfo, String location, Model model) {
		
		if(spaceInfo.getSpcType() == null) {
			spaceInfo.setSpcType("");
		}
		if(spaceInfo.getLocation() == null) {
			spaceInfo.setLocation("");
		}
		if(spaceInfo.getOrder() == null) {
			spaceInfo.setOrder("newEnroll");
		}

		if(spaceInfo.getSpcConvn() != null & spaceInfo.getSpcConvn() != "") {
			//String으로 담긴 편의시설 배열로 옮겨담기
			String[] spcConvnList = spaceInfo.getSpcConvn().split(",");
			// 배열에 담긴 편의시설 잘라서 각각 저장
			switch(spcConvnList.length) {
			case 5: spaceInfo.setCheckbox4(spcConvnList[4]);
			case 4: spaceInfo.setCheckbox3(spcConvnList[3]);
			case 3: spaceInfo.setCheckbox2(spcConvnList[2]);
			case 2: spaceInfo.setCheckbox1(spcConvnList[1]);
			case 1: spaceInfo.setCheckbox0(spcConvnList[0]);	break;
			}
		}
		
		// 조회결과수
		int listCount = spaceSearchService.selectListCount(spaceInfo);
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 9);
		// 검색결과리스트 조회
		ArrayList<SpaceInfo> list = spaceSearchService.selectList(spaceInfo, pageInfo);

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
		model.addAttribute("searchWord", spaceInfo.getSearchWord());
		model.addAttribute("spcType", spaceInfo.getSpcType());
		model.addAttribute("location", spaceInfo.getLocation());
		model.addAttribute("checkbox0", spaceInfo.getCheckbox0());
		model.addAttribute("checkbox1", spaceInfo.getCheckbox1());
		model.addAttribute("checkbox2", spaceInfo.getCheckbox2());
		model.addAttribute("checkbox3", spaceInfo.getCheckbox3());
		model.addAttribute("checkbox4", spaceInfo.getCheckbox4());
		model.addAttribute("order", spaceInfo.getOrder());
		model.addAttribute("spcConvn", spaceInfo.getSpcConvn());
		
		return "common/spaceSearchresultList";
	}
	
}
