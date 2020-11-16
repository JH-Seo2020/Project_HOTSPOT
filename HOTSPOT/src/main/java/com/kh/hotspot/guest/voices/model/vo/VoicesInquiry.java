package com.kh.hotspot.guest.voices.model.vo;

import java.sql.Clob;
import java.sql.Date;

// 어노테이션 붙이기
public class VoicesInquiry {	

	private int inquiryNo;			// 문의글번호
	private String userId;			// 문의글작성자(회원)
	private String inquiryTitle;	// 문의글 제목
	private Clob inquiryContent; 	// 문의글 내용
	private Clob inquiryReply;		// 문의글 답변
	private String replyStatus;		// 답변 유무
	private Date inquiryDate;		// 문의글작성일
	private Date replyDate;			// 문의글답변일
	private String Status;			// 기본(Y),삭제(N)
}
