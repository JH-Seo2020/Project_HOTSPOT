package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.Review;

public interface SpaceService {
	
	//1.장소분류 이모티콘 클릭 시 검색되는 기능
	ArrayList<SpaceInfo> selectSpaceKindList(String spcType);
	
	//2.오늘의공간 조회기능
	ArrayList<SpaceInfo> selectTodaySpace();
	
	//3.이용자후기 조회기능
	ArrayList<Review> selectUserReview(int spcNo);
	
	//5.예약하기 기능
	SpaceInfo selectReservView(int spcNo, String userId);
	
	//6.결제하기 기능
	int updatePaymentInfo(int reservNo);
	

}
