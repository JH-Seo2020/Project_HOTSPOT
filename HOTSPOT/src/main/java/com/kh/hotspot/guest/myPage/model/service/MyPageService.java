package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
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
	 * 이용후기
	 * 
	 */
	// 이용후기리스트 조회용 서비스
	int selectMyReviewListCount(String userId); // 총게시물 갯수
	
	ArrayList<Review> selectMyReviewList(PageInfo pi, String userId);
	
	// 이용후기 작성하기 서비스
	Reservation selectReviewEnrollForm(int reservNo);

	int insertMyReview(Review rv);
	
	// 이용후기 수정하기 서비스
	Review selectUpdateMyReviewForm(Review rv);
	int updateMyReview(Review rv);
	
	//이용후기 삭제하기 서비스
	int deleteMyReview(int reviewNo);
	
	
	
	
	/**
	 * Q & A
	 * 
	 */
	// Qna리스트 조회용 서비스 
	int selectMyQnaListCount(String userId);
	ArrayList<Qna> selectMyQnaList(PageInfo pi, String userId);
	
	// Qna삭제하기 서비스
	int deleteMyQna(int qaNo);
	
	
	/**
	 * 1:1고객문의
	 * 
	 */
	// 1:1고객문의
	int selectMyInquiryListCount(String userId);
	
	ArrayList<VoicesInquiry> selectMyInquiryList(PageInfo pi, String userId);
	
	// 1:1고객문의 작성하기
	int insertMyInquiry(VoicesInquiry vi);
	
	
	// 1:1고객문의 삭제하기 서비스
	int deleteMyInquiry(int inquiryNo);
	
	
	
	/**
	 * 찜한공간
	 */
	int selectMyWishListCount(String userId);
	
	ArrayList<SpaceInfo> selectMyWishList(PageInfo pi, String userId);
	
	int deleteWish(int spcNo, String userId);

}
