package com.kh.hotspot.admin.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatBotController {
	
	@RequestMapping("chat.ad")
	public String selectList(/* String chatUser, int chatStep, String chatChoice, String chatRequest, */ Model model) {
		
		return "admin/chat/chatbot";
	}
}
