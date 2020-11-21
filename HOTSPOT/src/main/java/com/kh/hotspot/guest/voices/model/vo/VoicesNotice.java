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
public class VoicesNotice {
	
	private int noticeNo;		// 공지사항번호
	private String userId;		// 공지사항 작성자
	private String noticeTitle;	; 	// 공지사항제목
	private Clob noticeContent;	 	// 공지사항내용
	private int count;				// 조회수
	private Date createDate;		// 작성일
	private Date modifyDate;		// 수정일
	private String status;			// 기본(Y),삭제(N)
	private String noticeCon;		//clob to String용 객체
}
