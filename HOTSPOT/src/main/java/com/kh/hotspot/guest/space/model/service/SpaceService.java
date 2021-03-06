package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.guest.space.model.vo.Review;

public interface SpaceService {
	
	//1.장소분류 이모티콘 클릭 시 검색되는 기능
	ArrayList<SpaceInfo> selectSpaceKindList(String spcType);
	
	//2.오늘의공간 조회기능
	ArrayList<SpaceInfo> selectTodaySpace();
	
	//3.이용자후기 조회기능
	ArrayList<SpaceInfo> selectUserReview();
	
	//5.예약하기 기능
	SpaceInfo selectReservView(int spcNo, String userId);
	//호스트정보가져와서 뿌려주기
	HostInfo hostInfo(Reservation reserv);
	//예약미리insert
	int insertReservation(Reservation r);
	//예약번호 다시가져오기
	int selectRightBeforeReserv(Reservation r);
	
	//6.결제하기 기능
	int updatePaymentInfo(Reservation reservUp);
	//예약삭제기능
	int deleteReserv(int reservNo);

	



	
	//7-1.호스트공간-호스트정보(프사,닉네임)
	Member selectHostInfoForHomep(String userId);
	
	//7-2.호스트의 공간들
	ArrayList<SpaceInfo> selectHostSpacesForHomep(String userId);
	
	//7-3.호스트의 후기들 카운트
	int selectCountReviewForHomep(String userId);
	
	//7-4.호스트 후기들 조회
	ArrayList<Review> selectReviewsForHomep(String userId, PageInfo pi);
	

}
