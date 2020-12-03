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
public class SpaceInfo {
	
	private int spcNo;
	private String spcName;
	private String spcInt;		//공간한줄소개
	private String spcLong; 	//공간소개
	private String spcTag;		//공간태그
	private String spcType;		//공간카테고리
	private String spcMin;		//수용최소인원
	private String spcMax;		//수용최대인원
	private String spcImg;		//대표이미지원본명
	private String spcChimg;	//대표이미지경로/수정명
	private String spcPrice;	//기본가격
	private String spcHours;	//영업시간
	private String spcHoliday;	//휴무일
	private String spcStatus;	//게제 Y, 삭제 N
	private String spcConvn;	//편의사항
	private String userId;		//회원아이디(호스트겠지?)
	private String latitude;	//위도
	private String longitude;	//경도
	private String location;	//공간위치
	private int reviews;
	private int wishes;
	private Clob reviewContent;
	private int reviewScore;
	private Date reviewDate;
	private String reviewCon;	//CLOB String으로 받으려고 만들었음
	
	private int reviewCount;	// 공간의 총 리뷰수
	private int wishCount;		// 공간의 총 위시수
	

}
