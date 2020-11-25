package com.kh.hotspot.space.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.guest.myPage.model.vo.Member;


import com.kh.hotspot.space.model.service.HostSpaceService;
import com.kh.hotspot.space.model.vo.Space;
@Controller
public class HostSpaceContoller {
	
	@Autowired
	private HostSpaceService spaceService;
	
	/**
	 * @author jieun
	 * @return 공간등록페이지
	 */
	@RequestMapping("spaceEnrollForm.ho")
	public String spaceEnrollForm() {
		return "host/space/spaceEnrollForm";
	}
	
	
	/**
	 * @author jisu
	 * @return 호스트 공간정보
	 */
	@RequestMapping("space.list")
	public String spaceList(HttpSession session) {
		
		Member loginUser =(Member) session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		
		
		ArrayList<Space> spaceList = spaceService.selectSpaceList(userId);
		session.setAttribute("spaceList", spaceList);
		
		return "host/space/spaceInfoList";
	}
}
