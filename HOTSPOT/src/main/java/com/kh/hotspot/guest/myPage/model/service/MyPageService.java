package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.voices.model.vo.VoicesInquiry;

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
	int selectMyReviewListCount(String userId); // 총게시물 갯수
	
	ArrayList<Review> selectMyReviewList(PageInfo pi, String userId);
	
	
	// 이용후기 작성하기 서비스
	Reservation selectEnrollFormReview(int reservNo);
	
	int insertMyReview(int reservNo);
	
	// 이용후기 수정하기 서비스
	int updateMyReview(int reviewNo);
	
	//이용후기 삭제하기 서비스
	int deleteMyReview(int reviewNo);
	
	
	// Qna리스트 조회용 서비스 
	int selectMyQnaListCount(String userId);
	
	ArrayList<Qna> selectMyQnaList(PageInfo pi, String userId);
	
	// Qna작성하기는 공간에서 가능 그래서 없어두 됨!
	
	// Qna삭제하기 서비스
	int deleteMyQna(int qaNo, String userId);
	
	
	// 1:1고객문의
	int selectMyInquiryListCount(String userId);
	
	ArrayList<VoicesInquiry> selectMyInquiryList(PageInfo pi, String userId);
	
	// 1:1고객문의 작성하기
	int insertMyInquiry(String userId);
	
	
	// 1:1고객문의 삭제하기 서비스
	int deleteMyInquiry(int inquiryNo);
	
	
	
	

}
