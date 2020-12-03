package com.kh.hotspot.admin.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.chat.model.dao.ChatBotDao;
import com.kh.hotspot.admin.chat.model.vo.ChatBot;

@Service
public class ChatBotServiceImpl implements ChatBotService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChatBotDao cDao;
	
	@Override
	public ArrayList<ChatBot> selectList() {
		
		return  cDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<ChatBot> chatList(String message) {

		return cDao.chatList(sqlSession, message);
	}

}
