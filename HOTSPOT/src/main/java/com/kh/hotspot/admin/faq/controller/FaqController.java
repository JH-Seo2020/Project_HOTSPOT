package com.kh.hotspot.admin.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.faq.model.service.FaqService;
import com.kh.hotspot.admin.faq.model.vo.Faq;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	@RequestMapping("list.fad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, String search, String keyword) {
		
		if(keyword == null ) {
			int listCount = fService.selectListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
			ArrayList<Faq> list = fService.selectList(pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return"admin/faq/faqList";
		}else {
			SearchCondition sc = new SearchCondition();
			
			switch(search) {
			case "no" : sc.setNo(keyword); break;
			case "title" : sc.setTitle(keyword); break;
			}
			
			int listCount = fService.searchListCount(sc);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
			ArrayList<Faq> list = fService.searchList(sc, pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return"admin/faq/faqList";
		}
		
			
	}
	
}
