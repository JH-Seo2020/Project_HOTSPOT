package com.kh.hotspot.guest.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hotspot.guest.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mpService;
	

}
