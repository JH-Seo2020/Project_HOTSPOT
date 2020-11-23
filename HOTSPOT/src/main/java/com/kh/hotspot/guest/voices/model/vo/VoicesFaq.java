package com.kh.hotspot.guest.voices.model.vo;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class VoicesFaq {
	
	private int faqNo;			// faq번호
	private String userId;		// faq작성자
	private String faqTitle;	// 제목
	private Clob faqContent;	// 내용
	private String faqType;		// 이용후기및작성,취소및환불,기타...
	private Date faqEnrollDate;	// faq등록일
	private String faqCon;		//String으로 받을 faq내용

}
