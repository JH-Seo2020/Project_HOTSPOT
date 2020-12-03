package com.kh.hotspot.admin.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotspot.admin.chat.model.vo.ChatBot;

@Repository
public class ChatBotDao {

	public ArrayList<ChatBot> selectList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("chatbotMapper.selectList");
	}
	
	public ArrayList<ChatBot> chatList(SqlSessionTemplate sqlSession, String message){
		
		return (ArrayList)sqlSession.selectList("chatbotMapper.chatList", message);
	}
}
