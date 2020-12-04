package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.dao.SpaceDao;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.Reservation;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.host.model.vo.HostInfo;
import com.kh.hotspot.guest.space.model.vo.Review;

@Service
public class SpaceServiceImpl implements SpaceService {
	
	@Autowired
	private SpaceDao spaceDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<SpaceInfo> selectSpaceKindList(String spcType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SpaceInfo> selectTodaySpace() {
		
		return spaceDao.selectTodaySpace(sqlSession);
	}

	@Override
	public ArrayList<SpaceInfo> selectUserReview() {
		
		return spaceDao.selectUserReview(sqlSession);
	}

	@Override
	public HostInfo hostInfo(Reservation reserv) {
		
		return spaceDao.hostInfo(sqlSession, reserv);
	}
	
	@Override
	public SpaceInfo selectReservView(int spcNo, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePaymentInfo(Reservation reservUp) {
		
		return spaceDao.updatePaymentInfo(sqlSession, reservUp);
	}

	
	//호스트홈피관련
	@Override
	public Member selectHostInfoForHomep(String userId) {

		return spaceDao.selectHostInfoForHomep(sqlSession, userId);
	}

	@Override
	public ArrayList<SpaceInfo> selectHostSpacesForHomep(String userId) {
		
		return spaceDao.selectHostSpacesForHomep(sqlSession,userId);
	}

	@Override
	public int selectCountReviewForHomep(String userId) {

		return spaceDao.selectCountReviewForHomep(sqlSession, userId);
	}
	
	@Override
	public ArrayList<Review> selectReviewsForHomep(String userId, PageInfo pi) {
		
		return spaceDao.selectReviewsForHomep(sqlSession,userId, pi);
	}

	//예약기능
	@Override
	public int insertReservation(Reservation r) {
		
		return spaceDao.insertReservation(sqlSession,r);
	}

	@Override
	public int selectRightBeforeReserv(Reservation r) {
		
		return spaceDao.selectRightBeforeReserv(sqlSession, r);
	}

	@Override
	public int deleteReserv(int reservNo) {
		
		return spaceDao.deleteReserv(sqlSession, reservNo);
	}



}
