package com.kh.hotspot.guest.space.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotspot.admin.model.vo.Report;
import com.kh.hotspot.common.model.vo.PageInfo;
import com.kh.hotspot.guest.myPage.model.vo.Member;
import com.kh.hotspot.guest.myPage.model.vo.Wish;
import com.kh.hotspot.guest.space.model.dao.SpaceDetailDao;
import com.kh.hotspot.guest.space.model.vo.Qna;
import com.kh.hotspot.guest.space.model.vo.SpaceInfo;
import com.kh.hotspot.guest.space.model.vo.SpaceNotes;
import com.kh.hotspot.guest.space.model.vo.Review;
import com.kh.hotspot.guest.space.model.vo.SpaceImages;

@Service
public class SpaceDetailServiceImpl implements SpaceDetailService {
	
	@Autowired
	private SpaceDetailDao spaceDetailDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public SpaceInfo selectSpaceDetail(int spcNo) {
		
		return spaceDetailDao.selectSpaceDetail(sqlSession, spcNo);
	}

	@Override
	public ArrayList<SpaceImages> selectSpaceImages(int spcNo) {
		
		return spaceDetailDao.selectSpaceImages(sqlSession,spcNo);
	}

	@Override
	public ArrayList<SpaceNotes> selectSpaceNotes(int spcNo) {
		
		return spaceDetailDao.selectSpaceNotes(sqlSession,spcNo);
	}
	
	@Override
	public Member selectWhoIsHost(int spcNo) {
		
		return spaceDetailDao.selectWhoIsHost(sqlSession, spcNo);
	}

	@Override
	public int selectReviewListCount(int spcNo) {
		
		return spaceDetailDao.selectReviewListCount(sqlSession, spcNo);
	}
	
	@Override
	public ArrayList<Review> selectUserReviewDetail(int spcNo, PageInfo pi) {

		return spaceDetailDao.selectUserReviewDetail(sqlSession, spcNo, pi);
	}

	@Override
	public int selectQnaListCount(int spcNo) {
		
		return spaceDetailDao.selectQnaListCount(sqlSession, spcNo);
	}

	@Override
	public ArrayList<Qna> selectQnaDetail(int spcNo, PageInfo pi) {

		return spaceDetailDao.selectQnaDetail(sqlSession, spcNo, pi);
	}

	@Override
	public int insertReport(Report report) {
		
		return spaceDetailDao.insertReport(sqlSession, report);
	}

	@Override
	public int insertQuestion(Qna qna) {
		
		return spaceDetailDao.insertQuestion(sqlSession, qna);
	}

	@Override
	public int insertLike(Wish wish) {
		
		return spaceDetailDao.insertLike(sqlSession, wish);
	}

	@Override
	public int deleteLike(Wish wish) {
		
		return spaceDetailDao.deleteLike(sqlSession, wish);
	}

	@Override
	public int checkLike(Wish wish) {
		
		return spaceDetailDao.checkLike(sqlSession, wish);
	}

	@Override
	public ArrayList<SpaceInfo> selectStartTime() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SpaceInfo> selectEndTime() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}


}
