package com.kh.hotspot.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hotspot.admin.model.service.AdminMemberService;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.common.template.Pagination;
import com.kh.hotspot.guest.myPage.model.vo.Member;


@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService memberService;
	
	// 회원리스트 조회요청
	@RequestMapping("memberList.ad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 Model model, HttpSession session) {
		
		// 총 회원수 조회
		int listCount = memberService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 모든 회원리스트 조회
		ArrayList<Member> list = memberService.selectList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "admin/adminMemberList";
	}
	
	// 검색결과 조회요청
	@RequestMapping("memberSearchresult.ad")
	public String selectMemberSearchresult(String searchType, String searchText,
										   @RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 							   Model model) {		
		// 총 회원수 조회
		int listCount = memberService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 모든 회원리스트 조회
		ArrayList<Member> list = memberService.selectMemberSearchresult(searchType, searchText, pageInfo);
	
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "admin/adminMemberList";
		
	}
	
	// 선택한 회원상태('N'인경우)로 우선정렬요청
	@ResponseBody
	@RequestMapping(value="memberStatusSearList.ad", produces="application/json; charset=utf-8")
	public String selectStatusSearchList(String userStatus,
									     @RequestParam(value="currentPage", defaultValue="1") int currentPage,
									     Model model) {
		// 총 회원수 조회
		int listCount = memberService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 모든 회원리스트 조회
		ArrayList<Member> list = memberService.selectStatusSearchList(userStatus, pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);

		return new Gson().toJson(list);
	}

}
