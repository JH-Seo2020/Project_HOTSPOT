package com.kh.hotspot.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.common.model.service.CommonSpaceSearchService;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;

@Controller
public class CommonSpaceSearchController {
	
	@Autowired
	private CommonSpaceSearchService spaceSearchService;
	
	@RequestMapping("search.hotspot")
	public String selectList(String searchWord) {
		
		// 검색결과리스트 조회
		ArrayList<SpaceInfo> list = spaceSearchService.selectList(searchWord);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		return "common/spaceSearchresultList";
	}

}
