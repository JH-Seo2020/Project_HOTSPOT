package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;

public interface SpaceDetailService {
	
	//4.공간클릭시 세부조회기능
	SpaceInfo selectSpaceDetail(int spcNo);
	
	//4-1.세부이미지들 조회
	ArrayList<SpaceImages> selectSpaceImages(int spcNo);
	
	//4-2.유의사항들 조회
	ArrayList<SpaceNotes> selectSpaceNotes(int spcNo);
	//호스트프로필조회용
	Member selectWhoIsHost(int spcNo);
	
	//세부공간후기들 개수조회
	int selectReviewListCount(int spcNo);
	//4-3.세부공간 후기조회
	ArrayList<Review> selectUserReviewDetail(int spcNo, PageInfo pi);
	
	//4-4.세부공간 QnA조회
	ArrayList<Qna> selectQnaDetail(int spcNo);
	
	//4-5.신고등록
	int insertReport(Report report);
	
	//4-6.찜하기등록
	int insertLike(String userId);
	
	//4-7.가능한 시작시간 조회 
	ArrayList<SpaceInfo> selectStartTime();
	
	//4-8.가능한 종료시간 조회
	ArrayList<SpaceInfo> selectEndTime();
	
	//4-9.질문등록
	int insertQuestion();
	
	//4-10.찜하기 해제
	int deleteLike();
	
	//4-11.질문하기 기능!!
	int insertQuestion(Qna qna);

}
