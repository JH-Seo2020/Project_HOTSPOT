package com.kh.hotspot.admin.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hotspot.admin.chat.model.service.ChatBotService;
import com.kh.hotspot.admin.chat.model.vo.ChatBot;

@Controller
public class ChatBotController {
	
	@Autowired
	private ChatBotService cService;
	
	@RequestMapping("chat.ad")
	public String selectList(Model model) {
		
		ArrayList<ChatBot> list = cService.selectList();
		
		model.addAttribute("list", list);
		return "admin/chat/chatbot";
	}
	@ResponseBody
	@RequestMapping(value="list.cad", produces="application/json; charset=utf-8")
	public String chatList(String message) {
		
		ArrayList<ChatBot> list = cService.chatList(message);
		
		return new Gson().toJson(list);
	}
}
