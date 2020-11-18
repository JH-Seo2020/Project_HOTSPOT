package com.kh.hotspot.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hotspot.admin.model.service.AdminUserService;


@Controller
public class AdminUserController {
	
	@Autowired
	private AdminUserService adminUserService;
	
	// 회원정보화면 진입
	@RequestMapping("userList.ad")
	public String selectReportList() {
		return "admin/adminUserList";	
	}

}
