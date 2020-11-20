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
public class Review {
	
	private int reviewNo;			// 후기번호
	private int spcNo;				// 공간번호
	private String reviewWriter;	// 작성자
	private String reviewTitle;		// 제목
	private String reviewContent;	// 내용
	private String reviewScore;		// 별점
	private Date reviewDate;		// 작성일
	private String reviewStatus;	// 후기상태
	private String reviewReply;		// 후기댓글
	
}
