package com.kh.hotspot.guest.myPage.model.vo;

import java.sql.Date;

// 어노테이션 붙이기
public class Report {
	
	private int reportNo; 			// 신고번호
	private int spcNo;				// 공간번호
	private int reviewNo;			// 후기번호
	private String reportType1; 	// 신고유형(게스트신고,호스트신고,공간신고)
	private String reportType2; 	// 신고유형상세(기물파손,서비스불만족...)
	private String reportWriter;	// 회원아이디
	private String reportTarget;	// 신고대상
	private String reportContent;	// 신고내용
	private Date reportDate;		// 신고일
	private String reportStatus; 	// 처리상태(접수완료/처리중/처리완료)

}
