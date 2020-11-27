package com.kh.hotspot.guest.myPage.model.vo;

import java.sql.Date;

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
public class Member {
	
	private String userId;		// 회원아이디
	private String userType;	// 회원유형(Guest/Host/admin)
	private String userPwd;		// 회원비밀번호
	private String newUserPwd;  // 새비밀번호
	private String userNickname; // 닉네임
	private String userEmail;	 // 회원이메일
	private String userPhone;	 // 회원전화번호
	private String userProfile;	 // 프로필사진
	private String userProfileC; // 프로필사진 수정명
	private String profilePath;	 // 프로필사진 경로
	private String userStatus;	 // 회원상태
	private Date enrollDate;	 // 가입날짜
	private Date modifyDate;	 // 수정날짜
	private Date withdrawalDate; // 탈퇴날짜
	private String userMemo;	 // 회원에 대한 메모
	

}
