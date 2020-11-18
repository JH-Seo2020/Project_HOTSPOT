package com.kh.hotspot.admin.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.notice.model.service.NoticeService;
import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	
	@RequestMapping("list.no")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pi", pi);
		return "admin/notice/noticeList";
	}
	@RequestMapping("detail.no")
	public String selectNotice(int nno, Model model) {
		
		Notice n = nService.selectNotice(nno);
		
		model.addAttribute("n", n);
		
		return "admin/notice/noticeDetail";
		
	}
}
