package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Reservation;

public interface MyPageService {
	
	// 예약리스트 조회용 서비스
	int selectReservListCount(String userId);
	
	ArrayList<Reservation> selectReservList(PageInfo pi, String userId);
	
	ArrayList<Reservation> alignReservList(String align, String userId);
	
	// 예약상세조회용 서비스
	Reservation selectDetailReserv(int reservNo);
		
	// 예약취소하기 서비스
	int deleteReserv(int reservNo); // Reservation객체를 넘겨줘야되나?
	
	// 호스트, 공간 신고하기 서비스
	int reportHostandSpace(String userIdHost, int spcNo);
	

}
