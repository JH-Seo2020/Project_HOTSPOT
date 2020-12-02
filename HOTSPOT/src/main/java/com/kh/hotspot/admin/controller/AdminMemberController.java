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
	
	// 상세화면 요청
	@RequestMapping("memberDetail.ad")
	public String selectDetail(String userId, Model model) {
		// 회원정보조회
		Member member = memberService.selectDetail(userId);
		// 호스트정보조회
		HostInfo hostInfo = memberService.selectHostInfo(userId);
		String hostStatus = member.getHostStatus();

		model.addAttribute("member", member);

		if(hostStatus == null || "".equals(hostStatus)) {
			// 게스트
			return "admin/adminMember/adminGuestDetail";
		}else if("W".equals(hostStatus)){
			// 호스트 신청내역있는 게스트
			model.addAttribute("hostInfo", hostInfo);
			return "admin/adminMember/adminHostRequestDetail";
		}else if("Y".equals(hostStatus)) {
			// 호스트
			model.addAttribute("hostInfo", hostInfo);
			return "admin/adminMember/adminHostDetail";
		}else {
			return "admin/adminMember/adminGuestDetail";
		}

	}
	
	// 회원상태, 메모 저장요청
	@ResponseBody
	@RequestMapping(value="updateUserInfo.ad", produces="application/json; charset=utf-8")
	public String updateUserInfo(Member member) {
		return new Gson().toJson(memberService.updateUserInfo(member));
	}
	
	// 호스트 수락요청
	@ResponseBody
	@RequestMapping(value="concent.ad", produces="application/json; charset=utf-8")
	public String concentHost(Member member) {
		
		String result = "concent";
		try {
			memberService.sendEmail(member, result);	// 수락메일 발송
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int updateResultUserType = memberService.updateUserType(member.getUserId());				// 회원유형 Host로 변경
		int updateResultHostStatus = memberService.updateHostStatus(member.getUserId(), result);	// 호스트상태 Y로 변경
		
		return new Gson().toJson(updateResultUserType + updateResultHostStatus);
	}
	
	// 호스트 거절요청
	@ResponseBody
	@RequestMapping(value="refuseHost.ad", produces="application/json; charset=utf-8")
	public String refuseHost(Member member) {
		
		String result = "refuse";
		try {
			memberService.sendEmail(member, result);	// 거절메일 발송
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new Gson().toJson(memberService.updateHostStatus(member.getUserId(), result));
	}
}
