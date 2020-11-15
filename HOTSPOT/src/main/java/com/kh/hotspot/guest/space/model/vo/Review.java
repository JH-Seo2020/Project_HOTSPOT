package com.kh.hotspot.guest.space.model.vo;

import java.sql.Clob;
import java.sql.Date;

//어노테이션 붙이기 
public class Review {
	
	private int reviewNo;
	private int spcNo;
	private String reviewWriter;	//리뷰작성자닉네임
	private String reviewTitle;
	private Clob reviewContent;
	private int reviewScore;
	private Date reviewDate;
	private String reviewStatus;
	private String reviewReply;

}
