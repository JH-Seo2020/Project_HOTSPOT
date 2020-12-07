package com.kh.hotspot.guest.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.dao.MyPageDao;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.voices.model.vo.VoicesInquiry;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDao mpDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/**
	 * 예약리스트
	 */
	@Override
	public int selectReservListCount(String userId) {
		return mpDao.selectReservListCount(sqlSession, userId);
	}
	

	@Override
	public ArrayList<Reservation> selectReservList(PageInfo pi, String userId) {
		return mpDao.selectReservList(sqlSession, pi, userId);
	}
	

	@Override
	public ArrayList<Reservation> alignReservList(String align, String userId) {
		return mpDao.alignReservList(sqlSession, align, userId);
	}

	@Override
	public Reservation selectDetailReserv(int reservNo, String userId) {
		return mpDao.selectDetailReserv(sqlSession, reservNo, userId);
	}

	@Override
	public int deleteReserv(int reservNo) {
		return mpDao.deleteReserv(sqlSession, reservNo);
	}

	@Override
	public int reportReserv(Report rp) {
		return mpDao.reportReserv(sqlSession, rp);
	}


	/**
	 * 이용후기
	 */
	@Override
	public int selectMyReviewListCount(String userId) {
		return mpDao.selectMyReviewListCount(sqlSession, userId);
	}


	@Override
	public ArrayList<Review> selectMyReviewList(PageInfo pi, String userId) {
		return mpDao.selectMyReviewList(sqlSession, pi, userId);
	}

	
	@Override
	public Reservation selectReviewEnrollForm(int reservNo) {
		return mpDao.selectReviewEnrollForm(sqlSession, reservNo);
	}
	

	@Override
	public int insertMyReview(Review rv) {
		return mpDao.insertMyReview(sqlSession, rv);
	}
	
	
	@Override
	public Review selectUpdateMyReviewForm(Review rv, String userId) {
		return mpDao.selectUpdateMyReviewForm(sqlSession, rv, userId);
	}



	@Override
	public int updateMyReview(Review rv) {
		return mpDao.updateMyReview(sqlSession, rv);
	}


	@Override
	public int deleteMyReview(int reviewNo) {
		return mpDao.deleteMyReview(sqlSession, reviewNo);
	}


	/**
	 * Qna
	 */
	@Override
	public int selectMyQnaListCount(String userId) {
		return mpDao.selectMyQnaListCount(sqlSession, userId);
	}


	@Override
	public ArrayList<Qna> selectMyQnaList(PageInfo pi, String userId) {
		return mpDao.selectMyQnaList(sqlSession, pi, userId);
	}


	@Override
	public int deleteMyQna(int qaNo) {
		return mpDao.deleteMyQna(sqlSession, qaNo);
	}

	
	/**
	 * 1:1고객문의
	 */

	@Override
	public int selectMyInquiryListCount(String userId) {
		return mpDao.selectMyInquiryListCount(sqlSession, userId);
	}


	@Override
	public ArrayList<VoicesInquiry> selectMyInquiryList(PageInfo pi, String userId) {
		return mpDao.selectMyInquiryList(sqlSession, pi, userId);
	}

	
	@Override
	public int insertMyInquiry(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMyInquiry(int inquiryNo) {
		return mpDao.deleteMyInquiry(sqlSession, inquiryNo);
	}


	@Override
	public int selectMyWishListCount(String userId) {
		return mpDao.selectMyWishListCount(sqlSession, userId);
	}


	@Override
	public ArrayList<SpaceInfo> selectMyWishList(PageInfo pi, String userId) {
		return mpDao.selectMyWishList(sqlSession, pi, userId);
	}




	

	
	




	
	
	

}
