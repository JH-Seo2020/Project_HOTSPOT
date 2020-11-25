package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.space.model.dao.SpaceDao;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
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
	public SpaceInfo selectReservView(int spcNo, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePaymentInfo(int reservNo) {
		// TODO Auto-generated method stub
		return 0;
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
	public ArrayList<Review> selectReviewsForHomep(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
