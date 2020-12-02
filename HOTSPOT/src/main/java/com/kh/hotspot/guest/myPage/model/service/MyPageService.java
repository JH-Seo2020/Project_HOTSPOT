package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Reservation;

public interface MyPageService {
	
	// 예약리스트 조회용 서비스
	int selectReservListCount(String userId);
	
	ArrayList<Reservation> selectReservList(PageInfo pi, String userId);
	
	ArrayList<Reservation> alignReservList(String align, String userId); // 정렬하기
	
	// 예약상세조회용 서비스
	Reservation selectDetailReserv(int reservNo, String userId);
		
	// 예약취소하기 서비스
	int deleteReserv(int reservNo);
	
	// 호스트 신고하기 서비스
	int reportReserv(Report rp);
	

}
