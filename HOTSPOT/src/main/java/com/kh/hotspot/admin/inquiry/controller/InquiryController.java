package com.kh.hotspot.admin.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.inquiry.model.service.InquiryService;
import com.kh.hotspot.admin.inquiry.model.vo.Inquiry;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;

@Controller
public class InquiryController {

	@Autowired
	InquiryService iService;
	
	@RequestMapping("list.inq")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1")int currentPage,@RequestParam(value="head", defaultValue="전체") String head, Model model) {
				
		int listCount = iService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Inquiry> list = iService.selectList(pi, head);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/inquiry/inquiryList";
	}
}
