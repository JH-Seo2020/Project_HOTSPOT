package com.kh.hotspot.admin.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
			model.addAttribute("sc", sc);
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			
			return"admin/faq/faqList";
		}
	
	}
	
	@RequestMapping("detail.fad")
	public String detailFaq(int fno, Model model) {
		
		Faq f = fService.selectFaq(fno);
		
		model.addAttribute("f", f);
		return "admin/faq/faqDetail";
	}
	@RequestMapping("delete.fad")
	public String deleteFaq(String[] fno, HttpSession session) {
		
		int result = fService.deleteFaq(fno);
		session.setAttribute("alertAd", "삭제되었습니다");
		return "redirect:list.fad";
	}
	@RequestMapping("enrollForm.fad")
	public String faqEnrollForm() {
		
		return "admin/faq/faqEnrollForm";
	}
	
	@RequestMapping("insert.fad")
	public String insertFaq(Faq f, HttpSession session) {
		
		int result = fService.insertFaq(f);
		int count = fService.selectListCount();
		session.setAttribute("alertAd", "등록되었습니다.");
		return "redirect:detail.fad?fno=" + count;
	}
	
	@RequestMapping("updateForm.fad")
	public String updateForm(int fno, Model model) {
		
		Faq f = fService.selectFaq(fno);
		
		model.addAttribute("f", f);
		
		return "admin/faq/faqUpdateForm";
	}
	@RequestMapping("update.fad")
	public String update(Faq f, HttpSession session) {
		
		int result = fService.updateFaq(f);
		
		session.setAttribute("alertAd", "수정되었습니다.");
		return "redirect:detail.fad?fno=" + f.getFaqNo();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
