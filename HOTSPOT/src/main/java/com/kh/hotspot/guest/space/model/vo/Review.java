package com.kh.hotspot.guest.space.model.vo;

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
public class Review {
	
	private int reviewNo;
	private int spcNo;
	private String reviewWriter;	//리뷰작성자아이디
	private String reviewTitle;
	private Clob reviewContent;
	private int reviewScore;
	private Date reviewDate;
	private String reviewStatus;
	private String reviewReply;
	private String userNickname;
	private String userProfileCh;
	private String profilePath;
	private String reviewCon;
	
	private String reservNo; 	   // 예약번호
	private String reservUseDate;  // 이용날짜
	private String spcName;	 	  // 공간명
	private String spcType;       // 공간타입
	private String location;
	

}
