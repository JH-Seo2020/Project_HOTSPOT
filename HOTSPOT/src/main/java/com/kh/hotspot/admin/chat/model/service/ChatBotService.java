package com.kh.hotspot.admin.chat.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hotspot.admin.chat.model.vo.ChatBot;


public interface ChatBotService {

	ArrayList<ChatBot> selectList();
	ArrayList<ChatBot> chatList(String message);
	
}
