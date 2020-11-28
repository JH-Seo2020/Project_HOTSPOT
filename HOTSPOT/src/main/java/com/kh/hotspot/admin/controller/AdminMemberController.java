package com.kh.hotspot.admin.controller;

import java.util.ArrayList;

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
import com.kh.hotspot.host.model.vo.HostInfo;


@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService memberService;
	
	// 회원리스트 조회요청
	@RequestMapping("memberList.ad")
	public String selectList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							 Model model) {
		
		// 총 회원수 조회
		int listCount = memberService.selectListCount();
		// 페이지 정보 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		// 모든 회원리스트 조회
		ArrayList<Member> list = memberService.selectList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("list", list);
		
		return "admin/adminMember/adminMemberList";
	}
	
	@ResponseBody
	@RequestMapping(value="guestDetail.ad", produces="application/json; charset=utf-8")
	public String selectGuestDetail(String userId) {
		// 호스트 대기상태인지 확인
		HostInfo hostInfo = memberService.selectHostStatus(userId);
		String hostStatus = "";
		if(hostInfo == null) {
			hostStatus = "onlyGuest";
			System.out.println(hostStatus);
		}else {
			hostStatus = hostInfo.getHostStatus();
			System.out.println(hostStatus);
		}
		return new Gson().toJson(hostStatus);
	}
	
}
