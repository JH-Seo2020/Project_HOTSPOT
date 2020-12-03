package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;

public interface MyPageService {
	
	/**
	 * 나의 예약리스트
	 * 
	 */
	// 예약리스트 조회용 서비스
	int selectReservListCount(String userId);
	
	ArrayList<Reservation> selectReservList(PageInfo pi, String userId); // 예약리스트 조회
	
	ArrayList<Reservation> alignReservList(String align, String userId); // 예약리스트 정렬하기
	
	// 예약상세조회용 서비스
	Reservation selectDetailReserv(int reservNo, String userId);
		
	// 예약취소하기 서비스
	int deleteReserv(int reservNo);
	
	// 호스트 신고하기 서비스
	int reportReserv(Report rp);
	
	
	
	/**
	 * 이용후기 / 문의관리
	 * 
	 */
	// 이용후기리스트 조회용 서비스
	int selectMyReviewListCount(String userId);
	
	ArrayList<Review> selectMyReviewList(PageInfo pi, String userId, int reservNo);
	
	// 이용후기 작성하기 서비스
	int insertMyReview(int reservNo);
	
	// 이용후기 수정하기 서비스
	int updateMyReview(int reservNo);
	
	//이용후기 수정하기 서비스
	int deleteMyReview(int reservNo);
	
	
	

}
