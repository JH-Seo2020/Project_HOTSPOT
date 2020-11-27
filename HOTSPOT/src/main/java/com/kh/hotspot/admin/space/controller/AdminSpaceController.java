package com.kh.hotspot.admin.space.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.space.model.service.AdminSpaceService;
import com.kh.hotspot.admin.space.model.vo.SearchCondition;
import com.kh.hotspot.admin.space.model.vo.Space;
import com.kh.hotspot.admin.space.model.vo.SpaceImg;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;

@Controller
public class AdminSpaceController {
	
	@Autowired
	private AdminSpaceService sService;
	
	@RequestMapping("list.sad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, String search, String keyword ) {
		
		if(keyword == null) {
			
			int listCount = sService.selectListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
			ArrayList<Space> list = sService.selectList(pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "admin/adminSpace/spaceList";
		}else {
			SearchCondition sc = new SearchCondition();
			
			switch(search) {
			case "no" : sc.setNo(keyword); break;
			case "title" : sc.setTitle(keyword); break;
			case "user" : sc.setUser(keyword); break;
			}

			int listCount = sService.searchListCount(sc);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount,5 , 10);
			ArrayList<Space> list = sService.searchList(pi, sc);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			model.addAttribute("sc", sc);
			
			return "admin/adminSpace/spaceList";
		}
	}
	@RequestMapping("delete.sad")
	public String deleteSpace(String[] sno) {
		
		int result = sService.deleteSpace(sno);
		
		return "redirect:list.sad";
	}
	
	@RequestMapping("detail.sad")
	public String detailSpace(int sno, Model model) {
		
		
		Space s = sService.detailSpace(sno);
		ArrayList<Space> list = sService.selectImgList(sno);
		
		model.addAttribute("list", list);
		model.addAttribute("s", s);
		return "admin/adminSpace/spaceDetail";
	}
		
}
