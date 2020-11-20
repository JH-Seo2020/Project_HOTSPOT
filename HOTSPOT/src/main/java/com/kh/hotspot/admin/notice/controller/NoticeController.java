package com.kh.hotspot.admin.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.admin.notice.model.service.NoticeService;
import com.kh.hotspot.admin.notice.model.vo.Notice;
import com.kh.hotspot.admin.notice.model.vo.SearchCondition;
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
		int result = nService.increaseCount(nno); 
		model.addAttribute("n", n);
		
		return "admin/notice/noticeDetail";
		
	}
	
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		
		return "admin/notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public String noticeInsert(Notice n) {
		
		int result = nService.insertNotice(n);
		
		return "redirect:detail.no?nno="+n.getNoticeNo();
	}
	@RequestMapping("deleteList.no")
	public String deleteListNotice(String[] nno) {
		
		int result = nService.deleteListNotice(nno);
		
		return "redirect:list.no";
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int nno) {
	
		int result = nService.deleteNotice(nno);
		
		return "redirect:list.no";
	}
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		
		Notice n = nService.selectNotice(nno);
		
		model.addAttribute("n", n);
		
		return "admin/notice/noticeUpdateForm";
	}
	@RequestMapping("update.no")
	public String update(Notice n) {
		
		int result = nService.updateNotice(n);
		
		return "redirect:detail.no?nno="+n.getNoticeNo();
	}
	@RequestMapping("search.no")
	public String searchNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage ,String search, String keyword, Model model) {
		
		SearchCondition sc = new SearchCondition();
		
		switch(search) {
		case "no" :sc.setNo(keyword); break;
		case "title" : sc.setTitle(keyword); break;
		}
		
		int listCount = nService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Notice> list = nService.searchList(pi, sc);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("search", search);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sc", sc);
		return "admin/notice/noticeList";
	}
	
}
