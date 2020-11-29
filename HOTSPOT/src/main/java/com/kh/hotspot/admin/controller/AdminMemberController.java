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
	
	// 호스트 상태 확인
	@ResponseBody
	@RequestMapping(value="guestDetail.ad", produces="application/json; charset=utf-8")
	public String selectHostStatus(String userId) {
		
		// 호스트정보
		HostInfo hostInfo = memberService.selectHostInfo(userId);
		// 호스트상태
		String hostStatus = "";
		if(hostInfo == null) {
			// null이면 호스트신청내역없는 게스트
			hostStatus = "onlyGuest";
		}else {
			// 'Y'/'N'/'W'
			hostStatus = hostInfo.getHostStatus();
		}
		
		return new Gson().toJson(hostStatus);
	}
	
	
	// 게스트 상세화면요청
	@RequestMapping("guestInfo.ad")
	public String selectGuestDetail(String userId, Model model) {
		
		// 회원정보
		Member member = memberService.selectUserInfo(userId);
		
		model.addAttribute("member", member);
		
		return "admin/adminMember/adminGuestDetail";
	}
	
	// 호스트 신청내역있는 게스트 상세화면요청
	@RequestMapping("hostRequest.ad")
	public String selectWantHostDetail(String userId, Model model) {
		
		// 회원정보
		Member member = memberService.selectUserInfo(userId);
		// 호스트신청정보
		HostInfo hostInfo = memberService.selectHostInfo(userId);
		
		model.addAttribute("member", member);
		model.addAttribute("hostInfo", hostInfo);
		
		return "admin/adminMember/adminHostRequestDetail";
	}
	
	// 호스트 상세화면요청
	@RequestMapping("hostInfo.ad")
	public String selectHostDetail(String userId,  Model model) {
		
		// 회원정보
		Member member = memberService.selectUserInfo(userId);
		// 호스트신청정보
		HostInfo hostInfo = memberService.selectHostInfo(userId);
		
		model.addAttribute("member", member);
		model.addAttribute("hostInfo", hostInfo);
		
		return "admin/adminMember/adminHostDetail";
	}
	
	// 회원상태, 메모 저장요청
	@ResponseBody
	@RequestMapping(value="updateGuestInfo.ad", produces="application/json; charset=utf-8")
	public String updateGuestInfo(Member member) {
		return new Gson().toJson(memberService.updateGuestInfo(member));
	}
}
