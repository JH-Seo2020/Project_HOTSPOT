package com.kh.hotspot.admin.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatBot {

	private String chatUser;	// 게스트/호스트
	private int chatStep;		// 순서
	private String chatChoice;	// 챗봇 선택지
	private String chatRequest;	// 챗봇 요청 메세지
	private String chatResponse;// 챗봇 응답 메세지
}
