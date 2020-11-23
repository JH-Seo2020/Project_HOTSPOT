package com.kh.hotspot.guest.voices.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.voices.model.service.VoicesService;
import com.kh.hotspot.guest.voices.model.vo.VoicesFaq;
import com.kh.hotspot.guest.voices.model.vo.VoicesNotice;


@Controller
public class VoicesController {
	
	@Autowired
	private VoicesService vService;
	
	@RequestMapping("notice.guest")
	public String noticeForGuest(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		//1.게시글개수조회
		int listCount = vService.selectListCount();
		
		//2.페이지네이션처리(5,5)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		//3.게시글리스트조회
		ArrayList<VoicesNotice> list = vService.selectList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "guest/voices/noticeListView";
	}
	
	@RequestMapping("noticeDetail.guest")
	public String noticeDetailForGuest(int nno, Model model) {
		
		//1.조회수증가
		int result = vService.increaseCount(nno);
		
		if(result>0) {
			//2.조회성공시
			VoicesNotice vn = vService.selectNotices(nno);
			model.addAttribute("vn",vn);
			
		}else {
			//2-2.조회실패시
			model.addAttribute("errorMsg","공지사항 조회실패");
		}
		
		return "guest/voices/noticeDetailView";
		
	}
	
	@RequestMapping("faq.guest")
	public String faqForGuest(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		//1.게시글개수조회
		int listCount = vService.selectFaqListCount();
		
		//2.페이지네이션처리(5,5)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 5);
		
		//3.게시글리스트조회
		ArrayList<VoicesFaq> list = vService.selectFaqList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "guest/voices/faqListView";
	}
	
	@RequestMapping("searchNotice.guest")
	public String faqSearchForGuest(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String keyword, Model model) {
		
		//1.게시글개수조회
		int searchListCount = vService.selectSearchNoticeCount(keyword);
		
		//2.페이지네이션처리(5,5)
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount, 5, 5);
		
		//3.게시글리스트조회
		ArrayList<VoicesNotice> list = vService.selectSearchNoticeList(keyword, pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		
		return "guest/voices/noticeListView";
		
	}

}
