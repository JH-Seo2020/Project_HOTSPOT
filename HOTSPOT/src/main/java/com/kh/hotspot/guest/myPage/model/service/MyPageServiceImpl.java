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
	public int selectDetailReview(int reviewNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	@Override
	public int insertMyReview(int reservNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateMyReview(int reservNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteMyReview(int reservNo) {
		// TODO Auto-generated method stub
		return 0;
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
	public int deleteMyQna(int QnaNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	/**
	 * 1:1고객문의
	 */

	@Override
	public int selectMyInquiryListCount(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<VoicesInquiry> selectMyInquiryList(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int deleteMyInquiry(int inquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	




	
	
	

}
