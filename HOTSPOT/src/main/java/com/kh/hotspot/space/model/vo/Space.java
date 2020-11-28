package com.kh.hotspot.space.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Space {
		
	private int spcNo;			// 공간번호
	private String spcName;		// 공간명
	private String spcInt;		//공간한줄소개
	private String spcLong; 	//공간소개
	private String spcTag;		//공간태그
	private String spcType;		//공간카테고리
	private String spcMin;		//수용최소인원
	private String spcMax;		//수용최대인원
	private String spcImg;		//대표이미지원본명
	private String spcChimg;	//대표이미지경로
	private String spcPrice;	//기본가격
	private String spcHours;	//영업시간
	private String spcHoliday;	//휴무일
	private String spcStatus;	//게제 Y, 삭제 N
	private String spcConvn;	//편의사항
	private String userId;		//호스트아이디
	private String latitude;	//위도 Y!!!
	private String longitude;	//경도 X !!!
	private String location;	//공간위치
	
	// 유의사항
	private ArrayList<SpcNotes> noteList; 
	// 상세이미지
	private ArrayList<SpcImages> imgList;
	
	
}
