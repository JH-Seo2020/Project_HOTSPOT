package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.UserReview;

public interface SpaceDetailService {
	
	//4.공간클릭시 세부조회기능
	SpaceInfo selectSpaceDetail();
	
	//4-1.세부공간 후기조회
	ArrayList<UserReview> selectUserReviewDetail();
	
	//4-2.세부공간 QnA조회
	ArrayList<Qna> selectQnaDetail();
	
	//4-3.신고등록
	int insertReport();
	
	//4-4.찜하기등록
	int insertLike();
	
	//4-5.가능한 시작시간 조회 
	ArrayList<SpaceInfo> selectStartTime();
	
	//4-6.가능한 종료시간 조회
	ArrayList<SpaceInfo> selectEndTime();
	
	//4-7.질문등록
	int insertQuestion();

}
