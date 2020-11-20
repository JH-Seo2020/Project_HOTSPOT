package com.kh.hotspot.admin.model.vo;

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
public class Report {
	
	private int reportNo;			// 신고번호
	private int spcNo;				// 공간번호
	private int reviewNo;			// 후기번호
	private String reportType1;		// 신고유형
	private String reportType2;		// 신고유형상세
	private String reportWriter;	// 신고자
	private String reportTarget;	// 신고대상
	private String reportContent;	// 신고내용
	private Date reportDate;		// 신고일
	private String reportStatus;	// 처리상태

}
