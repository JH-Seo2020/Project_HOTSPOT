package com.kh.hotspot.guest.voices.model.vo;

import java.sql.Clob;
import java.sql.Date;

// 어노테이션 붙이기
public class VoicesFaq {
	
	private int faqNo;			// faq번호
	private String userId;		// faq작성자
	private String faqTitle;	// 제목
	private Clob faqContent;	// 내용
	private String faqType;		// 이용후기및작성,취소및환불,기타...
	private Date faqEnrollDate;	// faq등록일

}
