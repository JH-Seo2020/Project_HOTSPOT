package com.kh.hotspot.admin.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
				
		int listCount = iService.selectListCount(head);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Inquiry> list = iService.selectList(pi, head);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("head", head);
		return "admin/inquiry/inquiryList";
	}
	@RequestMapping("detail.inq")
	public String selectInquiry(int ino, Model model ) {
		
		Inquiry i = iService.selectInquiry(ino); 
		
		model.addAttribute("i", i);
		return "admin/inquiry/inquiryDetail";
	}
	
	@RequestMapping("deleteList.inq")
	
	public String deleteList(String[] ino, HttpSession session) {
		
		int result = iService.deleteListInquiry(ino);
		session.setAttribute("alertAd", "삭제되었습니다.");
		return "redirect:list.inq";
	}
	
	@RequestMapping("delete.inq")
	public String delete(int ino, HttpSession session) {
		int result = iService.deleteInquiry(ino);
		session.setAttribute("alertAd", "삭제되었습니다.");
		return "redirect:list.inq";
	}
	
	@RequestMapping("reply.inq")
	public String insertReply(Inquiry i, HttpSession session) {
		
		
		int result = iService.insertReply(i);
		session.setAttribute("alertAd", "등록되었습니다.");
		return "redirect:detail.inq?ino="+i.getInquiryNo();
	}
//	@RequestMapping("search.inq")
//	public void searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String search, String keyword, Model model, String schead) {
//		
//		SearchCondition sc = new SearchCondition();
//		
//		switch(search) {
//			case "no" : sc.setNo(keyword); break;
//			case "title" : sc.setTitle(keyword); break;
//		}
//		Map map = new HashMap();
//		
//		map.put("head", schead);
//		map.put("search", search);
//		map.put("keyword", keyword);
//		
//		System.out.println(map);
//		
//	}
	
}
