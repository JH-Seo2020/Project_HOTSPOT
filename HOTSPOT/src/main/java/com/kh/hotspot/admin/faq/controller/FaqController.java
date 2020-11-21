package com.kh.hotspot.admin.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.faq.model.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	@RequestMapping("list.fad")
	public void selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, String search, String keyword) {
		
		
		if(keyword == null ) {
	
		}else {
			System.out.println("검색있음");
		}
			
	}
	
}
